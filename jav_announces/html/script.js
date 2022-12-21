$(function(){
    $('.container-anuncio').hide();

    window.addEventListener('message' , function(event){
        const data = event.data

        if(data.action == 'show:announce') {
            $('.container-anuncio').removeClass('anuncio-out');
            $('.container-anuncio').show();
            $('.container-anuncio').addClass('anuncio-in');
            $('#icono').attr('class' , data.icon)
            $('.mensaje').text(data.message)
            $('#titulo').text(data.title)
            setTimeout(function(){
                $('.container-anuncio').removeClass('anuncio-in');
                $('.container-anuncio').addClass('anuncio-out');
                setTimeout(function(){
                    $('.container-anuncio').hide();
                }, 550)
            } , data.time)
        }
    })
})