#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: myarovoy <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/09 13:45:54 by myarovoy          #+#    #+#              #
#    Updated: 2018/05/09 13:45:56 by myarovoy         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = libftprintf.a

CFLAGS += -Wall -Wextra -Werror
CFLAGS += -I includes/

FILES = ft_printf.c \
		conv_char.c \
		conv_num.c \
		conv_str.c \
		conv_wstring.c \
		conv_xou.c \
		handle_buff.c \
		handle_spec.c \
		padd_prec_handling.c \
		parsing_format.c \
		bonuses.c

LIBFILES =	ft_strlen.c \
			ft_putstr.c \
			ft_strchr.c \
			ft_strnstr.c \
			ft_strcmp.c \
			ft_strnew.c \
			ft_memset.c \
			ft_memalloc.c \
			ft_memcpy.c \
			ft_strcpy.c \
			ft_strncpy.c \
			ft_strdup.c \
			ft_is_there_chr.c \
			ft_intmaxtoa_base.c \
			ft_intmaxtoa.c \
			ft_insert_symbol.c \
			ft_strndup.c \
			ft_recalloc.c

.PHONY = all clean fclean clean re

PRINTFSRCS	= $(addprefix src/, $(FILES))
LIBSRCS	= $(addprefix src/libft/, $(LIBFILES))

OBJ = $(PRINTFSRCS:.c=.o)
LIBOBJ = $(LIBSRCS:.c=.o)

all: $(NAME)

$(OBJ): %.o: %.c
	@gcc -c $(CFLAGS) $< -o $@

$(LIBOBJ): %.o: %.c
	@gcc -c $(CFLAGS) $< -o $@

$(NAME): $(LIBOBJ) $(OBJ)
	@ar rcs $(NAME) $(OBJ) $(LIBOBJ)
	@echo "\033[32mCreated libftprintf library\033[0m"

clean:
	@rm -rf $(OBJ) $(LIBOBJ)
	@echo "\033[32mRemoved Object Files\033[0m"

fclean: clean
	@rm -rf $(NAME)
	@echo "\033[32mRemoved Object files and library\033[0m"

re: fclean all
