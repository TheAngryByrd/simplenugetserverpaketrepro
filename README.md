
### Start nuget docker container

 ```
 ./startnugetserver.sh
 ```

 ### Publish a dummy package to the server

 ```
 ./testPublishServer.sh
 ```

### Set your paket.dependencies to the nuget server ip

```
sed -i -e 's/172.16.122.130/mydockerip/g' paket.dependencies 
```


 ### Test 5.1.6

 ```
 ./testRestore5.1.6.sh
 ```

 Will get a warning but will succeed

 ```
 Failed to getDetailsFromNuGetViaODataFast 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')'. Trying with Version instead of NormalizedVersion: System.Exception: Could not retrieve data from 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')' ---> System.AggregateException: One or more errors occurred. ---> System.Net.WebException: The remote server returned an error: (404) Not Found.
  at System.Net.HttpWebRequest.EndGetResponse (System.IAsyncResult asyncResult) [0x00064] in <f8255d9ef0594d18ae2c0d97286b9a80>:0 
  at System.Net.WebClient.GetWebResponse (System.Net.WebRequest request, System.IAsyncResult result) [0x00000] in <f8255d9ef0594d18ae2c0d97286b9a80>:0 
  at System.Net.WebClient.DownloadBitsResponseCallback (System.IAsyncResult result) [0x00015] in <f8255d9ef0594d18ae2c0d97286b9a80>:0 
   --- End of inner exception stack trace ---
   --- End of inner exception stack trace ---
  at Paket.Utils+getFromUrl@567-9.Invoke (System.Exception _arg3) [0x00036] in <63ff7247e6034c16b12bf7b39446f96a>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+tryWithExnA@883[a].Invoke (System.Runtime.ExceptionServices.ExceptionDispatchInfo edi) [0x0000d] in <63ff7247e6034c16b12bf7b39446f96a>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+callA@841[b,a].Invoke (Microsoft.FSharp.Control.AsyncParams`1[T] args) [0x00047] in <63ff7247e6034c16b12bf7b39446f96a>:0 
