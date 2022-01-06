#!/bin/bash
clear
resp=""
while :;
do
	echo "Deseja acrescentar um novo aluno"
	echo "-s- sim"
	echo "-n- não"
	read resp
	case $resp in 
	  "s")
		#inicializando as variaveis 
		tempmedia=0
		media=0
		clear
		echo "Entre com o nome do Aluno: "
		read aluno
		echo "Entre com o RA do Aluno: "
		read ra
		#fazendo um for em array com 4 elementos
		le_nota()
		{ 
			#clear
			nota=0
			echo "Entre com a nota do $i bimestre de $y : "
			read nota
			while ! [ $nota ]; do
                  		echo "Entre com a nota do $i bimestre de $y : "
                        	read nota
			done	
		}
		for y in Português Matemática Geografia Ciências
        		do	
				echo "Entre com as 4 notas de $y"
#lendo as 4 notas de cada materia
				for ((i = 1 ; i <= 4 ; i++)); do
					le_nota
					if [ $nota -eq 0 ] || [ $nota -lt 10 ]; then
						#fazendo uma expression na nota
						tempmedia=`expr $tempmedia + $nota`
						echo "$nota" >> $ra-$y.txt
						nota=0
					elif ! [[ "$nota" =~ "^[0-9]+$" ]]; then
						echo "elif" 
						sleep 2
						le_nota
					else
						echo "else"
						le_nota
					fi

				done
#fazendo o calculo usando a calculadora do bash
				media=`echo $tempmedia/4|bc`
				echo $media >> $ra-$y.txt
	
				 if [ $media -eq 6 ] || [ $media -gt 6 ]; then
         	
					 echo "aprovado" >> $ra-$y.txt
		 
				 elif [ $media -lt 6 ] && [ $media -gt 4 ]; then
	
					 echo "recuperação" >> $ra-$y.txt
				 else
	 
				 	echo "reprovado" >> $ra-$y.txt
        		 	fi
			       	unset tempmedia
       	   		    	unset media
				tempmedia=0
				media=0	       
		        done

		echo "Aluno:  $aluno, RA: $ra"  >> historico-$ra.txt
		for x in Português Matemática Geografia Ciências
			do
			  echo "$x" >> historico-$ra.txt
			  cat $ra-$x.txt|xargs >> historico-$ra.txt
			  rm -rf $ra-$x.txt

			done
			;;
	
	"n")
	    clear
	    echo "Foi gerado o histórico escolar do Aluno: $aluno, RA: $ra"
	    echo""	
	    echo""	
	    echo " ;):):):):):):):):):):):):):):):):):):):):)   OBRIGADO POR UTILIZAR NOSSO PROGRAMA   :):):):):):):):) "
	    echo ""
	    exit 0
	    sleep 2
	    clear 
	    ;;
	esac
	if [ $resp <> s ] || [ $resp <> n ]; then
	   #clear
	   echo "SOMENTE É PERMITIDO -s- ou -n-"
	   echo ""
	fi
unset resp
done

#Observações

#&& significa "e" - || "ou" - unset "apaga conteudo da variavel" - > "criar e redireciona para arquivo" (>>) "append ->(acrescentar)"

# 1 - Para o lar  --- Fazer o programa acima ficar em loop até que seja digitado 99 enquanto nao for digitado 99 perguntar se deseja acrescentar um novo aluno se sim digite "s".

# 2 - desenhar o diagrama de bloco do pregrama acima,,,

# 3 - dns-- postfix -----compilação---- tar.gz---- crontab---- nfs....proximas aulas.
