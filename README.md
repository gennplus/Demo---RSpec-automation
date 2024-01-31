# Ruby RSpec automation example
This is a Web UI test that opens two search engines (Duckduckgo and Google) sequentially and search for some phrase.
Then search results are parsed and printed out to console with analysis on the inclusion of words from phrase in the results.
Last part is a comparison of results from two browsers by title and printing common results to the console.

## Requirements
* You should have the following gems: `rspec` and `selenium-webdriver`
* Installed browsers and web-drivers compatible versions
* And Ruby itself.

## Approaches and techniques
* It's build on top of Ruby, RSpec and Selenium.
* I tried to follow programming principles like SOLID, DRY, KISS, YAGNI.
* Page objects are structured so `specific page` inherits `base page`, abstract/common query and result pages are modules that mixed to `specific pages`
* Print out logic is separated from analysis. Methods that print frames are decorators like.
* Comments are added in RDoc fashion, I stick to the idea the code should be written in a self expandable way. Hope it is.
* You can see the history of development in commits on the `master` branch. I did **not** used `feature` branches as I usually do on my daily tasks for sake of simplicity and lack of necessity.

## Running
* (optional) open `config/test_params.yml` and put the browser of your choice and search query. By default it's a `Firefox` and `Ruby language` respectively.
* Run in console `rspec .\test\webdriver_test_spec.rb` from the application folder.
* After Duckduckgo is done you have 5 seconds to click on Google's `cookies agreement` before starting to work with Google search engine.
* Please note that search engines may be sensitive to your OS settings, internalization, and your physical geo position, so results could be very different from the example below.

## Reading log
"*" - these are instructions for manual testers. It's spread across the log.

**Log Structure**
- Block of instructions for manual testers for first search engine
- Block of results from first search engine
  - Blocks of attributes with analysis from each result
- Block of instructions for manual testers for second search engine
- Block of results from second search engine
  - Blocks of attributes with analysis from each result
- Block of instructions for manual testers
- Block of common results

