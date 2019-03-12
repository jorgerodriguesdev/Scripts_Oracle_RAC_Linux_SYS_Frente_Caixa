select cf.fi_cod, cf.ef_num, cf.cf_num_seq, cf.cf_val_total_cupom, cfcp.cfcp_val_total,
       (select sum(CFCA_VAL_TOTAL)
        from cupom_fiscal_cartao cfca
        where cf.em_cod = cfca.em_cod
          and cf.fi_cod = cfca.fi_cod
          and cf.ef_num = cfca.ef_num
          and cf.cf_num_seq = cfca.cf_num_seq) val_total_cartao
from cupom_fiscal cf, cupom_fiscal_condic_pagto cfcp
where cf.em_cod = cfcp.em_cod
  and cf.fi_cod = cfcp.fi_cod
  and cf.ef_num = cfcp.ef_num
  and cf.cf_num_seq = cfcp.cf_num_seq
  and cf.em_cod = 1
  and cf.fi_cod = 2
  and cf.cf_dat_venda > '07/03/2006'
  and cf.cf_dat_venda <= '08/03/2006'
  and cf.cf_flg_finalc = 'S'
  and cf.cf_flg_cancdo = 'N'
  and cfcp.cp_cod = 30
  and cfcp.cfcp_val_total <> (select sum(CFCA_VAL_TOTAL)
                              from cupom_fiscal_cartao cfca
                              where cf.em_cod = cfca.em_cod
                                and cf.fi_cod = cfca.fi_cod
                                and cf.ef_num = cfca.ef_num
                                and cf.cf_num_seq = cfca.cf_num_seq)