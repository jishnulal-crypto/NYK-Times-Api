# NewYorkTimesApi

How to perform Build of this Application :

1 flutter build apk --release || --debug || --profile
2 Apk file will be in ' build/app/outputs/flutter-apk/app-release.apk ' folder

How to perform unit testing with " flutter_test " library in flutter:
 
// We have other libraries like ' mockito ' but we used  ' flutter_test ' library here

1 Test code will be in ' D:\newYorkTimesApi\project\test\ '
      a. /api_integration_testing 
      b. /widget_testing

2 How to run test :
    1 using flutter command 
      a. flutter test || flutter test filename  , it will run all the testfiles and output the result to console
    2 using vscode shortcuts
      b. press ' ctrl b ' you will see a Testing icon . tap it then you will find all the testfiles to run .
         click the run icon directly to run the test by one
         test files should be of _test at the end of the file name  , otherwise test will not consider the file as a testfile
    3  third option is by simply clicking the test icon situated near all test files which can be run one by one

3 How to create coverage file from the test
  
    1 flutter test --coverage command will create the coverage ' lcov ' file
    2 flutter will automatically create a coverage folder with file in it
      a. myprojectname/coverage/lcov.info
    3 
      sample report: SF:lib\main.dart
                      DA:6,0
                      DA:7,0
                      DA:11,2
                      DA:14,1
                      DA:16,1
                      DA:18,1
                      DA:30,1
                      LF:7
                      LH:5
                      end_of_record
                      SF:lib\apiservice\api_service.dart
                      DA:7,1
                      DA:8,1
                      DA:10,2
                      DA:13,2
                      DA:14,0
                      DA:15,0
                      DA:17,3
                      DA:20,0
                      LF:8
                      LH:5
 4 How to convert the coverage file to html report
    
   1 . install perl in your system
       
       a. perl download site https://www.perl.org/get.html
       b. download strawberyperl 
       c. install perl
       d. after install check if perl is installed by ' where perl ' command
   
   2   a. create a file called generateReport.perl in your project no in lib file
       b. open terminal and type this command ' genhtml coverage/lcov.info -o coverage/html '    //  create an html and from coverage file and store it in               html folder inside coverage
       c. ' open coverage/html/index.html ' in terminal to open the file in a browser 
       
  
  
    Thank you ............................................................................................................................................
    
