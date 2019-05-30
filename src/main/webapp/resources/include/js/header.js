var Gnb = (function(){
    var gnbOutTimer = null;
    var $gnbUl = $("#gnb .depth1_box ul"),
        $gnbLis = $gnbUl.children("li"),
        depth2Bg = $("#gnb .depth1_box .depth2_bg");

    function init(){
        setActive();
    }

    function addEvents(){
        $(window).on("scroll", function(){
            var posLeft = $(window).scrollLeft();
            var topBg = $(".top_bg");
            var topTitle = $(".top_title");
            var lnb = $("#lnb");

            if(posLeft > 0){
                TweenMax.set($("#header"), {x:-posLeft});

                if(topBg.css("position") == "fixed")TweenMax.set(topBg, {x:-posLeft});
                if(topTitle.css("position") == "fixed")TweenMax.set(topTitle, {x:-posLeft});
                if(lnb.css("position") == "fixed") TweenMax.set(lnb, {x:-posLeft});
            }else{
                TweenMax.set($("#header"), {x:0});

                if(topBg.css("position") == "fixed")TweenMax.set(topBg, {x:0});
                if(topTitle.css("position") == "fixed")TweenMax.set(topTitle, {x:0});
                if(lnb.css("position") == "fixed") TweenMax.set(lnb, {x:0});
            }
        })

        $(window).trigger("scroll");
    }

    function setBtns(){
        /*$gnbLis.on("mouseenter", function(){
            clearTimeout(gnbOutTimer);
            depth2Bg.removeClass("active");
            $gnbLis.removeClass("over");

            if($(this).children("div").hasClass("depth2")){
                depth2Bg.addClass("active");
            }
        }).on("mouseleave", function(){
            clearTimeout(gnbOutTimer);
            gnbOutTimer = setTimeout(function(){
                try{
                    var obj = $gnbUl.find(".depth1_"+globalDepth1);
                    if(obj.children("div").hasClass("depth2")) depth2Bg.addClass("active");
                    else depth2Bg.removeClass("active");
                    obj.addClass("over");
                }catch(e){
                    depth2Bg.removeClass("active");
                }
            }, 300)
        })*/
        $gnbLis.on("mouseenter", function(){
            if($(this).children("div").hasClass("depth2")){
                clearTimeout(gnbOutTimer);
                depth2Bg.addClass("active");
            }
        }).on("mouseleave", function(){
            clearTimeout(gnbOutTimer);
            gnbOutTimer = setTimeout(function(){
                depth2Bg.removeClass("active");
            }, 300)
        })

        /*$(".top_util .login a").on("click", function(){
            if(!$(this).hasClass("active")){
                $(this).addClass("active");
                $("#gnb .login_box").addClass("active");
            }else{
                $(this).removeClass("active");
                $("#gnb .login_box").removeClass("active");
            }
        })*/

        $(".login_box .email_save a").on("click", function(){
            var saveObj = $(".login_box .email_save");
            if(!saveObj.hasClass("active")){
                saveObj.addClass("active");
            }else{
                saveObj.removeClass("active");
            }
        })
    }

    function setActive(){
        try{
            $("#gnb .depth1_box").addClass("active");
            $("#gnb .depth1_"+globalDepth1).addClass("active");//.addClass("over");
            $("#gnb .depth2_"+globalDepth1+"_"+globalDepth2).addClass("active");
            /*if($("#gnb .depth1_"+globalDepth1).children("div").hasClass("depth2")){
                depth2Bg.addClass("active");
            }*/


            $("#lnb .lnb_"+globalDepth1+"_"+globalDepth2).addClass("on");
            try{ $("#lnb .lnb_"+globalDepth1+"_"+globalDepth2+"_"+globalDepth3).addClass("on");}catch (e){}
        }catch(e){}

    }

    return{
        init:init
    }
})();