**Log example**
```
* Open browser firefox
  * Open https://duckduckgo.com/ page
  * Type and submit search query "Ruby language"

* Save 10 first results (copy paste them to notepad or leave resulting page opened).

* Check which results items and their attributes contain <keyword(s)> and which don't.
* Check if at least one attribute contains all words from query for each result.

**************************************************
*** Ruby language at DuckDuckGo
**************************************************

-----------------------------------------------
Ruby Programming Language
------------------ Attributes -----------------
url = "https://www.ruby-lang.org/en/" has: ["ruby"]
title = "Ruby Programming Language" has: ["ruby", "language"]
description = "Mar 30, 2023Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. Lea
rn about its features, download it, read the latest news, and explore the community and resources." has: ["ruby", "language"]  
-----------------------------------------------
Result "Ruby Programming Language" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Ruby (programming language) - Wikipedia
------------------ Attributes -----------------
url = "https://en.wikipedia.org/wiki/Ruby_(programming_language)" has: ["ruby", "language"]
title = "Ruby (programming language) - Wikipedia" has: ["ruby", "language"]
description = "Ruby is an interpreted, high-level, general-purpose programming language which supports multiple programming par
adigms.It was designed with an emphasis on programming productivity and simplicity. In Ruby, everything is an object, including
 primitive data types.It was developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan.. is dynamically typed and uses g
arbage collection and ..." has: ["ruby", "language"]
-----------------------------------------------
Result "Ruby (programming language) - Wikipedia" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Ruby Programming Language - GeeksforGeeks
------------------ Attributes -----------------
url = "https://www.geeksforgeeks.org/ruby-programming-language/" has: ["ruby", "language"]
title = "Ruby Programming Language - GeeksforGeeks" has: ["ruby", "language"]
description = "Sep 26, 2023Learn the basics, syntax, features and concepts of Ruby, a dynamic, reflective, object-oriented, gen
eral-purpose programming language. Explore topics such as control statements, methods, classes, exceptions, modules, collection
s, threading and more with examples and quizzes." has: ["ruby", "language"]
-----------------------------------------------
Result "Ruby Programming Language - GeeksforGeeks" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
About Ruby - Ruby Programming Language
------------------ Attributes -----------------
url = "https://www.ruby-lang.org/en/about/" has: ["ruby"]
title = "About Ruby - Ruby Programming Language" has: ["ruby", "language"]
description = "Ruby is a language of careful balance, created by Yukihiro "Matz" Matsumoto, that blends functional and imperati
ve programming. Learn how Ruby is popular, simple, expressive, and portable, with a wealth of features such as blocks, modules,
 exceptions, and closures." has: ["ruby", "language"]
-----------------------------------------------
Result "About Ruby - Ruby Programming Language" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Learn Ruby | Codecademy
------------------ Attributes -----------------
url = "https://www.codecademy.com/learn/learn-ruby" has: ["ruby"]
title = "Learn Ruby | Codecademy" has: ["ruby"]
description = "Ruby is a general-purpose language that is popular and in demand for web development. Learn to program in Ruby w
ith 19 lessons of interactive exercises, quizzes, and projects. You'll cover topics like control flow, loops, arrays, hashes, b
locks, sorting, refactoring, and more." has: ["ruby", "language"]
-----------------------------------------------
Result "Learn Ruby | Codecademy" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Documentation for Ruby 3.4 - ruby-lang.org
------------------ Attributes -----------------
url = "https://docs.ruby-lang.org/en/master/" has: ["ruby"]
title = "Documentation for Ruby 3.4 - ruby-lang.org" has: ["ruby"]
description = "Ruby is an interpreted object-oriented programming language often used for web development. It also offers many 
scripting features to process plain text and serialized files, or manage system tasks. It is simple, straightforward, and exten
sible." has: ["ruby", "language"]
-----------------------------------------------
Result "Documentation for Ruby 3.4 - ruby-lang.org" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
GitHub - ruby/ruby: The Ruby Programming Language
------------------ Attributes -----------------
url = "https://github.com/ruby/ruby" has: ["ruby"]
title = "GitHub - ruby/ruby: The Ruby Programming Language" has: ["ruby", "language"]
description = "GitHub is the official repository of the Ruby programming language, a dynamic, object-oriented language with a f
ocus on readability and simplicity. Browse the latest commits, branches, tags, and files of the Ruby source code, and learn abo
ut the features, documentation, and tools of Ruby." has: ["ruby", "language"]
-----------------------------------------------
Result "GitHub - ruby/ruby: The Ruby Programming Language" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Learn Ruby: 30 Best Ruby Tutorials for Programmers - Stackify
------------------ Attributes -----------------
url = "https://stackify.com/ruby-tutorials/" has: ["ruby"]
title = "Learn Ruby: 30 Best Ruby Tutorials for Programmers - Stackify" has: ["ruby"]
description = "Learn Ruby the Hard Way is an online tutorial that provides free and good quality content to learn Ruby programm
ing language. This tutorial presents all the topics of Ruby along with plenty of examples, additional resources, and several ex
ercises. It is best suited for the novice as well as advanced programmers." has: ["ruby", "language"]
-----------------------------------------------
Result "Learn Ruby: 30 Best Ruby Tutorials for Programmers - Stackify" has all keywords (["Ruby", "language"]) from query      

-----------------------------------------------
The Definitive Ruby Tutorial For Complete Beginners - RubyGuides
------------------ Attributes -----------------
url = "https://www.rubyguides.com/ruby-tutorial/" has: ["ruby"]
title = "The Definitive Ruby Tutorial For Complete Beginners - RubyGuides" has: ["ruby"]
description = "In this Ruby tutorial you'll learn everything you need to know to get started learning this fun programming lang
uage so you can create your own Ruby programs & do amazing things!. Ruby is an object-oriented language (more about that later)
 that is easy to use & open source. It is widely used for web applications, all kinds of scripts, and other interesting project
s." has: ["ruby", "language"]
-----------------------------------------------
Result "The Definitive Ruby Tutorial For Complete Beginners - RubyGuides" has all keywords (["Ruby", "language"]) from query   

-----------------------------------------------
TryRuby: Learn programming with Ruby
------------------ Attributes -----------------
url = "https://try.ruby-lang.org/" has: ["ruby"]
title = "TryRuby: Learn programming with Ruby" has: ["ruby"]
description = "TryRuby is a web-based tutorial that introduces the basics of Ruby, a programming language from Japan that is re
volutionizing software development. You can type some Ruby code in the editor and see the output, and navigate through the less
ons with buttons." has: ["ruby", "language"]
-----------------------------------------------
Result "TryRuby: Learn programming with Ruby" has all keywords (["Ruby", "language"]) from query
**************************************************


* Open browser firefox again or open a new tab.
  * Open https://google.com/ page
  * Type and submit search query "Ruby language"

* Save 10 first results (copy paste them to notepad or leave resulting page opened).

* Check which results items and their attributes contain <keyword(s)> and which don't.
* Check if at least one attribute contains all words from query for each result.

**************************************************
*** Ruby language - Szukaj w Google
**************************************************

-----------------------------------------------
Ruby Programming Language
------------------ Attributes -----------------
url = "https://www.ruby-lang.org › ..." has: ["ruby"]
title = "Ruby Programming Language" has: ["ruby", "language"]
description = "A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant synta
x that is natural to read and easy to write." has: ["language"]
-----------------------------------------------
Result "Ruby Programming Language" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Ruby (programming language)
------------------ Attributes -----------------
url = "https://en.wikipedia.org › wiki › R..." has: []
title = "Ruby (programming language)" has: ["ruby", "language"]
description = "Ruby is an interpreted, high-level, general-purpose programming language which supports multiple programming par
adigms. It was designed with an emphasis on ..." has: ["ruby", "language"]
-----------------------------------------------
Result "Ruby (programming language)" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
About Ruby
------------------ Attributes -----------------
url = "https://www.ruby-lang.org › about" has: ["ruby"]
title = "About Ruby" has: ["ruby"]
description = "Ruby is a language of careful balance. Its creator, Yukihiro “Matz” Matsumoto, blended parts of his favorite lan
guages (Perl, Smalltalk, Eiffel, Ada, and Lisp) ..." has: ["ruby", "language"]
-----------------------------------------------
Result "About Ruby" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
What is the Ruby programming language?
------------------ Attributes -----------------
url = "https://www.pluralsight.com › cloud" has: []
title = "What is the Ruby programming language?" has: ["ruby", "language"]
description = "The Ruby programming language is a highly portable general-purpose language that serves many purposes. Ruby is g
reat for building desktop applications, ..." has: ["ruby", "language"]
-----------------------------------------------
Result "What is the Ruby programming language?" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Ruby (język programowania)
------------------ Attributes -----------------
url = "https://pl.wikipedia.org › wiki › Ruby_(język_progra..." has: ["ruby"]
title = "Ruby (język programowania)" has: ["ruby"]
description = "Ruby (wym. [ˈru: ..." has: ["ruby"]
-----------------------------------------------
Result "Ruby (język programowania)" none of the attributes has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Ruby - Overview
------------------ Attributes -----------------
url = "https://www.tutorialspoint.com › r..." has: []
title = "Ruby - Overview" has: ["ruby"]
description = "Ruby is a pure object-oriented programming language. It was created in 1993 by Yukihiro Matsumoto of Japan. You 
can find the name Yukihiro Matsumoto on the ..." has: ["ruby", "language"]
-----------------------------------------------
Result "Ruby - Overview" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
Ruby Programming Language
------------------ Attributes -----------------
url = "https://www.geeksforgeeks.org › r..." has: []
title = "Ruby Programming Language" has: ["ruby", "language"]
description = "26 wrz 2023 —" has: []
-----------------------------------------------
Result "Ruby Programming Language" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
What is Ruby
------------------ Attributes -----------------
url = "https://www.javatpoint.com › what..." has: []
title = "What is Ruby" has: ["ruby"]
description = "Ruby is a dynamic, open source, object oriented and reflective programming language. Ruby is considered similar 
to Perl and Smalltalk programming languages." has: ["ruby", "language"]
-----------------------------------------------
Result "What is Ruby" has all keywords (["Ruby", "language"]) from query

-----------------------------------------------
The Ruby Programming Language
------------------ Attributes -----------------
url = "https://helion.pl › 📚 Programowanie" has: []
title = "The Ruby Programming Language" has: ["ruby", "language"]
description = "The Ruby Programming Language is the authoritative guide to Ruby and provides comprehensive coverage of versions
 1.8 and 1.9 of the language." has: ["ruby", "language"]
-----------------------------------------------
Result "The Ruby Programming Language" has all keywords (["Ruby", "language"]) from query
**************************************************


* Compare results for both engines and list out the items which were found in both search engines)


**************************************************
*** Resulting pages from both search engines
**************************************************

-----------------------------------------------
Ruby Programming Language
------------------ Attributes -----------------
url = "https://www.ruby-lang.org/en/"
title = "Ruby Programming Language"
description = "Mar 30, 2023Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. Lea
rn about its features, download it, read the latest news, and explore the community and resources."
-----------------------------------------------
**************************************************

.

Finished in 22.39 seconds (files took 1.54 seconds to load)
```
