Paperclip::Attachment.default_options.merge!(
  :url => ':s3_domain_url'
)
Paperclip::Attachment.default_options[:path] = "/:class/:attachment/:id_partition/:style/:filename"
