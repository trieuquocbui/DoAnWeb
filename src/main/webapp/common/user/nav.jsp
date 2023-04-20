<%@ include file="/common/taglib.jsp"%>
<div class="nav">
	<ul class="nav__list">
		<c:forEach var="category" items="${listOfCategory}">
			<li class="nav__list__item"><a class="nav__list__item--link"
				href="/user/home/${category.id}"> <i
					class="fa fa-chevron-right" aria-hidden="true"></i> <span>${category.name}</span>
			</a></li>
		</c:forEach>
	</ul>
</div>