# Requirements

Your goal is to create a multiplayer Trivia game app, with rules loosely based on the popular HQ Trivia.

## The Game
The game consists of multiple rounds. In each round players are presented a question, a choice of answers, and have to select one answer within the allotted time (10 seconds or so). Players that chose a correct answer advance to the next round. Those who chose the wrong answers are eliminated. The game continues until there’s only one winner left.

## The Application
We’re leaving the choice of stack and architecture to you. You may decide to implement the app as Rails server deployed to Heroku and players using desktop or mobile browser to join the game, or you may go the route of running C++ server on your Linode instance and ask players to telnet into the game - the choice is yours.
In either case, be prepared to discuss your design and implementation choices in the follow-up interview. We’re curious to learn more about your thinking process.

## Requirements
- The application should run in completely automatic mode - i.e no admin intervention should be required to start the game (once a minimum number of players have joined) or advance the game to the next round.
- The application should allow running multiple games simultaneously.
- The application should allow a reasonably large number of players to participate in each game (think hundreds).
-	The application should display statistics about player choices at the end of each round (how many players have chosen each answer).

## Bits
- You’re free to choose the programming language, but we strongly encourage you to stick the one that is widely used - such as Ruby, Python, Java, or C++. At Assurance we mostly use Ruby and Python, so we expect all candidate to learn that.
- We expect to see a production-quality solution. Pay attention to the code formatting, naming conventions, comments, integration and unit tests and so on.
- Push your code to the public GitHub repository. Don’t squash everything in a single commit - we’re interested to see the progress, rather than just the final result.
