<?php
if(!isset($_SESSION)) session_start();
if($_SESSION['loged_in']) { ?>
		<div class="ui longer modal" id="user">
			<i class="close icon"></i>
			<div class="header">
				Informasi user
			</div>
			<div class="ui scrolling image content">
				<div class="ui medium image">
					<img src="assets/images/profile.png">
				</div>
				<div class="description">
					<table class="ui very basic very compact unstackable table">
						<tbody>
							<tr>
								<td>Nama</td>
								<td>:</td>
								<td>M. Arifin Ilham</td>
							</tr>
							<tr>
								<td>Kelas</td>
								<td>:</td>
								<td>XI RPL 1</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="actions">
      <div class="ui red ok button">
        logout
      </div>
    </div>
		</div>
<?php } else { ?>
		<div class="ui mini modal" id="login">
			<i class="close icon"></i>
			<div class="header">
				<i class="user icon"></i>
				Login
			</div>
			<div class="content">
				<form class="ui form">
					<div class="required field">
						<label>username</label>
						<input type="text" name="username" placeholder="username" maxlength="20" autocomplete="off">
					</div>
					<div class="required field">
						<label>password</label>
						<input type="password" name="password" placeholder="password" autocomplete="on">
					</div>
					<button class="ui submit primary fluid button" disabled="disabled">login</button>
					<div class="ui success message"></div>
					<div class="ui warning message"></div>
					<div class="ui error message"></div>
				</form>
			</div>
		</div>
<?php } ?>