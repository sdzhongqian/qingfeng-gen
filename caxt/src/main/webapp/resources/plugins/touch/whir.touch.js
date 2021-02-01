var whir = window.whir || {};

whir.touch = {
    scaleVal: 1,
    rotateVal: 0,
    transformX: 0,
    transformY: 0,
    rotateStarVal: 0,
    curStatus: 0,//当前手势状态, 0:未开始, 1:缩放, 2:旋转
    reset: function ($targetObj) {
        whir.touch.transformX = 0;
        whir.touch.transformY = 0;
        whir.touch.scaleVal = 1;
        whir.touch.rotateVal = 0;
        $targetObj.css('left', '0').css('top', '0');
        $targetObj.css('transform', '');
        $targetObj.css('-webkit-transform', '');
        $targetObj.attr('data-transformx', '0');
        $targetObj.attr('data-transformy', '0');
        $targetObj.attr('data-scale', '1');
        $targetObj.attr('data-rotate', '0');
    },
    init: function ($origalObj, $targetObj) {
        this.scaleVal = 1;
        this.rotateVal = 0;
        this.transformX = 0;
        this.transformY = 0;
        var transform = $origalObj.css('transform');

        var transformx = parseFloat(($origalObj.attr('data-css-transformx') || '0').replace('%', ''));
        var transformy = parseFloat(($origalObj.attr('data-css-transformy') || '0').replace('%', ''));
        
        var rotate = parseFloat(($origalObj.attr('data-css-rotate') || '0').replace('deg', ''));
        var scale = parseFloat(($origalObj.attr('data-css-scale') || '1'));
        var imgWidth = $targetObj.parent().width();
        var imgHeight = $targetObj.parent().height();
        transformx = transformx / 100 * (imgWidth);
        transformy = transformy / 100 * (imgHeight);
        
        this.transformX = transformx;
        this.transformY = transformy;
        this.scaleVal = scale;
        this.rotateVal = rotate;

        //var transformStyle = 'scale(' + this.scaleVal + ') rotate(' + this.rotateVal + 'deg) translate(' + this.transformX + 'px,' + this.transformY + 'px)';
        var transformStyle = 'scale(' + this.scaleVal + ') rotate(' + this.rotateVal + 'deg)';
        $targetObj.css('transform', transformStyle).css('-webkit-transform', transformStyle);
        $targetObj.css("left", this.transformX).css("top", this.transformY);

        $targetObj.attr('data-transformX', this.transformX);
        $targetObj.attr('data-transformY', this.transformY);
        $targetObj.attr('data-scale', this.scaleVal);
        $targetObj.attr('data-rotate', this.rotateVal);

        touch.config.minRotationAngle = 10;
        //touch.config.minScaleRate = 0;
    },
    //拖动
    drag: function ($targetObj) {
        touch.on($targetObj, 'touchstart', function (ev) {
            whir.touch.curStatus = 0;
            $targetObj.attr('data-transformX', whir.touch.transformX).attr('data-transformY', whir.touch.transformY);
            ev.preventDefault();
        });

        touch.on($targetObj, 'drag', function (ev) {
            var left = parseFloat($targetObj.attr('data-transformX')) + ev.x;
            var top = parseFloat($targetObj.attr('data-transformY')) + ev.y;

            whir.touch.transformX = left;
            whir.touch.transformY = top;

            //var transformStyle = 'scale(' + whir.touch.scaleVal + ') rotate(' + whir.touch.rotateVal + 'deg) translate(' + whir.touch.transformX + 'px,' + whir.touch.transformY + 'px)';
            var transformStyle = 'scale(' + whir.touch.scaleVal + ') rotate(' + whir.touch.rotateVal + 'deg)';
            $targetObj.css("transform", transformStyle).css("-webkit-transform", transformStyle);
            $targetObj.css("left", whir.touch.transformX).css("top", whir.touch.transformY);
        });
        touch.on($targetObj, 'dragend', function (ev) {
            $targetObj.attr('data-transformX', whir.touch.transformX);
            $targetObj.attr('data-transformY', whir.touch.transformY);
        });
    },
    //缩放
    scale: function ($targetObj) {
        var initialScale = whir.touch.scaleVal || 1;
        var currentScale;
        touch.on($targetObj, 'pinch', function (ev) {
            if (whir.touch.curStatus == 2)
            {
                return;
            }
            whir.touch.rotateStarVal = ev.rotation;
            currentScale = ev.scale - 1;
            currentScale = initialScale + currentScale;

            whir.touch.scaleVal = currentScale;

            //var transformStyle = 'scale(' + whir.touch.scaleVal + ') rotate(' + whir.touch.rotateVal + 'deg) translate(' + whir.touch.transformX + 'px,' + whir.touch.transformY + 'px)';
            var transformStyle = 'scale(' + whir.touch.scaleVal + ') rotate(' + whir.touch.rotateVal + 'deg)';
            $targetObj.css("transform", transformStyle).css("-webkit-transform", transformStyle);
            $targetObj.css("left", whir.touch.transformX).css("top", whir.touch.transformY);

            $targetObj.attr('data-scale', currentScale);
        });

        touch.on($targetObj, 'pinchend', function (ev) {
            if (whir.touch.curStatus == 2) {
                return;
            }
            initialScale = currentScale;
            whir.touch.scaleVal = currentScale;
            $targetObj.attr('data-scale', currentScale);
        });
    },
    //旋转
    rotate: function ($targetObj) {
        var angle = whir.touch.rotateVal || 0;

        touch.on($targetObj, 'rotate', function (ev) {
            //if (whir.touch.curStatus == 1) {
            //    ev.stopPropagation();//阻止默认事件
            //    return;
            //}
            whir.touch.curStatus = 2;
            //$('.change_pic').text(ev.rotation + "," + whir.touch.rotateStarVal + "," + whir.touch.curStatus);
            var totalAngle = angle + ev.rotation;
            whir.touch.rotateStarVal = 0;
            if (ev.fingerStatus === 'end') {
                angle = angle + ev.rotation;
            }

            whir.touch.rotateVal = totalAngle;

            //var transformStyle = 'scale(' + whir.touch.scaleVal + ') rotate(' + whir.touch.rotateVal + 'deg) translate(' + whir.touch.transformX + 'px,' + whir.touch.transformY + 'px)';
            var transformStyle = 'scale(' + whir.touch.scaleVal + ') rotate(' + whir.touch.rotateVal + 'deg)';
            $targetObj.css("transform", transformStyle).css("-webkit-transform", transformStyle);
            $targetObj.css("left", whir.touch.transformX).css("top", whir.touch.transformY);

            $targetObj.attr('data-rotate', totalAngle);
        });
    }
};