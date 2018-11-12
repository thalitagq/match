class ClientesController < ApplicationController
before_action :set_cliente, only: [:show, :edit, :update, :destroy]

# GET /clientes
# GET /clientes.json
def index
    @clientes = Cliente.all
end

# GET /clientes/1
# GET /clientes/1.json
def show
end

# GET /clientes/new
def new
    @cliente = Cliente.new
end

# GET /clientes/1/edit
def edit
end

# POST /clientes
# POST /clientes.json
def create
    @cliente = Cliente.new(cliente_params)
    @cliente.advogado_id = self.buscar(@cliente.estado)
    puts "aqui:"
    puts @cliente.advogado_id
    respond_to do |format|
    if @cliente.save
     
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
    else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
    end
   
    end
end

# PATCH/PUT /clientes/1
# PATCH/PUT /clientes/1.json
def update
    respond_to do |format|
    if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
    else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
    end
    end
end

# DELETE /clientes/1
# DELETE /clientes/1.json
def destroy
    @cliente.destroy
    respond_to do |format|
    format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
    format.json { head :no_content }
    end
end


def buscar(estado_cliente)
    #qnt = Advogado.find_by_sql("SELECT MIN(qnt_clientes) FROM advogados WHERE(advogados.estado = '#{estado_cliente}')")
    qnt = Advogado.where(estado: estado_cliente).minimum("qnt_clientes")
    puts estado_cliente
    puts qnt
    if qnt == nil
        advogado =  Advogado.find_by_sql("SELECT * FROM advogados WHERE (advogados.estado = '#{estado_cliente}') LIMIT 1").pluck(:id)
        advogado_id = advogado[0]
        puts advogado_id
        return advogado_id
    else
        advogado_id = Advogado.find_by_sql("SELECT MIN(qnt_clientes) FROM advogados WHERE (advogados.estado = '#{estado_cliente}') LIMIT 1").pluck(:id)
        advogado_id = advogado[0]
        puts advogado_id
        return advogado_id
    end
end

private 
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
    @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
    params.require(:cliente).permit(:nome, :estado, :advogado_id)
    end

end