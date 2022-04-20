// summernote 실행
$(document).ready(function() {
    $('#summernote').summernote({
        callbacks : {
            onImageUpload : function(files) {
                for (var i = files.length; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i], this);
                }
            }
        }
    });
});
        
// summernote - 이미지 업로드
function uploadSummernoteImageFile(file, el) {
    data = new FormData();
    data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/summernoteImageUpload.do",
            contentType : false,
            enctype : 'multipart/form-data',
            processData : false,
            success : function(data) {
                $(el).summernote('editor.insertImage', data.url);
            }
            });
}

        
// 게시물 내용 저장
function testSubmit() {
    let markupStr = $('#summernote').summernote('code');
    let content = $('#content');
    content.attr('value', markupStr);

    let frm = $('#frm');
    frm.submit();
}

// 게시물 내용 가져오기
function CheckContent() {
    let markupStr = $('#summernote').summernote('code');
    alert(markupStr);
}

