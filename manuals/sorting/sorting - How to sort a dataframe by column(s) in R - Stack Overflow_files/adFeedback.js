(function(root) {

  var $ = root.jQuery;
  var BlockCookieName = 'azk-blocks';

  var VoteEvent = {
    upvote:        10,
    downvote:      11,
    uninteresting: 12,
    misleading:    13,
    offensive:     14,
    repetitive:    15,
    other:         16,
    close:         17
  };

  var VotingMode = {
    downUp:  1,
    closeAd: 2
  }

  root.azRegisterExtension('adFeedback', function(divName, pixels, mode) {
    if ($ === undefined) return;

    var ad = $('#' + divName);
    var voteInProgress = false;
    var voteComplete = false;

    var castVoteForThisCreative = function(type) {
      if (pixels[type] !== undefined) {
        $('body').append("<img src='" + pixels[type] + "' height=0 width=0 />");
      }
    };

    $(function() {
      switch(mode){
        case VotingMode.closeAd:
          // This allows for custom "close button" divs.
          // If there is an element on the page with a class of 
          // 'adzerk-custom-close-button', it will be used instead of the 
          // default adzerk-close-button, which is an 'X' icon.
          var closeButton;
          var customButton = $('.adzerk-custom-close-button');
          if (customButton.length) {
            closeButton = $('<div>').append(customButton.clone()).html();
          } else {
            closeButton = "<div class='adzerk-close-button'></div>";
          }

          ad.addClass('adzerk-vote').append(
            "<div class='adzerk-close-control' style='display:none;'>" +
              closeButton +
            "</div>");

          var x = ad.find(".adzerk-close-control");

          // Show X button when hovering over ad
          ad.hover(
            function() {
              if (!voteInProgress) {
                x.stop(true, true).fadeIn(250);
              }
            },
            function() {
              if (!voteInProgress) {
                x.stop(true, true).fadeOut(250);
              }
            }
          );

          // When the close 'x' is clicked, downvote the ad and collapse the div
          x.click(function() {
            castVoteForThisCreative(VoteEvent.downvote);
            castVoteForThisCreative(VoteEvent.close);
            ad.fadeOut();
          });

          break;

        case VotingMode.downUp:
        default:
          ad.addClass('adzerk-vote').append(
            "<div class='adzerk-vote-controls' style='display:none;'>" +
              "<div class='adzerk-vote-option adzerk-vote-up'><div class='adzerk-vote-icon'></div></div>" +
              "<div class='adzerk-vote-option adzerk-vote-down'><div class='adzerk-vote-icon'></div></div>" +
            "</div>" +
            "<div class='adzerk-vote-survey' style='display:none;'>" +
              "<form>" +
                "<span>No problem. We won't show you that ad again. Why didn't you like it?</span>" +
                "<ul>" +
                  "<li><label><input type='radio' value='" + VoteEvent.uninteresting + "' name='downvoteReason' />Uninteresting</label></li>" +
                  "<li><label><input type='radio' value='" + VoteEvent.misleading    + "' name='downvoteReason' />Misleading</label></li>" +
                  "<li><label><input type='radio' value='" + VoteEvent.offensive     + "' name='downvoteReason' />Offensive</label></li>" +
                  "<li><label><input type='radio' value='" + VoteEvent.repetitive    + "' name='downvoteReason' />Repetitive</label></li>" +
                  "<li><label><input type='radio' value='" + VoteEvent.other         + "' name='downvoteReason' />Other</label></li>" +
                "</ul>" +
                "<a href='#' class='adzerk-vote-cancel'>Oops! I didn't mean to do this.</a>" +
              "</form>" +
            "</div>");

          var controls = ad.find(".adzerk-vote-controls");
          var survey   = ad.find(".adzerk-vote-survey");

          var showResponse = function() {
            voteInProgress = false;
            voteComplete = true;
            survey.hide();
            var thanks = $("<div class='adzerk-vote-response'>Thanks!</div>");
            thanks.appendTo(controls).hide().fadeIn(250).delay(3000).fadeOut(250, function() {
              $(this).remove();
            });
          };

          // Show vote controls when hovering over ad
          ad.hover(
            function() {
              if (!voteInProgress) {
                controls.stop(true, true).fadeIn(250);
              }
            },
            function() {
              if (!voteInProgress) {
                controls.stop(true, true).fadeOut(250);
              }
            }
          );

          // When up arrow is clicked, display a thank you message
          controls.find(".adzerk-vote-up").click(function() {
            if (!voteInProgress && !voteComplete) {
              $(this).addClass("selected");
              castVoteForThisCreative(VoteEvent.upvote);
              showResponse();
            }
            return false;
          });

          // When down arrow is clicked, display the survey to ask why the user didn't like the ad
          controls.find(".adzerk-vote-down").click(function() {
            if (!voteInProgress && !voteComplete) {
              $(this).addClass("selected");
              voteInProgress = true;
              survey.fadeIn(250);
            }
            return false;
          });

          survey.find(".adzerk-vote-cancel").click(function() {
            controls.children("div").removeClass("selected");
            voteInProgress = false;
            survey.fadeOut(250);
            return false;
          });

          // When a survey option is selected, show a brief thank you and then hide it
          survey.find("li").click(function() {
            var vote = survey.find("input:checked").val()
            if (vote) {
              castVoteForThisCreative(VoteEvent.downvote);
              castVoteForThisCreative(vote);
              showResponse();
            }
          });

      }



    });
  });

})(this);
