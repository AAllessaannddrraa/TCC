module Admin
  class ReportsController < ApplicationController
    before_action :authenticate_usuario!
    before_action :ensure_admin

    def index
      case params[:type]
      when 'usuarios'
        @report_title = "Relatório de Usuários"
        @data = Usuario.all
      when 'solicitations'
        @report_title = "Relatório de Solicitações"
        @data = Solicitation.all
      when 'payments'
        @report_title = "Relatório de Pagamentos"
        @data = Payment.all
      else
        @report_title = "Relatórios"
        @data = []
      end

      respond_to do |format|
        format.html
        format.csv { send_data generate_csv(@data), filename: "#{params[:type]}_report.csv" }
      end
    end

    private

    # Generate CSV data from records
    def generate_csv(records)
      return "" if records.empty?

      attributes = records.first.attributes.keys

      CSV.generate(headers: true) do |csv|
        csv << attributes

        records.each do |record|
          csv << record.attributes.values
        end
      end
    end

    def ensure_admin
      redirect_to root_path, alert: 'Acesso negado!' unless current_usuario.admin?
    end
  end
end
