angular.module('intiFileUpload', [])
.directive('fileUploader', function($http){
	return{
		restrict: 'A',
        scope: {
        	url: '=',
        	onSuccess: '&'
        },
        link: function(scope, element, attr){
        	$(element).fileupload({
        		url: scope.url,
                dataType: 'json',
                done: function (e, data) {
                	scope.onSuccess({ fileName: data.result.name });
                },
                add: function(e, data){
                    var uploadFile = data.files[0];
//                    if (!(/\.(gif|jpg|jpeg|png)$/i).test(uploadFile.name)) {
//                        alert('El archivo ingresado es incorrecto. Por favor ingrese uno correcto (.gif|.jpg|.jpeg|.png)');
//                        return;
//                    }
//                    if (uploadFile.size > 2000000) { // 2mb
//                        alert('Por favor seleccione una imagen mas peque�a, m�ximo 2 MB');
//                        return;
//                    }
                	
                    data.submit();
                },
                fail: function (e, data) {
                    // data.errorThrown
                    // data.textStatus;
                    // data.jqXHR;
                	//onError(data.errorThrown);
                	alert(data.errorThrown);
                }
            });
        }
	};
});