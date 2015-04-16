function getAnswers () {
  var questionId = $('.post-container.question').attr('value');
  
  request("GET", '/questions/' + questionId + '/answers', null).done(function(response){
    console.log(response);

    var source = $("#answers-tpl").html();
    var template = Handlebars.compile(source);
    $(".answers-container").html(template(response));

    if(response.accepted_answer.length > 0) {
      console.log('true');
      acceptedAnswerVotes (response.accepted_answer);
    } else {
      var currentUserId = gon.current_user.id
      var questionUserId = $('.post-container.question').data('id');
      if(currentUserId === questionUserId){
        acceptAnswerButton();
      }
    };
  });
};

function toggleAnswerEditor () {
  var defaultButtonName = $('#add-answer-btn').attr('name');
  var buttonText = $('#add-answer-btn').val();
  console.log('click');
  
  $('#answer-editor-container').toggle('blind', 500);

  if( buttonText === defaultButtonName) {
    $('#add-answer-btn').val('Nevermind');  
  } else {
    $('#add-answer-btn').val(defaultButtonName);
  };

};

function submitAnswer (){
  // var data = $('#hidden-text-area').val()
  var currentUserId = gon.current_user.id;
  var questionId = $('.post-container.question').attr('value');
  var data = window.frames['richTextField'].document.body.innerHTML;
  console.log(data);
  
  request("POST", '/questions/' + questionId + '/answers', {answer:{content: data, question_id: questionId, user_id: currentUserId }}).done(function(){
    console.log('submit done');
  });
}

function toggleAnswerComments () {
  $('.answers-container').on('click', '#answer-comments-btn', function() {
    console.log('toggle Answer comments');
    $(this).next().toggle();
  });
};

function acceptAnswerButton () {
  $('.accepted-selector').append('<h3><a href="#", id:"accept-answer">Accept</a></h3>');
}

function acceptAnswer (answerId) {
  console.log(answerId);
  var currentUserId = gon.current_user.id
  request("PUT", '/answers/' + answerId, {answer:{accepted: true }}).done(function(){
    console.log('done');
    
  });
};


$(document).ready(function(){
  $('#add-answer-btn').on('click', toggleAnswerEditor);

  $('#answer-editor-container').on('click', $('#answer-submit'), submitAnswer);

  $('.answers-container').on('click', $('#accept-answer'), function(){
    var answerId = $('.post-container.answer').data('id');
    acceptAnswer (answerId);
  });
});

//---------------------------------------------------------------------

// function getAnswerComments (answerId) {
//   request("GET", '/answers/' + answerId + '/comments', null).done(function(response) {
//     console.log(response);

//     // Handlebars.registerPartial("answer-comment", $("#answer-comment-partial").html(response));
//     var source = $("#answer-comments-tpl").html();
//     var template = Handlebars.compile(source);
//     $(".answers-comments-container").html(template(response));
//   });
// };
// $('#answers-container').on('click', 'button', function() {
//   var answerId = $(this).data('id');
//   console.log(answerId);
//   getAnswerComments (answerId);
// });


