$(function(){
  function buildHTML(message){
    
    if (message.image) {
      var html = 
        `<div class="message">
           <div class="message__list-info">
             <p class="message__list-info__name">
               ${message.user_name}
             </p>
             <p class="message__list-info__date">
               ${message.created_at}
             </p>
           </div>
           <div class="message__text">
             <p class="message__text">
               ${message.content}
             </p>
             </div>
             <img src=${message.image} >
        </div>`
      return html;
    } else {
      var html = 
       `<div class="message">
          <div class="message__list-info">
            <p class="message__list-info__name">
              ${message.user_name}
            </p>
            <p class="message__list-info__date">
              ${message.created_at}
            </p>
          </div>
          <div class="message__text">
            <p class="message__text">
              ${message.content}
            </p>
          </div>`
      return html;
    };
    
  }



  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);    	
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});　
      $('form')[0].reset();
      $('.submit-btn').prop('disabled', false);
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
      $('form')[0].reset();
    })
  });
});