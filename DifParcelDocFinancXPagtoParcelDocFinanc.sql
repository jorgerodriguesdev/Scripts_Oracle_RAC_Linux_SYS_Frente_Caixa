select *
from parcel_doc_financ padf
where padf_val_desc <> nvl((select sum(PPDF_VAL_DESC)
                            from pagto_parcel_doc_financ ppdf
                            where ppdf.em_cod = padf.em_cod
                              and ppdf.fi_cod = padf.fi_cod
                              and ppdf.df_num_seq = padf.df_num_seq
                              and ppdf.padf_num_parcel = padf.padf_num_parcel),0)
  or padf_val_juro  <> nvl((select sum(PPDF_VAL_JURO)
                            from pagto_parcel_doc_financ ppdf
                            where ppdf.em_cod = padf.em_cod
                              and ppdf.fi_cod = padf.fi_cod
                              and ppdf.df_num_seq = padf.df_num_seq
                              and ppdf.padf_num_parcel = padf.padf_num_parcel),0)
  or padf_val_multa <> nvl((select sum(PPDF_VAL_MULTA)
                            from pagto_parcel_doc_financ ppdf
                            where ppdf.em_cod = padf.em_cod
                              and ppdf.fi_cod = padf.fi_cod
                              and ppdf.df_num_seq = padf.df_num_seq
                              and ppdf.padf_num_parcel = padf.padf_num_parcel),0)
  or padf_val_pagto  <> nvl((select sum(PPDF_VAL_PAGTO)
                            from pagto_parcel_doc_financ ppdf
                            where ppdf.em_cod = padf.em_cod
                              and ppdf.fi_cod = padf.fi_cod
                              and ppdf.df_num_seq = padf.df_num_seq
                              and ppdf.padf_num_parcel = padf.padf_num_parcel),0)
  or padf_dat_pagto <> (select max(PPDF_DAT_PAGTO) 
                        from pagto_parcel_doc_financ ppdf
                        where ppdf.em_cod = padf.em_cod
                          and ppdf.fi_cod = padf.fi_cod
                          and ppdf.df_num_seq = padf.df_num_seq
                          and ppdf.padf_num_parcel = padf.padf_num_parcel)