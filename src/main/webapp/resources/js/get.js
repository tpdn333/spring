/**
 *
 */
$(function () {
	function showModifyModal(rno) {
		$.ajax({
			tpye: "get",
			url: appRoot + "/replies/" + rno,
			success: function (reply) {
				$("#reply-rno-input2").val(reply.rno);
				$("#reply-replyer-input2").val(reply.replyer);
				$("#reply-replyerName-input2").val(reply.replyerName);
				$("#reply-reply-textarea2").text(reply.reply);
				$("#reply-modify-modal").modal("show");

				if (userid != reply.replyer) {
					$("#reply-modify-btn1").hide();
					$("#reply-delete-btn1").hide();
					$("#reply-reply-textarea2").attr("readonly", true);
				} else {
					$("#reply-modify-btn1").show();
					$("#reply-delete-btn1").show();
					$("#reply-reply-textarea2").removeAttr("readonly");
				}
			},
			error: function () {
				console.log("댓글 가져오기 실패");
			}
		});
	}
	function formatDatetime(datetime) {
		var date = new Date(datetime);
		var month = date.getMonth() + 1;
		var seconds = date.getSeconds();

		var replyMonth = month >= 10 ? month : '0' + month;
		var replySeconds = seconds >= 10 ? seconds : '0' + seconds;

		var formatted_date = date.getFullYear() + "-" + replyMonth + "-" + date.getDate() + " "
			+ date.getHours() + ":" + date.getMinutes() + ":" + replySeconds;
		return formatted_date;
	}
	function showReplyList(list) {
		var container = $("#reply-list-container").empty();

		for (var reply of list) {
			var replyHtml = `<li class="left clearfix" id="reply-${reply.rno}" data-rno="${reply.rno}">
								<div>
									<div class="header">
										<strong class="primary-font">${reply.replyerName}</strong>
										<small class="pull-right text-muted">${formatDatetime(reply.replyDate)}</small>
									</div>
									<p>${reply.reply}</p>
								</div>
							</li>`;
			var replyComponent = $(replyHtml).click(function () {
				showModifyModal($(this).attr("data-rno"));
			});
			container.append(replyComponent);
			/*
			var newItem = $("<li>").addClass("media")
				.attr("id", "reply-" + reply.rno)
				.attr("data-rno", reply.rno);
			var mediabody = $("<div>").addClass("media-body");
			newItem.append(mediabody);
			newItem.click(function () {
				showModifyModal($(this).attr("data-rno"));
			});
			mediabody.append('<h5 class="mt-0 mb-1">' + reply.replyer + ", </h5>")
				.append('<p>' + reply.reply + ", </p>")
				.append("<small>" + new Date(reply.replyDate).toISOString().split("T")[0] + " </small>");
			container.append(newItem);
			*/
		}

	}
	// 댓글 목록 가져오기
	function getReplyList() {
		$.ajax({
			type: "get",
			url: appRoot + "/replies/pages/" + boardBno,
			success: function (list) {
				console.log(list);
				showReplyList(list);
			},
			error: function () {
				console.log("댓글 요청 에러");
			}
		});
	}
	getReplyList();

	// 댓글 입력 버튼 처리
	$("#reply-insert-btn1").click(function () {
		var bno = $("#reply-bno-input1").val();
		var replyer = $("#reply-replyer-input1").val();
		var reply = $("#reply-reply-textarea1").val();

		var data = {
			bno: bno,
			reply: reply,
			replyer: replyer
		};

		$.ajax({
			type: "post",
			url: appRoot + "/replies/new",
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function () {
				console.log("댓글 입력 성공");
				// 모달창 닫고
				$('#reply-insert-modal').modal('hide');
				// 댓글 리스트 가져오고
				getReplyList();
				// 안내메세지 보여주기
				$("#alert1").removeAttr("hidden").text("새로운 댓글이 등록되었습니다.").addClass("show");
			},
			error: function () {
				console.log("댓글 입력 실패");
			}
		});
	});

	// 댓글 수정 버튼 클릭
	$("#reply-modify-btn1").click(function () {
		var rno = $("#reply-rno-input2").val();
		var bno = $("#reply-bno-input2").val();
		var reply = $("#reply-reply-textarea2").val();
		var replyer = $("#reply-replyer-input2").val();
		var data = {
			rno: rno,
			bno: bno,
			reply: reply,
			replyer: replyer
		};
		$.ajax({
			type: "put",
			url: appRoot + "/replies/" + rno,
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function () {
				console.log("댓글 수정 성공");
				// 모달창 닫고
				$('#reply-modify-modal').modal('hide');
				// 댓글 리스트 가져오고
				getReplyList();
				// 안내메세지 보여주기
				$("#alert1").removeAttr("hidden").text("댓글이 수정되었습니다.").addClass("show");
			},
			error: function () {
				console.log("댓글 수정 실패");
			}
		});
	});

	// 댓글 삭제 버튼 클릭
	$("#reply-delete-btn1").click(function () {
		var check = confirm("삭제 하시겠습니까?");

		if (check) {
			var rno = $("#reply-rno-input2").val();
			var replyer = $("#reply-replyer-input2").val();
			var data = {
				rno: rno,
				replyer: replyer
			};
			$.ajax({
				type: "delete",
				url: appRoot + "/replies/" + rno,
				data: JSON.stringify(data),
				contentType: "application/json",
				success: function () {
					// 모달 닫고
					$('#reply-modify-modal').modal('hide');
					// 댓글 가져오고
					getReplyList();
					// 안내메세지
					$("#alert1").removeAttr("hidden").text("댓글이 삭제되었습니다.").addClass("show");
				},
				error: function () {
					console.log("삭제 실패");
				}
			});
		}
	});
});