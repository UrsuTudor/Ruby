# data from screens, keyboards, files and networks are all forms of I/O
  # data is sent to and from programs as a stream of characters/bytes
  # unix-like systems treat all external devices as files
    # found in /dev/fd, files are given a number
    # the three default streams are stdout, stdin, stderr (standard output, input, error)
  
# IO CLASS
  # IO objects wrap input/output streams
  # STDIN, STDOUT, STDERR point to IO objects wrapping the standard streams
  # input is read only, error and output are write only

  # $stdout.puts 'Hello World' # longform version of puts
  # $stdin.gets # longform version of gets

  io = IO.new(1) # creating a new IO object with a file descriptor (1)
  io.puts 'hello world'

  fd = IO.sysopen('/dev/null', 'w+') # gets the file descriptor of null
  dev_null = IO.new(fd) # creates a new IO object for dev/null, so we can interact with it 
  dev_null.puts 'hello' # no longer puts on screen, because it puts it in dev/null

# POSITION
  test_descr = IO.sysopen('/home/thebear/repos/Ruby/notes/IO/test.txt', 'w+')
  puts test_descr
  test_io = IO.new(test_descr)
  test_io.puts 'hey'
  test_io.puts 'hello'
  puts test_io.gets
  puts test_io.eof? # end of line?
  test_io.rewind  # restarts cursor to 0
  puts test_io.gets
  puts test_io.gets
  puts test_io.eof?
  test_io.rewind
  test_io.puts 'hehe' # replaces hey

  # 'cursor' starts on the first line and moves one line after an operation
  # writing will overwrite text if there is already something on that line

# SUB-CLASSES AND DUCK-TYPES
  # ruby has special subclasses of IO that are more specialized

  # File 
    # most well known sublclass
    # allows for reading/writing of files without file descriptors
    # adds file-specific methods like File#size, File#chmod and File.path

  # Sockets 
    # TCPSocket
    # UDPSocket
    # UNIXSocket
    # Socket 

  # StringIO
    # akkiws string to behave like IOs
    # useful for passing strings into systems that consume streams
    # can be used to push a StringIO instead of reading a file from disk 

  # Tempfile 
    # a temporary file

# WORKING WITH FILES
  f = File.open('file_test.txt', 'w') # opens a file in write mode
  f.puts 'Hey'
  f.close # closes the stream, meaning you can't write anymore in the file
  # block after .open means the block will be applied to the file and the file will be closed automatically
  # use a loop to read lines, since cursor moves 1 line after each read

  # methods:
    # exist? - checks if a file exists
    # mtime - shows the last modification time
    # size - shows size
    # rename(name, new name) - renames file

# WORKING WITH DIRECTORIES
  # methods: 
    # mkdir
    # exist?
    # pwd
    # chdir - change dir
    # rmdir - remove dir
    # entries - returns entries (files and subdirs)

# SERIALIZATION
  # process of taking a data structure and flatening it into a string 
    # an array [0, 1, 2, 3, 4] becomes {0, 1, 2 ,3 ,4}
    # complex data structure: 
      # { Name: John Doe,
      #   Phone_Numbers: [12345, 24680, 36925],
      #   DOB: {D: 18,
      #         M: 2,
      #         Y: 1974}}
      # becomes: {'Name': 'John Doe', 'Phone Numbers': [12345, 24680, 36925], 'DOB': {'D': 18,'M': 2,'Y': 1974} }

  # techniques: 
    # JSON
    # XML
    # YAML
    # they come with different notations
    # the one above is JSON

  # converting to and from YAML
    # YAML.dump can be used to convert a Ruby hash into a YAML string 
      # YAML.dump ( {
      #   :name => @name,
      #   :age => @age,
      #   :gender => @gender
      # })

    # YAML.load can be used to convert a YAML string into a Ruby hash
      # data = YAML.load string
      # self.new(data[:name], data[:age], data[:gender]) - using the data hash to create a new class object

    # use it for config files

  # converting to and from JSON
    # just replace YAML with JSON (JSON.dump, JSON.load)
    # use it if your primary objective is to communicate with JS

  # converting to and from MessagePack 
    # use dump/load with MessagePack
    # much faster than YAML or JSON, but less readable for humans

  # adaptable serializer
    # module BasicSerializable

      # should point to a class; change to a different
      # class (e.g. MessagePack, JSON, YAML) to get a different
      # serialization

      #   @@serializer = MessagePack

      #   def serialize
      #     obj = {}
      #     instance_variables.map do |var|
      #       obj[var] = instance_variable_get(var)
      #     end

      #     @@serializer.dump obj
      #   end

      #   def unserialize(string)
      #     obj = @@serializer.parse(string)
      #     obj.keys.each do |key|
      #       instance_variable_set(key, obj[key])
      #     end
      #   end
      # end
