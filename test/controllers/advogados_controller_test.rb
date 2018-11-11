require 'test_helper'

class AdvogadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advogado = advogados(:one)
  end

  test "should get index" do
    get advogados_url
    assert_response :success
  end

  test "should get new" do
    get new_advogado_url
    assert_response :success
  end

  test "should create advogado" do
    assert_difference('Advogado.count') do
      post advogados_url, params: { advogado: { estado: @advogado.estado, nome: @advogado.nome } }
    end

    assert_redirected_to advogado_url(Advogado.last)
  end

  test "should show advogado" do
    get advogado_url(@advogado)
    assert_response :success
  end

  test "should get edit" do
    get edit_advogado_url(@advogado)
    assert_response :success
  end

  test "should update advogado" do
    patch advogado_url(@advogado), params: { advogado: { estado: @advogado.estado, nome: @advogado.nome } }
    assert_redirected_to advogado_url(@advogado)
  end

  test "should destroy advogado" do
    assert_difference('Advogado.count', -1) do
      delete advogado_url(@advogado)
    end

    assert_redirected_to advogados_url
  end
end
