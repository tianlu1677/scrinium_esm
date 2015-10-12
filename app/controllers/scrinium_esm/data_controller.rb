require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class DataController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show]
    before_action :set_datum, only: [:show, :edit, :update, :destroy]

    # GET /data
    def index
      @data = Datum.all
    end

    # GET /data/1
    def show
    end

    # GET /data/new
    def new
      @datum = Datum.new
      @datum.datum_type = 0
    end

    # GET /data/1/edit
    def edit
    end

    # POST /data
    def create
      @datum = Datum.new(datum_params)

      if @datum.save
        redirect_to @datum, notice: t('message.create_success', thing: t('scrinium_esm.data'))
      else
        render :new
      end
    end

    # PATCH/PUT /data/1
    def update
      if @datum.update(datum_params)
        redirect_to @datum, notice: t('message.update_success', thing: t('scrinium_esm.data'))
      else
        render :edit
      end
    end

    # DELETE /data/1
    def destroy
      @datum.destroy
      redirect_to data_url, notice: t('message.destroy_success', thing: t('scrinium_esm.data'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def datum_params
      params.require(:datum).permit(:name,
                                    :logo,
                                    :datum_type,
                                    :datum_format,
                                    :source,
                                    :homepage,
                                    :localstore,
                                    :contact_id)
    end
  end
end
