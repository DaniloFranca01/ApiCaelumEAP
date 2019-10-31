class Api::V1::PacientesController < Api::V1::ApiController
  before_action :set_paciente, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]

  # GET /api/v1/pacientes

  def index
    @pacientes = current_user.pacientes
    render json: @pacientes
  end

  # GET /api/v1/pacientes/1

  def show
    render json: @paciente
  end

  # POST /api/v1/pacientes

  def create
    @paciente = Paciente.new(paciente_params.merge(user: current_user))
    if @paciente.save
      render json: @paciente, status: :created
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/pacientes/1

  def update
    if @paciente.update(paciente_params)
      render json: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/pacientes/1

  def destroy
    @paciente.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.

    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.

    def paciente_params
      params.require(:paciente).permit(:nome, :cpf, :genero, :hip_diag, :idade)
    end

    def require_authorization!
      unless current_user == @paciente.user
        render json: {}, status: :forbidden
      end
    end
end