<div id="wrapper">
	<div id="header" style="line-height:none">
          <div id="joomla" style="line-height:none"><img src="../images/admin/header_text.png" width = "1100"></div>
	</div>
 
	<div class="header-menu" style="display:none">
	<div class="AdminMenu">
    
		<div class="Menu-Horizontal">
			<ul class="Menu">
				<li class="Menu-WithChildren" {if $user_level neq 1} style="display:none"{/if}>
					<a href="javascript:();" class="Menu-Link" title="Quản trị cấp cao">
						<img src="../images/admin/taikhoan.png" alt="Quản trị cấp cao">Quản trị cấp cao</a>
					<ul>
                    	<li class="Menu-Leaf">
							<a href="?listUnit&mod=units" class="Menu-Link" title="Danh sách đơn vị">
								<img src="../images/admin/group_icon.png" width=16 /> Quản lý đơn vị</a>							
						</li>
                        <li class="Menu-Leaf">
							<a href="?listDepartment&mod=departments" class="Menu-Link" title="Danh sách phòng ban">
								<img src="../images/admin/depart_icon.png" width=16 /> Quản lý phòng ban</a>							
						</li>
                        <li class="Menu-Leaf">
							<a href="?listObject&mod=objects" class="Menu-Link" title="Danh sách chức vụ">
								<img src="../images/admin/card_icon.png" width=16 /> Quản lý chức vụ</a>							
						</li>
						<li class="Menu-Leaf">
							<a href="?listUser&mod=users" class="Menu-Link" title="Danh sách quản trị">
								<img src="../images/admin/key_icon.png" width=16 /> Danh sách quản trị</a>
						</li>
					</ul>
				</li>
                
				<li class="Menu-WithChildren" {if $user_level neq 1} style="display:none"{/if}>
					<a href="javascript:();" class="Menu-Link" title="Quản lý hệ thống">
						<img src="../images/admin/quangcao.png" alt="Quản lý hệ thống">Hệ thống</a>
					<ul>
						<li class="Menu-Leaf">
							<a href="?editConfig&mod=config" class="Menu-Link" title="Cấu hình website">
								<img src="../images/admin/config.png" width=16 /> Cấu hình website</a>
						</li>
						<li class="Menu-Leaf">
							<a href="?sysStat&mod=config" class="Menu-Link" title="Thống kê hệ thống">
								<img src="../images/admin/report_icon.gif" width=16 /> Thống kê hệ thống</a>
						</li>
                        <li class="Menu-Leaf">
							<a href="?listModule&mod=modules" class="Menu-Link" title="Quản lý module">
								<img src="../images/admin/module.jpeg" width=16 /> Quản lý module</a>
						</li>
					</ul>
				</li>
				
				<li class="Menu-WithChildren">
					<a href="javascript:();" class="Menu-Link" title="Quản lý nội dung">
						<img src="../images/admin/quanlynoidung.png" alt="Quản lý nội dung">Quản lý Nội dung</a>
					<ul>
						{section name=mi loop=$module_list_user}
                       	{if $module_list_user[mi]->mod_name eq 'levels'}
                        <li class="Menu-Leaf" style="display:none">
							<a href="?listLevel&mod=levels" class="Menu-Link" title="Cấp bầu cử">
								Cấp bầu cử</a>
						</li>
                        {elseif $module_list_user[mi]->mod_name eq 'provinces'}
                        <li class="Menu-Leaf">
							<a href="?listProvince&mod=provinces" class="Menu-Link" title="Thành phố (Tỉnh)">
								Thành phố (Tỉnh)</a>
						</li>
                        {elseif $module_list_user[mi]->mod_name eq 'terms'}
                        <li class="Menu-Leaf">
							<a href="?listTerm&mod=terms" class="Menu-Link" title="Nhiệm kỳ quốc hội">
								Nhiệm kỳ quốc hội</a>
						</li>
                        {elseif $module_list_user[mi]->mod_name eq 'persons'}
                        <li class="Menu-WithChildren">
                            <a href="javascript:();" class="Menu-Link" title="Tiện ích">
                                Cấp quốc hội</a>
                            <ul>
                                <li class="Menu-Leaf">
                                    <a href="?listPerson&mod=persons&person_level=1" class="Menu-Link" title="Quản lý ứng viên">
                                        Quản lý ứng viên</a>
                                </li>
                                <li class="Menu-Leaf">
                                    <a href="?listVotebox&mod=voteboxs&votebox_level=1" class="Menu-Link" title="Quản lý hòm phiếu">
                                        Quản lý hòm phiếu</a>
                                </li>
                            </ul>
                        </li>
                        {/if}
                                                 
                       	{/section}
                        					
					</ul>
				</li>
                
				<li class="Menu-WithChildren">
					<a href="javascript:();" class="Menu-Link" title="Quản lý chức năng">
						<img src="../images/admin/tuvan.png" alt="Quản lý chức năng"> Chức năng</a>
					<ul>
                    	{section name=mi loop=$module_list_user}
                      	{if $module_list_user[mi]->mod_name eq 'blocks'}
						<li class="Menu-Leaf">
							<a href="?listBlock&mod=blocks" class="Menu-Link" title="Công cụ tạo Block">
								<img src="../images/admin/categories.png" width=16 /> Công cụ tạo Block</a>
						</li>
                        {/if}
                       	{/section}
					</ul>
				</li>
				<li class="Menu-WithChildren">
					<a href="javascript:();" class="Menu-Link" title="Tiện ích">
						<img src="../images/admin/dichvu.png" alt="Tiện ích"> Tiện ích</a>
					<ul>
						<li class="Menu-Leaf">
							<a href="../?" class="Menu-Link" title="Trang chủ">
								<img src="../images/admin/home-icon.gif" width=20 /> Trang chủ</a>
						</li>
						<li class="Menu-Leaf">
							<a href="?logout" class="Menu-Link" title="Thoát">
								<img src="../images/admin/close-icon.gif" width=20 /> Thoát</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
        
	</div>
	</div>
</div>