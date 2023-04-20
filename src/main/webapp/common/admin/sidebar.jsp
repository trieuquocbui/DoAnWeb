<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="/admin/home" class="brand-link"> <img
		src='<c:url value="/templates/admin/dist/img/AdminLTELogo.png"/>'
		alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
		style="opacity: .8"> <span class="brand-text font-weight-light">TN-TT
			Shop</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">


		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">


				<li class="nav-item"><a href="#" class="nav-link">  
				<i class="fas fa-chart-bar"></i>
						<p>


							Thống Kê<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">


						<li class="nav-item"><a
							href='<c:url value="/admin/management/statistical/receipt"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Doanh thu</p>
						</a></li>

						<li class="nav-item"><a
							href='<c:url value="/admin/management/statistical/receipt"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Lợi nhuận</p>
						</a></li>

						<li class="nav-item"><a
							href='<c:url value="/admin/management/statistical/receipt"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Nhập hàng</p>
						</a></li>

						<li class="nav-item"><a
							href='<c:url value="/admin/management/statistical/receipt"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Sản phẩm bán được</p>
						</a></li>

					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-users-cog"></i>
						<p>
							Quản Lý Nhân Viên<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/staff/list"/>'
							class="nav-link"> <i class="fas fa-address-book"></i>
								<p>Danh sách nhân viên</p>
						</a></li>

						<li class="nav-item"><a
							href='<c:url value="/admin/management/staff/add"/>'
							class="nav-link"> <i class="fas fa-registered"></i>
								<p>Cập nhật tài khoản</p>
						</a></li>


					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-users"></i>
						<p>
							Quản Lý Khách Hàng<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/customer/list"/>'
							class="nav-link"> <i class="fas fa-address-book"></i>
								<p>Danh sách khách hàng</p>
						</a></li>

					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-box-tissue"></i>
						<p>
							Quản Lý Nhập Hàng<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/receipt/list"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Danh sách nhập hàng</p>
						</a></li>
						<li class="nav-item"><a
							href='<c:url value="/admin/management/receipt/quantity"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Lập phiếu nhập hàng</p>
						</a></li>

					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-box-open"></i>
						<p>
							Quản Lý Sản Phẩm<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/product/list"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Danh sách sản phẩm</p>
						</a></li>
						<li class="nav-item"><a
							href='<c:url value="/admin/management/product/add"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Cập nhật sản phẩm</p>
						</a></li>

					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-dolly"></i>
						<p>
							Quản Lý Đơn Hàng<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/order/list"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Chưa duyệt</p>
						</a></li>
						<li class="nav-item"><a
							href='<c:url value="/admin/management/order/list/approved"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Đã duyệt</p>
						</a></li>

					</ul></li>

				

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-truck"></i>
						<p>
							Quản Lý Nhà Cung Cấp<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/supplier/list"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Danh sách nhà cung cấp</p>
						</a></li>

						<li class="nav-item"><a
							href='<c:url value="/admin/management/supplier/add"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Cập nhật nhà cung cấp</p>
						</a></li>
					</ul></li>

				
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fa fa-unlink"></i>
						<p>
							Quản Lý Khuyến Mãi<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/supplier/list"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Danh sách khuyến mãi</p>
						</a></li>

						<li class="nav-item"><a
							href='<c:url value="/admin/management/supplier/add"/>'
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Cập nhật khuyến mãi</p>
						</a></li>
					</ul></li>
					
					<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-bars"></i>
						<p>
							Quản Lý Danh Mục<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a
							href='<c:url value="/admin/management/category/list"/>'
							class="nav-link"> <i class="fas fa-list-ul"></i>
								<p>Danh sách danh muc</p>
						</a></li>
						<li class="nav-item"><a
							href='<c:url value="/admin/management/category/add"/>'
							class="nav-link"> <i class="fas fa-list-ul"></i>
								<p>Tạo danh muc</p>
						</a></li>

					</ul></li>

				



			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>


<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
</aside>


