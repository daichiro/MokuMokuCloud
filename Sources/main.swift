import Kitura
import KituraNet
import KituraSys

import LoggerAPI
import HeliumLogger

let router = Router()

Log.logger = HeliumLogger()

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
    if  request.originalUrl != "/"  &&  request.originalUrl != ""  {
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

let server = HTTPServer.listen(port: 8090, delegate: router)
Server.run()
