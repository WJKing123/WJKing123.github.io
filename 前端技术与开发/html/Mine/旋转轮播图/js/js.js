/**
 * Created by Lenovo on 2016/9/13.
 */
window.onload = function () {
    var arr = [
        {   //  1
            width:400,
            top:70,
            left:50,
            opacity:20,
            zIndex:2
        },
        {  // 2
            width:600,
            top:120,
            left:0,
            opacity:80,
            zIndex:3
        },
        {   // 3
            width:800,
            top:100,
            left:200,
            opacity:100,
            zIndex:4
        },
        {  // 4
            width:600,
            top:120,
            left:600,
            opacity:80,
            zIndex:3
        },
        {   //5
            width:400,
            top:70,
            left:750,
            opacity:20,
            zIndex:2
        }
    ];

    //0.获取元素
    var slide = document.getElementById("slide");
    var liArr = slide.getElementsByTagName("li");
    var arrow = slide.children[1];
    var arrowChildren = arrow.children;
    //设置一个开闭原则变量，点击以后修改这个值。
    var flag = true;

    //1.鼠标放到轮播图上，两侧的按钮显示，移开隐藏。
    slide.onmouseenter = function () {
        //arrow.style.opacity = 1;
        animate(arrow,{"opacity":100});
    }
    slide.onmouseleave = function () {
        //arrow.style.opacity = 1;
        animate(arrow,{"opacity":0});
    }

    move();
    //3.把两侧按钮绑定事件。(调用同一个方法，只有一个参数，true为正向旋转，false为反向旋转)
    arrowChildren[0].onclick = function () {
        if(flag){
            flag = false;
            move(true);
        }
    }
    arrowChildren[1].onclick = function () {
        if(flag){
            flag = false;
            move(false);
        }
    }

    //4.书写函数。
    function move(bool){
        //判断：如果等于undefined,那么就不执行这两个if语句
        if(bool === true || bool === false){
            if(bool){
                arr.unshift(arr.pop());
            }else{
                arr.push(arr.shift());
            }
        }
        //在次为页面上的所有li赋值属性，利用缓动框架
        for(var i=0;i<liArr.length;i++){
            animate(liArr[i],arr[i], function () {
                flag = true;
            });
        }
    }

}