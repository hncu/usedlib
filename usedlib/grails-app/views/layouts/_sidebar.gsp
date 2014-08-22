<img style="width:150px;height:150px" src="${resource(dir: 'images/avatar', file: "${session.ShiroUser?.profile?.bAvatar}")}" alt="sidebar"/>
<div>
	<ul class="nav nav-pills nav-stacked">
		<li><a>${session.ShiroUser?.username}</a></li>
		<li><a href="#">拥有图书:${session.ShiroUser?.numOwnedBook}</a></li>
		<li><a href="#">借入图书:${session.ShiroUser?.numBorrowedBook}</a></li>
		<li><a href="#">借出图书:${session.ShiroUser?.numLendedBook}</a></li>
	</ul>
</div>