require "dicom"

include DICOM

commands = ARGV.empty? ? ['summary'] : ARGV

dcm = DObject.parse($stdin.read)

commands.each {|command|
  case command
  when 'print'
    dcm.print
  when 'image'
    dcm.image.normalize.thumbnail(0.10).display
  else
    dcm.summary
  end
}
