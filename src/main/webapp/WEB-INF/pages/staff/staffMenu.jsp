<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">

    <div class="menu_dropdown bk_2">
        <dl id="menu-members">
            <a style="margin-left: 16px; color: #5f41ff;">工号:${user.number} </a><br/><a
                style="margin-left: 16px"> 欢迎登陆！</a>
            <hr style="border-color: #e5e5e5;"/>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe72b;</i> 窗口管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/findWindowByWid" title="窗口列表">窗口列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-canteen">
            <dt><i class="Hui-iconfont">&#xe66a; </i>菜品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/findProductByWid" title="商品列表">菜品列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe648;</i> 食堂评价<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/foreComment" title="评价列表">评价列表</a></li>

                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe687;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/staffOrderA" title="订单列表">已下单</a></li>
                    <li><a href="/staffOrderB" title="订单列表">已备餐</a></li>
                    <li><a href="/staffOrderC" title="订单列表">已取餐</a></li>
                </ul>
            </dd>
        </dl>

    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<!--/_menu 作为公共模版分离出去-->
