/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

/**
 * 前端主功能脚本文件
 * 功能：实现侧边菜单折叠、响应式布局控制
 * 负责页面交互与菜单自适应逻辑
 */
(function ($) {
    "use strict";// 开启严格模式，规范代码编写
    // 主应用对象，包含页面所有初始化功能
    var mainApp = {
// 核心初始化方法：配置页面交互功能
        initFunction: function () {
            /*MENU
            ------------------------------------*/
            $('#main-menu').metisMenu();
// 监听页面加载 & 窗口缩放事件，控制侧边栏折叠
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });
        },
// 入口方法：调用核心初始化函数
        initialization: function () {
            mainApp.initFunction();

        }
    };
    // Initializing ///

    $(document).ready(function () {
        mainApp.initFunction();
    });

}(jQuery));
