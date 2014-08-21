<h1>side bar</h1>
<div>
	<ul class="nav nav-pills nav-stacked">
		<li><a href="#">拥有图书:${session.ShiroUser?.numOwnedBook}</a></li>
		<li><a href="#">借入图书:${session.ShiroUser?.numBorrowedBook}</a></li>
		<li><a href="#">借出图书:${session.ShiroUser?.numLendedBook}</a></li>
	</ul>
</div>