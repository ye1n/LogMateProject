// 메뉴 숨김/보임 기능

function openPop() {
	$('.menu-close').hide();
	$(".menu-open").show();
}

function exitPop() {
	$(".menu-open").hide();
	$('.menu-close').show();
}

function BodySetBackgroundColor(color) {
	document.querySelector('html').style.backgroundColor = color;
}

function changeTheme(color) {
	// default(회색) : #cbcfce
	var target = document.querySelector('html');
	if (color == 'grey') {
		BodySetBackgroundColor('#cbcfce');
		/*		BodySetColor('white');
				LinkSetColor('#bdc1c6');*/
	}

	// pink(분홍색) : #f5bfcc
	if (color == 'pink') {
		BodySetBackgroundColor('#f5bfcc');
	}

	// yellow(노란색) : #f5e97a
	if (color == 'yellow') {
		BodySetBackgroundColor('#f5e97a');
	}

	// skyblue(하늘) : #bfcfdd
	if (color == 'skyblue') {
		BodySetBackgroundColor('#bfcfdd');
	}

	// purple(보라색) : #bd9dc8
	if (color == 'purple') {
		BodySetBackgroundColor('#bd9dc8');
	}

	// beige(베이지색) : #e2d9ca
	if (color == 'beige') {
		BodySetBackgroundColor('#e2d9ca');
	}
}