Failed to get package details 'Could not retrieve data from 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (Version eq '0.1.0')''. This feeds implementation might be broken.
Could not detect any platforms from 'xamarintvos10'
Could not detect any platforms from 'xamarinwatchos10'
```

 ### Test 5.79.2

 
 ```
 ./testRestore5.79.2.sh
 ```


Will fail


 ```
 Failed to getDetailsFromNuGetViaODataFast 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')'. Trying with Version instead of NormalizedVersion (Please report this warning!): System.Exception: Could not retrieve data from 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')' ---> Paket.Utils+RequestFailedException: Request to 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')' failed with: 'NotFound'
  at Paket.Utils+failIfNoSuccess@441-5.Invoke (Paket.Utils+RequestFailedInfo _arg1) [0x00014] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+args@825-1[a,b].Invoke (a a) [0x00016] in <a949b821e5164cb09f101651fe6dc8c5>:0 
   --- End of inner exception stack trace ---
  at Paket.Utils+getFromUrl@624-8.Invoke (System.Exception _arg4) [0x00036] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+tryWithExnA@883[a].Invoke (System.Runtime.ExceptionServices.ExceptionDispatchInfo edi) [0x0000d] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+callA@841[b,a].Invoke (Microsoft.FSharp.Control.AsyncParams`1[T] args) [0x00047] in <a949b821e5164cb09f101651fe6dc8c5>:0 
Failed to get package details 'Could not retrieve data from 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (Version eq '0.1.0')''. This feeds implementation might be broken.
Source 'http://172.16.122.130:5000' exception: System.Exception: Could not find 'entry' node for package mycoollib 0.1.0
  at Paket.NuGetV2+parseODataEntryDetails@236-1.Invoke (System.String message) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.PrintfImpl+StringPrintfEnv`1[TResult].Finalize () [0x00012] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.PrintfImpl+Final2@235[TState,TResidue,TResult,A,B].Invoke (Microsoft.FSharp.Core.FSharpFunc`2[T,TResult] env, A a, B b) [0x0005a] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.OptimizedClosures+Invoke@3266-1[T2,T3,TResult,T1].Invoke (T2 u, T3 v) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.OptimizedClosures+Invoke@3253[T2,TResult,T1].Invoke (T2 u) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Paket.NuGetV2+parseODataEntryDetails@236-3.Invoke (Paket.SemVerInfo arg20) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.FSharpFunc`2[T,TResult].InvokeFast[V] (Microsoft.FSharp.Core.FSharpFunc`2[T,TResult] func, T arg1, TResult arg2) [0x0001f] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Paket.NuGetV2.parseODataEntryDetails (System.String url, System.String nugetURL, Paket.Domain+PackageName packageName, Paket.SemVerInfo version, System.String raw) [0x00065] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Paket.NuGetV2+queryPackagesProtocol@325-22.Invoke (Microsoft.FSharp.Core.Unit unitVar) [0x0002e] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+callA@841[b,a].Invoke (Microsoft.FSharp.Control.AsyncParams`1[T] args) [0x00047] in <a949b821e5164cb09f101651fe6dc8c5>:0 
Something failed in GetPackageDetails, trying again with force: Couldn't get package details for package mycoollib 0.1.0 on http://172.16.122.130:5000.
Failed to getDetailsFromNuGetViaODataFast 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')'. Trying with Version instead of NormalizedVersion (Please report this warning!): System.Exception: Could not retrieve data from 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')' ---> Paket.Utils+RequestFailedException: Request to 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (NormalizedVersion eq '0.1.0')' failed with: 'NotFound'
  at Paket.Utils+failIfNoSuccess@441-5.Invoke (Paket.Utils+RequestFailedInfo _arg1) [0x00014] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+args@825-1[a,b].Invoke (a a) [0x00016] in <a949b821e5164cb09f101651fe6dc8c5>:0 
   --- End of inner exception stack trace ---
  at Paket.Utils+getFromUrl@624-8.Invoke (System.Exception _arg4) [0x00036] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+tryWithExnA@883[a].Invoke (System.Runtime.ExceptionServices.ExceptionDispatchInfo edi) [0x0000d] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+callA@841[b,a].Invoke (Microsoft.FSharp.Control.AsyncParams`1[T] args) [0x00047] in <a949b821e5164cb09f101651fe6dc8c5>:0 
Failed to get package details 'Could not retrieve data from 'http://172.16.122.130:5000/Packages?$filter=(tolower(Id) eq 'mycoollib') and (Version eq '0.1.0')''. This feeds implementation might be broken.
Source 'http://172.16.122.130:5000' exception: System.Exception: Could not find 'entry' node for package mycoollib 0.1.0
  at Paket.NuGetV2+parseODataEntryDetails@236-1.Invoke (System.String message) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.PrintfImpl+StringPrintfEnv`1[TResult].Finalize () [0x00012] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.PrintfImpl+Final2@235[TState,TResidue,TResult,A,B].Invoke (Microsoft.FSharp.Core.FSharpFunc`2[T,TResult] env, A a, B b) [0x0005a] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.OptimizedClosures+Invoke@3266-1[T2,T3,TResult,T1].Invoke (T2 u, T3 v) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.OptimizedClosures+Invoke@3253[T2,TResult,T1].Invoke (T2 u) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Paket.NuGetV2+parseODataEntryDetails@236-3.Invoke (Paket.SemVerInfo arg20) [0x00001] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Core.FSharpFunc`2[T,TResult].InvokeFast[V] (Microsoft.FSharp.Core.FSharpFunc`2[T,TResult] func, T arg1, TResult arg2) [0x0001f] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Paket.NuGetV2.parseODataEntryDetails (System.String url, System.String nugetURL, Paket.Domain+PackageName packageName, Paket.SemVerInfo version, System.String raw) [0x00065] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Paket.NuGetV2+queryPackagesProtocol@325-22.Invoke (Microsoft.FSharp.Core.Unit unitVar) [0x0002e] in <a949b821e5164cb09f101651fe6dc8c5>:0 
  at Microsoft.FSharp.Control.AsyncBuilderImpl+callA@841[b,a].Invoke (Microsoft.FSharp.Control.AsyncParams`1[T] args) [0x00047] in <a949b821e5164cb09f101651fe6dc8c5>:0 
Performance:
 - Average Request Time: 29 seconds
 - Number of Requests: 104
 - Runtime: 39 seconds
Paket failed with
-> Could not download mycoollib 0.1.0.
-> Couldn't get package details for package mycoollib 0.1.0 on http://172.16.122.130:5000.
-> Could not find 'entry' node for package mycoollib 0.1.0
```
