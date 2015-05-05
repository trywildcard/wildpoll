import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.join("topic:subtopic", {}, chan => {
// })

class App {
  static init(){
    var addBoxHere = $('#addBoxHere');
    var answerBoxNum = $('.answer-box').size() ;

    $('#addBox').click(function() {
      answerBoxNum += 1;
      $('<div class="form-group answer-box"><label for="polls[answer' + answerBoxNum
        + ']">Answer ' + answerBoxNum 
        + '</label><input type="text" name="polls[answer' + answerBoxNum 
        + ']" class="form-control" value=""/></div>').appendTo(addBoxHere);
      return false;
    });
    
    $('#removeBox').click(function() {
      answerBoxNum -= 1;
      $('.answer-box').last().remove();
      return false;
    });
  }
}
$( () => App.init() );
export default App
