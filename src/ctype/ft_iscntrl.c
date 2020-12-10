int ft_iscntrl(int c)
{
    return (c >= 14 && c <= 31) || (c == 127) ;
}