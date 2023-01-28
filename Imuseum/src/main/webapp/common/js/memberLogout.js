$().ready(function () {
    $("#confirmStart").click(function () {
        Swal.fire({
            title: '로그아웃',
            text: " 로그아웃 하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '로그아웃',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '로그아웃 완료.','로그아웃이 정상적으로 되었습니다.','success'
                )
                setTimeout(function(){
                	location.href="logout.do";
                },1500)
            }
        })
    });
});
