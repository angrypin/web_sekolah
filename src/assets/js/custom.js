const listHash = ['#home', '#fasilitas', '#kelas', '#prestasi'],
hashHandler = (hash, parent='') => {
	if(!hash) return false;
	if(hash === userPage)
		$(hash).modal('show');
	else if(listHash.includes(hash)) {
		$([document.documentElement, document.body]).animate({
			scrollTop: $(hash).offset().top
		}, 0);
	}

	if(parent && parent.hasClass('sidebar'))
		parent.sidebar('hide');
},
resizePopup = () => {
	$('.ui.table tbody td span').css('max-height', $(window).height());
},
theme = (value) => {
	console.log(value);
	localStorage.theme = value !== undefined ? value : 'dark';
	dark = localStorage.theme === 'dark';

	$('.theme-changer').html(`<i class="${dark ? 'moon' : 'sun'} icon"></i>${localStorage.theme} theme`);

	if(dark) {
		$('head').append('<link rel="stylesheet" type="text/css" href="assets/css/dark.css">');
		$('.ui.menu, .ui.table').addClass('inverted');
		userPageHandler();
	} else {
		$('link[href*="dark.css"]').remove();
		$('.ui.menu, .ui.table').removeClass('inverted');
		userPageHandler();
	}
},
userPageHandler = (change=false,target='') => {
	if(userPage === '#login') {
		$('#login').modal({
			transition: 'fly down'
		});

		$('#login .ui.form').form({
			fields: {
				username: {
					identifier: 'username',
					rules: [{
						type: 'empty',
						prompt: 'username harus diisi'
					}, {
						type: 'regExp',
						value: nameRegex,
						prompt: 'username hanya berisi alfabet, angka, garis dan garis bawah'
					}, {
						type: 'maxLength[20]',
						prompt: 'panjang username maksimal 20'
					}]
				},
				password: {
					identifier: 'password',
					rules: [{
						type: 'empty',
						prompt: 'passwordnya dong'
					}]
				}
			},
			inline: true,
			onSuccess: () => {
				$('#login .ui.submit').attr('disabled', false);
				return false;
			},
			onFailure: () => {
				$('#login .ui.form').removeClass('success warning error').addClass('error');
				$('#login .ui.submit').attr('disabled', true);
				return false;
			}
		});

		$('#login .ui.submit').api({
			url: 'login.php',
			method: 'POST',
			serializeForm: true,
			beforeSend: () => {
				['success', 'warning', 'error'].forEach(x => {
					$(`#login .ui.${x}.message`).empty();
				});
				return true;
			},
			onResponse: (resp) => {
				const respName = resp.success ? 'success' : 'warning';
				$('#login .ui.form').removeClass('success warning error').addClass(respName);
				$(`#login .ui.${respName}.message`).html(`<p>${resp.message}</p>`);
				if(resp.success)
					userPageHandler(true, '#login');
			},
			onError: (err) => {
				$('#login .ui.form').addClass('error');
				$('#login .ui.error.message').html(`<p>${err}</p>`);
			}
		});
	} else if(userPage === '#user') {
		$('#user').modal({
			transition: 'zoom',
			onApprove: () => {
				$.ajax({
					url: 'logout.php',
					method: 'GET'
				});
				userPageHandler(true, '#user');
			}
		});
	}

	if(change) {
		userPage = target === '#login' ? '#user' : '#login';
		$('.list-menu a.item').toArray().forEach(a => {
			if($(a).attr('href') === target)
				$(a).attr('href', userPage).text(userPage.replace('#', ''));
		});

		$.ajax({
			url: 'user-page.php',
			method: 'GET',
			beforeSend: () => {
				$(target).modal('hide').remove();
			},
			success: (resp) => {
				$('#user-page').html(resp);
				userPageHandler();
				$(location).attr('hash', userPage);
				hashHandler(userPage);
			}
		});
	}
	if(dark) {
		$('#login, #user').addClass('basic');
		$('#login .ui.button, #user .ui.button').addClass('inverted');
	} else {
		$('#login, #user').removeClass('basic');
		$('#login .ui.button, #user .ui.button').removeClass('inverted');
	}
};

$(window).scroll(function() {
	if(this.scrollY != 0)
		$('.ui.menu.custom').removeClass('top').removeClass('secondary')
	else
		$('.ui.menu.custom').addClass('top').addClass('secondary')
});

$(window).resize(function(e) {
	resizePopup();
});

$(document).ready(() => {
	const hash = $(location).attr('hash');
	hashHandler(hash);
	$('.ui.table').tablesort();
	$('.ui.table tbody td span').popup({
		hoverable: true,
		position: 'top center',
		lastResort: 'top center',
		onShow: () => {
			resizePopup();
		}
	});
});

$('.ui.sidebar').sidebar({
	transition: 'overlay',
	mobileTransition: 'overlay'
}).sidebar('attach events', '#my-btn');

$('a.item').click(function() {
	const href = $(this).attr('href'),
	parent = $(this).parent();
	hashHandler(href, parent);
});

$('.theme-changer').click(function() {
	theme(dark ? 'light' : 'dark');
	if($(this).parent().hasClass('sidebar'))
		$(this).parent().sidebar('hide');
});
theme(localStorage.theme);
userPageHandler();