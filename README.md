# Installation

1. Choose repository directory in your console
2. Install rvm or another ruby versioning management system.
3. `rvm use ruby-3.2.2@ad-parameters-denys-kriukov --create`
4. `bundle`

# Run command

Execute rake command to get data in stdout

`rake ad_parameters`

```
{"placement"=>
  [{"id"=>"plc-1", "creative"=>[{"id"=>"Video-1", "price"=>6.46}, {"id"=>"Video-7", "price"=>4.93}, {"id"=>"Video-12", "price"=>16.46}, {"id"=>"Video-25", "price"=>8.37}]},
   {"id"=>"plc-2", "creative"=>[{"id"=>"Video-12", "price"=>16.46}, {"id"=>"Video-25", "price"=>8.37}]},
   {"id"=>"plc-3", "creative"=>[{"id"=>"Video-1", "price"=>6.46}, {"id"=>"Video-7", "price"=>4.93}, {"id"=>"Video-12", "price"=>16.46}, {"id"=>"Video-25", "price"=>8.37}]},
   {"id"=>"plc-4"},
   {"id"=>"plc-5"},
   {"id"=>"plc-6", "creative"=>[{"id"=>"Video-1", "price"=>6.46}, {"id"=>"Video-7", "price"=>4.93}, {"id"=>"Video-12", "price"=>16.46}, {"id"=>"Video-25", "price"=>8.37}]},
   {"id"=>"plc-7",
    "creative"=>[{"id"=>"Video-1", "price"=>6.46}, {"id"=>"Video-4", "price"=>0.99}, {"id"=>"Video-7", "price"=>4.93}, {"id"=>"Video-12", "price"=>16.46}, {"id"=>"Video-25", "price"=>8.37}]},
   {"id"=>"plc-8", "creative"=>[{"id"=>"Video-1", "price"=>6.46}, {"id"=>"Video-7", "price"=>4.93}, {"id"=>"Video-12", "price"=>16.46}, {"id"=>"Video-25", "price"=>8.37}]}]}
```

# Web server

1. Execute `puma` in repository directory
2. Protobuf endpoint [http://0.0.0.0:9292/placements?placement_id=plc-8&floor=10](http://0.0.0.0:9292/placements?placement_id=plc-8&floor=10)

Protobuf message
```
\n\a\n\x05plc-1\n\a\n\x05plc-2\n\a\n\x05plc-3\n\a\n\x05plc-4\n\a\n\x05plc-5\n\a\n\x05plc-6\n\a\n\x05plc-7\n\x18\n\x05plc-8\x12\x0F\n\bVideo-12\x15\x14\xAE\x83A
```

JSON analogue
```
{"placement":[{"id":"plc-8","creative":[{"id":"Video-12","price":16.46}]}]}
```

# Tests

To run tests please execute `rspec` command in repository directory 
