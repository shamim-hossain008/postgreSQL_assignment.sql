1.PostgreSQL হচ্ছে একটা ডেটা ম্যানেজমেন্ট সিস্টেম।
এটা ফ্রি এবং ওপেন সোর্স। এটা মূলত ব্যবহার করা হয় database system management করার জন্য |
এটা মোটামুটি সব ধরনের প্রোগ্রামিং ভাষা সাপোর্ট করে।( Python,Java,C/C++,C#,Node.js,Go,Ruby,Perl,Tcl)

2.PostgreSQL schema হচ্ছে ডেটাবেজ এর মধ্যে প্রত্যেকটা ফাইল যা database  সংরক্ষিত সকল তথ্যকে সুন্দরভাবে গুছিয়ে রাখে,  প্রত্যেকটা schema  আমরা Table,View  ফাংশন এবং others Database  সংরক্ষণ করে গুছিয়ে রাখতে পারি |

3.প্রাইমারি key বলতে আমরা বুঝি প্রত্যেকটা টেবিলের অনেকগুলো কলাম অথবা একটা কলাম থাকলে ওইটাকে খুঁজে বের করার জন্য একটা আইডি নাম্বার কে বুঝি,
যে আইডি নাম্বার টা অন্য কোন আইডি নাম্বারের সাথে মিল থাকবে না,
সেই সাথে এটা null অথবা empty থাকতে পারবে না,

কোন একটা নির্দিষ্ট ব্যক্তির তথ্য খুঁজে বের করতে প্রাইমারি key ব্যবহার করা হয়,

অপরদিকে  Foreign key
হচ্ছে অন্য একটা টেবিলের প্রাইমারি কি রেফারেন্স হিসেবে ভিন্ন টেবিলে ব্যবহার করা হয়,
যার মাধ্যমে দুইটা ভিন্ন টেবিল এর যোগাযোগ স্থাপন হয়, বলা যেতে পারে দুইটা ভিন্ন টেবিল এর যোগাযোগ স্থাপনের মাধ্যমটা হচ্ছে Foreign key.

4.VARCHAR এবং CHAR দুটাই ব্যবহার করা হয় মূলত string text ডেটা সংরক্ষণ করার জন্য

তবে ব্যবহারের ক্ষেত্রে এদের মধ্যে কিছু ভিন্নতা রয়েছে যেগুলো নিচে বর্ণনা করা হলো

প্রথমে বলি CHAR ব্যবহার নিয়ে
কারণ, এটি শুধুমাত্র নির্দিষ্ট লেন্থের মধ্যেই সীমাবদ্ধ।
এটা বেশিরভাগ ব্যবহার করা হয় যখন টেক্সটগুলো শর্ট হয়, যেমন: দেশের কোড, জিপ কোড, পোস্ট কোড।
যদি আমরা CHAR লেন্থ ২ অথবা ৪ দেই এবং ইনপুট করার সময় শুধু এক অথবা দুইটি টেক্সট ব্যবহার করি, বাকি অংশটা সে ফাঁকায় (space) রেখে দেবে।

অপরদিকে VARCHAR হচ্ছে Variable Length.
VARCHAR ব্যবহার করে যতটুকু ক্যারেক্টার দেওয়া যাবে ততটুকু সে ব্যবহার করবে | 
যেমন আমরা যদি VARCHAR ক্যারেক্টার সংখ্যা  ৫০ এবং ব্যবহার করি মাত্র ১০ সে শুধুমাত্র ১০ই ব্যবহার করবে এটা কোন ফিক্স থাকে না|

5.PostgreSQL JOIN হচ্ছে একের অধিক টেবিল কে একসাথে করা কে বুঝায়,
এরা মূলত ইউজারকে সুবিধা প্রদান করে তথ্য গ্রহণ করার ক্ষেত্রে যখন তথ্যগুলা ভিন্ন ভিন্ন থাকে এই জয়েন এর মাধ্যমে একত্র করে তা সহজে দেখা যায়|
এটা সুবিধা হল একাধিক টেবিল জয়েন করে দ্রুত query করতে সহযোগিতা করে এবং ডেটা ডুবলিকেট থেকে বাঁচিয়ে শর্ট করে দেয়|

এই JOIN আবার ভিন্নতা রয়েছে যেমন LEFT JOIN, RIGHT JOIN , INNER JOIN , FULL JOIN,CROSS JOIN

এটা মূলত কাজ করে Foreign key মাধ্যমে

INNER JOIN হচ্ছে শুধুমাত্র যেগুলোর same রয়েছে সেগুলো দেখানো |

LEFT JOIN হচ্ছে লেফটের প্রত্যেকটা ডেটা এবং তার সাথে মিল রেখে রাইট সাইটের ডাটা দেখানো ,
আর অন্যদিকে রাইট জয়েন হচ্ছে রাইট এর সব DATA রেখে তার সাথে ম্যাচিং করে LEFT থেকে দেখানো

FULL JOIN হচ্ছে database ea যত আছে টেবিল সবগুলো আরো থেকে দেখানো

