import Kitura
import HeliumLogger
import LoggerAPI

Log.logger = HeliumLogger()

let router = Router()

router.all(middleware: StaticFileServer())

private func redirectHtml(_ name: String, _ response: RouterResponse) {
  do {
    response.headers["Content-Type"] = "text/html; charset=utf-8"
    let path = "./public/\(name).html"
    try response.status(.OK)
      .send(fileName: path)
      .end()
  } catch {
    Log.error("Failed to link \(name).html")
  }
}

router.get("/about") { request, response, next in
  redirectHtml("about", response)
  next()
}

router.get("/store") { request, response, next in
  redirectHtml("store", response)
  next()
}

router.get("/blog") { request, response, next in
  redirectHtml("blog", response)
  next()
}

router.all { request, response, next in
  if response.statusCode == .notFound {
    if  request.originalURL != "/"  &&  request.originalURL != ""  {
      do {
        response.headers["Content-Type"] = "text/html; charset=utf-8"
        let path = "./public/notFound.html"
        try response.send(fileName: path).end()
      } catch {
        Log.error("Failed to send reponse \(error)")
      }
    }
  }
  next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
