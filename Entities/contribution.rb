require_relative '../entity_base'

class Contribution < EntityBase
  attr_accessor:  :file_name,
                  :file_path,
                  :submission_batch_id,
                  :status,
                  :created_at,
                  :updated_at,
                  :master_id,
                  :submitted_at,
                  :final_bucket,
                  :upload_bucket,
                  :external_file_location,
                  :contribution_review_id,
                  :published_at,
                  :id

  def id
    @id
  end
end
