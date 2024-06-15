/**
 * Created by Lenovo on 2016/9/13.
 */
window.onload = function () {
    //需求：点击足有按钮实现旋转木马。
        //原理：点击右侧按钮，让3号盒子的样式赋值给2号盒子，然后2->1,1->5,5->4,4->3。。。
        //左侧同理。
    //步骤：
    //1.鼠标放到轮播图上，两侧的按钮显示，移开隐藏。
    //2.让页面加载出所有的盒子的样式。
    //3.把两侧按钮绑定事件。(调用同一个方法，只有一个参数，true为正向旋转，false为反向旋转)
    //4.书写函数。
        // (操作数组。正向旋转：删除数组中第一个样式，添加到数组中的最后一位)
        // (操作数组。反向旋转：删除数组中最后一个样式，添加到数组中的第一位)


    var json = [
        {   //  1
            width:400,
            top:70,
            left:50,
            opacity:20,
            z:2
        },
        {  // 2
            width:600,
            top:120,
            left:0,
            opacity:80,
            z:3
        },
        {   // 3
            width:800,
            top:100,
            left:200,
            opacity:100,
            z:4
        },
        {  // 4
            width:600,
            top:120,
            left:600,
            opacity:80,
            z:3
        },
        {   //5
            width:400,
            top:70,
            left:750,
            opacity:20,
            z:2
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

    //2.让页面加载出所有的盒子的样式。
    //for(var i=0;i<liArr.length;i++){
    //    //利用animate()框架让指定的属性，缓慢运动到指定位置。
    //    animate(liArr[i],{
    //        "width":json[i].width,  //第一个li，必须对应第一个数组元素中的第一个的指定属性
    //        "top":json[i].top,
    //        "left":json[i].left,
    //        "opacity":json[i].opacity,
    //        "zIndex":json[i].z
    //    });
    //    //liArr[i].style.width = json[i].width+"px";
    //    //liArr[i].style.top = json[i].top+"px";
    //    //liArr[i].style.left = json[i].left+"px";
    //    //liArr[i].style.opacity = json[i].opacity/100;
    //    //liArr[i].style.zIndex = json[i].z;
    //}


    move();
    //3.把两侧按钮绑定事件。(调用同一个方法，只有一个参数，true为正向旋转，false为反向旋转)
    //arrowChildren[0].
    //arrowChildren[1].
    //利用for...in...绑定事件。绑定后利用元素的className属性知道是前一个还是后一个，然后调用函数。
    for(var k in arrowChildren){
        arrowChildren[k].onclick = function () {
            if(this.className === "prev"){
                if(flag === true){
                    flag = false;
                    move(true);
                    //点击一次立刻修改为false，这样儿别人就不能在点击。（点击也不执行move()）
                }
            }else{
                if(flag){
                    flag = false;
                    move(false);
                }
            }
        }
    }

    //4.书写函数。
    // (操作数组。正向旋转：删除数组中第一个样式，添加到数组中的最后一位)
    // (操作数组。反向旋转：删除数组中最后一个样式，添加到数组中的第一位)
    function move(bool){
        //判断：如果等于undefined,那么就不执行这两个if语句
        //if(bool === true || bool === false){
        if(bool !== undefined){
            if(bool){
                // (操作数组。反向旋转：删除数组中最后一个元素，添加到数组中的第一位)
                //json.push();//在最后添加
                //json.pop();//删除最后一位
                //json.unshift();//在最前面添加
                //json.shift();//删除第一位

                //var ele = json.pop();
                //json.unshift(ele);
                json.unshift(json.pop());
            }else{
                // (操作数组。正向旋转：删除数组中第一个元素，添加到数组中的最后一位)
                //var ele = json.shift();
                //json.push(ele);
                json.push(json.shift());
            }
        }
        //在次为页面上的所有li赋值属性，利用缓动框架
        for(var i=0;i<liArr.length;i++){
            //利用animate()框架让指定的属性，缓慢运动到指定位置。
            animate(liArr[i],{
                "width":json[i].width,  //第一个li，必须对应第一个数组元素中的第一个的指定属性
                "top":json[i].top,
                "left":json[i].left,
                "opacity":json[i].opacity,
                "zIndex":json[i].z
            }, function () {
                //回调函数，所有程序执行完毕，在初始化flag的值为true
                flag = true;
            });
        }
    }

}