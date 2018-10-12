class PrefsController < ApplicationController
  protect_from_forgery except: :search # searchアクションを除外

  # GET /prefs
  # GET /prefs.json
  def index
    @prefs = Pref.all
  end

  # GET /prefs/1
  # GET /prefs/1.json
  def show

  end


  def search

  end




  # GET /prefs/new
  def new
    @pref = Pref.new
  end



  def edit

  end

  # DELETE /prefs/1
  # DELETE /prefs/1.json
  def destroy
    @pref.destroy
    respond_to do |format|
      format.html { redirect_to prefs_url, notice: 'Pref was successfully destroyed.' }
      format.json { head :no_content }
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pref
      @pref = Pref.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pref_params
      params.require(:pref).permit(:name)
    end
  end
end
