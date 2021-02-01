/*
* author: www.somethingwhat.com
*/
var cat = window.cat || {};
cat.touchjs = {
    left: 0,
    top: 0,
    scaleVal: 1,    //缩放
    rotateVal: 0,   //旋转
    curStatus: 0,   //记录当前手势的状态, 0:拖动, 1:缩放, 2:旋转
    //初始化
    init: function ($targetObj, callback) {
        touch.on($targetObj, 'touchstart', function (ev) {
            cat.touchjs.curStatus = 0;
            ev.preventDefault();//阻止默认事件
        });
        if (!window.localStorage.cat_touchjs_data)
            callback(0, 0, 1, 0);
        else {
            var jsonObj = JSON.parse(window.localStorage.cat_touchjs_data);
            cat.touchjs.left = parseFloat(jsonObj.left), cat.touchjs.top = parseFloat(jsonObj.top), cat.touchjs.scaleVal = parseFloat(jsonObj.scale), cat.touchjs.rotateVal = parseFloat(jsonObj.rotate);
            callback(cat.touchjs.left, cat.touchjs.top, cat.touchjs.scaleVal, cat.touchjs.rotateVal);
        }
    },
    //拖动
    drag: function ($targetObj, callback) {
        touch.on($targetObj, 'drag', function (ev) {
            $targetObj.css("left", cat.touchjs.left + ev.x).css("top", cat.touchjs.top + ev.y);
        });
        touch.on($targetObj, 'dragend', function (ev) {
            cat.touchjs.left = cat.touchjs.left + ev.x;
            cat.touchjs.top = cat.touchjs.top + ev.y;
            callback(cat.touchjs.left, cat.touchjs.top);
        });
    },
    //缩放
    scale: function ($targetObj, callback) {
        var initialScale = cat.touchjs.scaleVal || 1;
        var currentScale;
        touch.on($targetObj, 'pinch', function (ev) {
            if (cat.touchjs.curStatus == 2) {
                return;
            }
            cat.touchjs.curStatus = 1;
            currentScale = ev.scale - 1;
            currentScale = initialScale + currentScale;
            cat.touchjs.scaleVal = currentScale;
            var transformStyle = 'scale(' + cat.touchjs.scaleVal + ') rotate(' + cat.touchjs.rotateVal + 'deg)';
            $targetObj.css("transform", transformStyle).css("-webkit-transform", transformStyle);
            callback(cat.touchjs.scaleVal);
        });

        touch.on($targetObj, 'pinchend', function (ev) {
            if (cat.touchjs.curStatus == 2) {
                return;
            }
            initialScale = currentScale;
            cat.touchjs.scaleVal = currentScale;
            callback(cat.touchjs.scaleVal);
        });
    },
    //旋转
    rotate: function ($targetObj, callback) {
        var angle = cat.touchjs.rotateVal || 0;
        touch.on($targetObj, 'rotate', function (ev) {
            if (cat.touchjs.curStatus == 1) {
                return;
            }
            cat.touchjs.curStatus = 2;
            var totalAngle = angle + ev.rotation;
            if (ev.fingerStatus === 'end') {
                angle = angle + ev.rotation;
            }
            cat.touchjs.rotateVal = totalAngle;
            var transformStyle = 'scale(' + cat.touchjs.scaleVal + ') rotate(' + cat.touchjs.rotateVal + 'deg)';
            $targetObj.css("transform", transformStyle).css("-webkit-transform", transformStyle);
            $targetObj.attr('data-rotate', cat.touchjs.rotateVal);
            callback(cat.touchjs.rotateVal);
        });
    }
};