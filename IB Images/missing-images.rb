File.readlines('missing-images.txt').each do |line|
    next if line =~ /^#/
    line.chomp!
    parts = line.split ':'
    name = parts[0].gsub(' ', '')
    size = parts[1].gsub(' ', '').split ','
    if size.length == 0 then
        size = nil
    else
        size = size.collect{ |i| i.to_i }
    end
    bn = File.basename(name, '.png').split('_').join(' ')

    # check if the existing image is a dummy image or not
    if File.exists?(name) then
        cmd = "identify -verbose #{name} | grep 'title: dummy'"
        dummy = `#{cmd}`
    else
        dummy = 'dummy'
    end

    if size.nil? then
        size = [64, 64]
        bgcolor = 'red'
    else
        bgcolor = 'wheat'
    end

    cmd = "echo '#{bn}' | convert -set title 'dummy' -size #{size[0]}x#{size[1]} -page #{size[0]}x#{size[1]}+2+2 -border 1x1 -bordercolor grey -background #{bgcolor} -fill black -pointsize 12 text:- +repage #{name}"
    if dummy != '' or not File.exists?(name) then
        system cmd
    end

end
