open BatIO

let read_file_to_single_string filename =
  Core.In_channel.with_file filename ~f:(fun input ->
    Core.In_channel.input_all input)

let read_from_binary deserialize filename =
  Core.In_channel.with_file ~binary:true filename
    ~f:(fun file_input ->
        let bits_input = input_bits @@ input_channel file_input in
        deserialize bits_input)

let write_to_binary serialize filename data =
  Core.Out_channel.with_file filename ~append:false ~binary:true ~f:(fun file ->
      let bits_output = output_bits @@ output_channel file ~cleanup:true in
      serialize bits_output data;
      (* Padding *)
      flush_bits bits_output)

      