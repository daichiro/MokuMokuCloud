 
jQuery(function ($) {
    'use strict';
    // kumo    
    function random(min, max) {
        var r = Math.floor(Math.random() * (max - min) + min);
        return r;
    }
    
    function setInitialPosition($p) {
        var p_width = $p.width(), width = $(window).width(), height = $(window).height(), positionY = random(0, height);
        $p.css('top', positionY);
        $p.css('left', width + p_width + 'px');
        return $p;
    }
    
    function run($obj, speed) {
        var o_width = $obj.width(), nextSpeed = random(10000, 30000), interval = random(500, 3000);
        $obj.show();
        $obj.animate({ left: -(o_width) + 'px'}, speed, 'linear', function () {
            $obj.hide();
            $obj.css('display', 'none');
            $obj = setInitialPosition($obj);
            window.console.log(interval);
            setTimeout(function () { run($obj, nextSpeed); }, interval, $obj);
        });
    }
    
    $('img.kumo').each(function () {
        var $p = $(this), speed = random(10000, 20000), interval = random(500, 5000);
        $p = setInitialPosition($p);
        window.console.log(interval);
        setTimeout(function () { run($p, speed); }, interval, $p);
    });
    
    // mokumoku
    $('#topIcon').jrumble({
        x: 10,
        y: 10,
        rotation: 4
    });

    $('#topIcon').hover(function () {
        $(this).trigger('startRumble');
    }, function () {
        $(this).trigger('stopRumble');
    });
    
    function writeAddress() {
        var element = document.getElementById('address'),
            pre = String.fromCharCode(109, 97, 105, 108, 58),
            addr = String.fromCharCode(100, 97, 49, 114, 111, 64, 109, 111, 107, 117, 109, 111, 107, 117, 46, 99, 108, 111, 117, 100);
        element.innerHTML = pre + ' ' + addr;
    }
    writeAddress();
});
