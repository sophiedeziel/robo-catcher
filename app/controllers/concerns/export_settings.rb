module ExportSettings
  extend ActiveSupport::Concern

  def export_all
    ExportConfigJob.perform_now
  end
end
