%CONFIGURAÇÕES DA TELA INICIAL E VARIÁVEIS GLOBAIS
?-
	G_X1 := 100,
	G_X2 := 600,
	G_X3 := 375,
	G_Y1 := 45,
	G_Y2 := 570,
	G_Y3 := 75,

	window(handle(_), class(inicial) ,title("Hemocentro Chucamantras"), size(G_X2, G_Y2), pos(G_X3, G_Y3)).

%TELA DE DESCRIÇÃO DO APLICATIVO
inicial(init):-

	button(handle(G_Inicial), class(ok), text("Continuar"), pos(185, 450), size(200, 50)),

	G_Descricao := bitmap_image("descricao.bmp",_).

%IMAGEM DA TELA INICIAL (DESCRIÇÃO)
inicial(paint) :- draw_bitmap(40,10,G_Descricao,_,_).

%FUNÇÃO DO BOTÃO CONTINUAR (FECHA A JANELA E GERA A MAIN)
ok(press) :- close(G_Inicial), close(G_Inicial), window(class(main), title("Hemocentro Chucamantras"), size(G_X2, G_Y2), pos(G_X3, G_Y3)).

%MAIN, CAMPOS DE COLETA E BOTÃO DE SUBMIT
main(init):-

	group_box(text("    Qual o seu tipo sanguíneo?    "), pos(40, 170), size(230, 120)),
	window_brush(_, rgb(222, 29, 42)),
	G_Tipo_A := radio_button(class(tipo), text("A"), pos(70, 220), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Tipo_B := radio_button(class(tipo), text("B"), pos(70, 240), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Tipo_O := radio_button(class(tipo), text("O"), pos(190, 220), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Tipo_AB := radio_button(class(tipo), text("AB"), pos(190, 240), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	group_box(text("          Qual o seu fator RH?         "), pos(300, 170), size(230, 120)),
	window_brush(_, rgb(255, 217, 0)),
	G_Rh_Positivo := radio_button(class(rh), text("Positivo (+)"), pos(330, 220), size(90, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Rh_Negativo := radio_button(class(rh), text("Negativo (-)"), pos(330, 240), size(90, 20)),
	window_brush(_, rgb(255, 255, 255)),

	group_box(text("   Você possui mais que 50kg?   "), pos(40, 310), size(230, 120)),
	window_brush(_, rgb(64, 173, 38)),
	G_Peso_Sim := radio_button(class(peso), text("Sim"), pos(70, 360), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Peso_Nao := radio_button(class(peso), text("Não"), pos(70, 380), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	group_box(text("Você possui entre 16 e 69 anos?"), pos(300, 310), size(230, 120)),
	window_brush(_, rgb(97, 119, 171)),
	G_Idade_Sim := radio_button(class(idade), text("Sim"), pos(330, 360), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Idade_Nao := radio_button(class(idade), text("Não"), pos(330, 380), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	button(class(submit), text("Enviar Resposta"), pos(185, 450), size(200, 50)),

	G_Logo := bitmap_image("logo.bmp",_).

%LOGOTIPO MAIN
main(paint) :- draw_bitmap(40,10,G_Logo,_,_).

/*BOTÕES DE MÚLTIPLA ESCOLHA
resposta(init):-

	group_box(text("Pergunta?"), pos(20, 160), size(415, 110)),
	window_brush(_, rgb(131, 130, 128)),
	G_Caju := check_box(class(caju), text("Caju?"), pos(25, 185), size(400, 20)),
	window_brush(_, rgb(131, 130, 128)),
	G_Manga := check_box(class(manga), text("Manga?"), pos(25, 205), size(400, 20)),
	window_brush(_, rgb(131, 130, 128)),
	G_Uva := check_box(class(uva), text("Uva?"), pos(25, 225), size(400, 20)),	
	window_brush(_, rgb(131, 130, 128)),

	button(class(submit), text("Enviar Resposta"), pos(140, 300), size(200, 50)).

caju(press):-
	set_check_box_value(_,1-get_check_box_value(_)).

manga(press):-
	set_check_box_value(_,1-get_check_box_value(_)).

uva(press):-
	set_check_box_value(_,1-get_check_box_value(_)).
*/

%COLETA DOS VALORES DOS CAMPOS DA MAIN
tipo(press):-

	set_check_box_value(G_Tipo_A,0),
	set_check_box_value(G_Tipo_B,0),
	set_check_box_value(G_Tipo_O,0),
	set_check_box_value(G_Tipo_AB,0),
	set_check_box_value(_,1).

rh(press):-

	set_check_box_value(G_Rh_Positivo,0),
	set_check_box_value(G_Rh_Negativo,0),
	set_check_box_value(_,1).

peso(press):-

	set_check_box_value(G_Peso_Sim,0),
	set_check_box_value(G_Peso_Nao,0),
	set_check_box_value(_,1).

idade(press):-

	set_check_box_value(G_Idade_Sim,0),
	set_check_box_value(G_Idade_Nao,0),
	set_check_box_value(_,1).

%BOTÃO SUBMIT - GERAÇÃO DA MAIN 2 OU TELA FINAL E ALERT BOX
submit(press):-

	(((get_check_box_value(G_Tipo_A) =:= 0) , (get_check_box_value(G_Tipo_B) =:= 0) , (get_check_box_value(G_Tipo_O) =:= 0) , (get_check_box_value(G_Tipo_AB) =:= 0));
	((get_check_box_value(G_Rh_Positivo) =:= 0) , (get_check_box_value(G_Rh_Negativo) =:= 0));
	((get_check_box_value(G_Peso_Sim) =:= 0) , (get_check_box_value(G_Peso_Nao) =:= 0));
	((get_check_box_value(G_Idade_Sim) =:= 0) , (get_check_box_value(G_Idade_Nao) =:= 0))
	->
		message("  Resposta vazia!","Por favor preencha todos os campos!",!);

	(((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1))
	->
		window(handle(_), class(final) ,title("Hemocentro Chucamantras"), size(G_X2+200, G_Y2), pos(G_X3-100, G_Y3));
		window(handle(_), class(main2) ,title("Hemocentro Chucamantras"), size(G_X2, G_Y2), pos(G_X3, G_Y3)))).

%MAIN 2, CAMPOS DE COLETA E BOTÃO DE SUBMIT 2
main2(init):-

	group_box(text("            Você se alimentou           "), pos(40, 170), size(230, 120)),
	window_brush(_, rgb(255, 217, 0)),
	group_box(text("          nas últimas 8 horas?         "), pos(40, 190), size(230, 100)),
	window_brush(_, rgb(255, 217, 0)),
	G_Jejum_Sim := radio_button(class(jejum), text("Sim"), pos(70, 220), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Jejum_Nao := radio_button(class(jejum), text("Não"), pos(70, 240), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	group_box(text("     Você possui tatuagem feita    "), pos(300, 170), size(230, 120)),
	window_brush(_, rgb(97, 119, 171)),
	group_box(text("          há menos de 1 ano?          "), pos(300, 190), size(230, 100)),
	window_brush(_, rgb(97, 119, 171)),
	G_Tattoo_Sim := radio_button(class(tattoo), text("Sim"), pos(330, 220), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Tattoo_Nao := radio_button(class(tattoo), text("Não"), pos(330, 240), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	group_box(text("    Você possui alguma doença    "), pos(40, 310), size(230, 120)),
	window_brush(_, rgb(222, 29, 42)),
	group_box(text("    transmissível pelo sangue?    "), pos(40, 330), size(230, 100)),
	window_brush(_, rgb(222, 29, 42)),
	G_Doenca_Sim := radio_button(class(doenca), text("Sim"), pos(70, 360), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Doenca_Nao := radio_button(class(doenca), text("Não"), pos(70, 380), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	group_box(text("            Você utiliza drogas          "), pos(300, 310), size(230, 120)),
	window_brush(_, rgb(64, 173, 38)),
	group_box(text("            ilícitas injetáveis?           "), pos(300, 330), size(230, 100)),
	window_brush(_, rgb(64, 173, 38)),
	G_Drogas_Sim := radio_button(class(drogas), text("Sim"), pos(330, 360), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),
	G_Drogas_Nao := radio_button(class(drogas), text("Não"), pos(330, 380), size(45, 20)),
	window_brush(_, rgb(255, 255, 255)),

	button(class(submit2), text("Enviar Resposta"), pos(185, 450), size(200, 50)),

	G_Logo := bitmap_image("logo.bmp",_).

%LOGOTIPO MAIN 2
main2(paint) :- draw_bitmap(40,10,G_Logo,_,_).

%COLETA DOS VALORES DOS CAMPOS DA MAIN 2
jejum(press):-

	set_check_box_value(G_Jejum_Sim,0),
	set_check_box_value(G_Jejum_Nao,0),
	set_check_box_value(_,1).

tattoo(press):-

	set_check_box_value(G_Tattoo_Sim,0),
	set_check_box_value(G_Tattoo_Nao,0),
	set_check_box_value(_,1).

doenca(press):-

	set_check_box_value(G_Doenca_Sim,0),
	set_check_box_value(G_Doenca_Nao,0),
	set_check_box_value(_,1).

drogas(press):-

	set_check_box_value(G_Drogas_Sim,0),
	set_check_box_value(G_Drogas_Nao,0),
	set_check_box_value(_,1).

%BOTÃO SUBMIT 2 - GERAÇÃO DA TELA FINAL E ALERT BOX
submit2(press):-

	(((get_check_box_value(G_Jejum_Sim) =:= 0) , (get_check_box_value(G_Jejum_Nao) =:= 0));
	((get_check_box_value(G_Tattoo_Sim) =:= 0) , (get_check_box_value(G_Tattoo_Nao) =:= 0));
	((get_check_box_value(G_Doenca_Sim) =:= 0) , (get_check_box_value(G_Doenca_Nao) =:= 0));
	((get_check_box_value(G_Drogas_Sim) =:= 0) , (get_check_box_value(G_Drogas_Nao) =:= 0))
	->
		message("  Resposta vazia!","Por favor preencha todos os campos!",!);

		window(handle(_), class(final) ,title("Hemocentro Chucamantras"), size(G_X2+200, G_Y2), pos(G_X3-100, G_Y3))).

%MARCA D'ÁGUA TELA FINAL
final(init):-

	G_Marca := bitmap_image("marca.bmp",_).

%CONFIGURAÇÃO DA TELA FINAL
final(paint):-

	draw_bitmap(510,180,G_Marca,_,_),

	((get_check_box_value(G_Tipo_A) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(a_positivo_sim)),

	((get_check_box_value(G_Tipo_A) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(a_positivo_nao)),

	((get_check_box_value(G_Tipo_A) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(a_negativo_sim)),

	((get_check_box_value(G_Tipo_A) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(a_negativo_nao)),

	((get_check_box_value(G_Tipo_B) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(b_positivo_sim)),

	((get_check_box_value(G_Tipo_B) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(b_positivo_nao)),

	((get_check_box_value(G_Tipo_B) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(b_negativo_sim)),

	((get_check_box_value(G_Tipo_B) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(b_negativo_nao)),

	((get_check_box_value(G_Tipo_O) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(o_positivo_sim)),

	((get_check_box_value(G_Tipo_O) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(o_positivo_nao)),

	((get_check_box_value(G_Tipo_O) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(o_negativo_sim)),

	((get_check_box_value(G_Tipo_O) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(o_negativo_nao)),

	((get_check_box_value(G_Tipo_AB) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(ab_positivo_sim)),

	((get_check_box_value(G_Tipo_AB) =:= 1) , (get_check_box_value(G_Rh_Positivo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(ab_positivo_nao)),

	((get_check_box_value(G_Tipo_AB) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Sim) =:= 1) , (get_check_box_value(G_Idade_Sim) =:= 1) , (get_check_box_value(G_Jejum_Sim) =:= 1) , (get_check_box_value(G_Tattoo_Nao) =:= 1) , (get_check_box_value(G_Doenca_Nao) =:= 1) , (get_check_box_value(G_Drogas_Nao) =:= 1))
	-> show(ab_negativo_sim)),

	((get_check_box_value(G_Tipo_AB) =:= 1) , (get_check_box_value(G_Rh_Negativo) =:= 1) , ((get_check_box_value(G_Peso_Nao) =:= 1) ; (get_check_box_value(G_Idade_Nao) =:= 1) ; (get_check_box_value(G_Jejum_Nao) =:= 1) ; (get_check_box_value(G_Tattoo_Sim) =:= 1) ; (get_check_box_value(G_Doenca_Sim) =:= 1) ; (get_check_box_value(G_Drogas_Sim) =:= 1))
	-> show(ab_negativo_nao)).

%CONTEÚDO DA TELA FINAL
show(a_positivo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: A / Fator RH: +", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | AB+", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | A- | O+ | O-", pos(G_X1,G_Y1+310)).

show(a_positivo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: A / Fator RH: +", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | A- | O+ | O-", pos(G_X1,G_Y1+310)).

show(a_negativo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: A / Fator RH: -", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | A- | AB+ | AB-", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A- | O-", pos(G_X1,G_Y1+310)).

show(a_negativo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: A / Fator RH: -", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A- | O-", pos(G_X1,G_Y1+310)).

show(b_positivo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: B / Fator RH: +", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("B+ | AB+", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("B+ | B- | O+ | O-", pos(G_X1,G_Y1+310)).

show(b_positivo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: B / Fator RH: +", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("B+ | B- | O+ | O-", pos(G_X1,G_Y1+310)).

show(b_negativo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: B / Fator RH: -", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("B+ | B- | AB+ | AB-", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("B- | O-", pos(G_X1,G_Y1+310)).

show(b_negativo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: B / Fator RH: -", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("B- | O-", pos(G_X1,G_Y1+310)).

show(o_positivo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: O / Fator RH: +", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | B+ | O+ | AB+", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("O+ | O-", pos(G_X1,G_Y1+310)).

show(o_positivo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: O / Fator RH: +", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("O+ | O-", pos(G_X1,G_Y1+310)).

show(o_negativo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: O / Fator RH: -", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | A- | B+ | B- | O+ | O- | AB+ | AB-", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("O-", pos(G_X1,G_Y1+310)).

show(o_negativo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: O / Fator RH: -", pos(G_X1-10,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("O-", pos(G_X1,G_Y1+310)).

show(ab_positivo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: AB / Fator RH: +", pos(G_X1-15,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("AB+", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | A- | B+ | B- | O+ | O- | AB+ | AB-", pos(G_X1,G_Y1+310)).

show(ab_positivo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: AB / Fator RH: +", pos(G_X1-15,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A+ | A- | B+ | B- | O+ | O- | AB+ | AB-", pos(G_X1,G_Y1+310)).

show(ab_negativo_sim):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: AB / Fator RH: -", pos(G_X1-15,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("AB+ | AB-", pos(G_X1,G_Y1+190)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A- | B- | O- | AB-", pos(G_X1,G_Y1+310)).

show(ab_negativo_nao):-

	font(18,18*4,"Arial"),
	text_out("Tipo Sanguíneo: AB / Fator RH: -", pos(G_X1-15,G_Y1)),

	font(12,12*3,"Arial"),
	text_out("Pode doar para:", pos(G_X1,G_Y1+150)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("Não possui pré-requisitos necessários", pos(G_X1,G_Y1+190)),
	text_out("para doar sangue", pos(G_X1,G_Y1+220)),

	font(12,12*3,"Arial"),
	color_text(_, rgb(0, 0, 0)),
	text_out("Pode receber de:", pos(G_X1,G_Y1+270)),

	font(8,8*3,"Arial"),
	color_text(_, rgb(255, 0, 0)),
	text_out("A- | B- | O- | AB-", pos(G_X1,G_Y1+310)).