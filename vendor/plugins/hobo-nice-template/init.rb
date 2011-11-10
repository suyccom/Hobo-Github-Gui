# Include hook code here

# Copy the Dryml
unless File.exist?('app/views/taglibs/themes/nice')
  FileUtils.mkdir('app/views/taglibs/themes/nice')
  FileUtils.copy('vendor/plugins/hobo-nice-template/lib/nice.dryml','app/views/taglibs/themes/nice/')
end

# Copy the CSS and images
unless File.exist?('public/hobothemes/nice')
  FileUtils.cp_r('vendor/plugins/hobo-nice-template/lib/nice','public/hobothemes')
end
