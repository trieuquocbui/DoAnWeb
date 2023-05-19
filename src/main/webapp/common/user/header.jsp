<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
 <div class="header">
          <div class="row">
            <div class="col l-3">
              <div class="header__logo">
                <a class="header__logo-link" href='<c:url value="/user/home"/>'>
                  <img
                    src="/assets/image/logo.jpg"
                    alt="Trang chủ Smartphone Store"
                    title="Trang chủ Smartphone Store"
                  />
                </a>
              </div>
            </div>
            <div class="col l-6 flex-center">
              <div class="header__search">
                <form
                  class="header__search__form"
                  method="get"
                  action="home"
                >
                  <div class="header__search__form--content flex-center">
                    <input
                      id="search-box"
                      value="${paging.search}"
                      name="search"
                      autocomplete="off"
                      type="text"
                      placeholder="Nhập từ khóa tìm kiếm..."
                    />
                    <button type="submit">
                      <i class="fa fa-search"></i>
                      Tìm kiếm
                    </button>
                  </div>
                </form>
              </div>
            </div>

            <div class="col l-3">
              <div class="header__tool flex-center">
                <div class="header__tool__cart flex-center mr-10">
                  <a
                    class="header__tool__cart--link flex-center"
                    href="/user/cart"
                  >
                    <div class="header__tool__cart--icon flex-center">
                      <i class="fa fa-shopping-cart"></i>
                    </div>
                    <span>Giỏ hàng</span>
                    <span class="cart-number"></span>
                  </a>
                </div>

                <div class="header__tool__member flex-center">
                  <a
                    class="header__tool__cart--link flex-center"
                    href="/login"
                  >
                    <div class="header__tool__cart--icon flex-center">
                      <i class="fa fa-user"></i>
                    </div>
                    <span>Đăng nhập</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>