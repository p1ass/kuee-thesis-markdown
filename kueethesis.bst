% kueethesis.bst 21-Jan-92 by Yasuharu Den
        % version 0.30 for JBibTeX versions 0.30 or later, LaTeX version 2.09.
        % Copyright (C) 1990, all rights reserved.
        %
        % This file is derived from btxbst.doc of BibTeX 0.99c
        %
        % Copying of this file is authorized only if either
        % (1) you make absolutely no changes to your copy, including name, or
        % (2) if you do make changes, you name it something other than
        % jbtxbst.doc, jplain.bst, junsrt.bst, jalpha.bst, jabbrv.bst,
        % tipsj.bst, jipsj.bst, tieice.bst, jname.bst, jorsj.bst
        %
        % This restriction helps ensure that all standard styles are identical.
        % The file jbtxbst.doc has the documentation for this style.
        %
        % Please notify Shouichi MATSUI(matsui@denken.or.jp) of any bugs in
        % these standard styles or in this documentation file.
        % 松井 正一  (財) 電力中央研究所　情報システム部
ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    yomi
  }
  { is.kanji.entry }
  { label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t }
FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}
FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}
FUNCTION {new.block}
{ output.state before.all =
    { after.block 'output.state := }
    'skip$
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { duplicate$ is.kanji.str$
        'skip$
        { "{\em " swap$ * "\/}" * }
      if$
    }
  if$
}
INTEGERS { nameptr namesleft numnames }
FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff}{ll}" format.name$ is.kanji.str$
        { s nameptr "{ff}{ll}" format.name$ 't := }
        { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
      if$
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { t "others" =
                { s is.kanji.str$
                        { "ほか" * }
                        { ", et~al." * }
                  if$
                }
                { s is.kanji.str$
                    { ", " * t * }
                    { numnames #2 =
                        { " and " * t * }
                        { ", and " * t * }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}
FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
        { editor is.kanji.str$
            { "（編）" * }
            { " (editors)" * }
          if$
        }
        { editor is.kanji.str$
            { "（編）" * }
            { " (editor)" * }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.in.ed.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
        { editor is.kanji.str$
            { "（編）" * }
            { "eds. " swap$ * }
          if$
        }
        { editor is.kanji.str$
            { "（編）" * }
            { "ed. " swap$ * }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}
FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}
FUNCTION {format.date}
{ year empty$
     { "there's no year in " cite$ * warning$
       ""
     }
     { year }
  if$
}
FUNCTION {format.left}
{ "(" output.nonnull
  before.all 'output.state :=
}
FUNCTION {format.right}
{ before.all 'output.state :=
  ")" output.nonnull
}
FUNCTION {format.btitle}
{ title emphasize }
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { volume is.kanji.str$
        { volume }
        { is.kanji.entry
            { "第" volume * "巻" * }
            { "Vol." volume tie.or.space.connect }
          if$
        }
      if$
      series empty$
        'skip$
        { series is.kanji.str$
            { volume empty$
                { series swap$ * }
                { series ", " * swap$ * }
              if$
            }
            { " of " * series emphasize * }
          if$
        }
      if$
      "volume and number" number either.or.check
    }
  if$
}
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { number is.kanji.str$ 
            { number }
            { "No." number tie.or.space.connect }
          if$
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { series is.kanji.str$
                { series ", " * swap$ * }
                { " in " * series emphasize * }
              if$
            }
          if$
        }
      if$
    }
    { "" }
  if$
}
FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition is.kanji.str$
        { edition }
        { is.kanji.entry
            { "第" edition * "版" * }
            { output.state mid.sentence = output.state before.all =
              or
              { edition "l" change.case$ " edition" * }
              { edition "t" change.case$ " edition" * }
              if$
            }
          if$
        }
      if$
    }
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { "pp." pages n.dashify tie.or.space.connect }
        { "p." pages tie.or.space.connect }
      if$
    }
  if$
}
FUNCTION {format.vol.num}
{ volume empty$
    { number empty$
        { "" }
        { number is.kanji.str$
            { number }
            { "No." number tie.or.space.connect }
          if$
          "there's a number but no volume in " cite$ * warning$
        }
      if$
    }
    { volume is.kanji.str$
        { volume }
        { "Vol." volume tie.or.space.connect }
      if$
      number empty$
        'skip$
        { number is.kanji.str$
            { ", " * number *}
            { ", No." number tie.or.space.connect *}
          if$
        }
      if$
    }
 if$
}
FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { chapter is.kanji.str$
            { "" }
            { is.kanji.entry
                { "章" }
                { "chapter" }
              if$
            }
          if$
        }
        { type "l" change.case$ }
      if$
      chapter is.kanji.str$ not is.kanji.entry and
          { "第" chapter * swap$ * }
          { chapter is.kanji.str$
              { chapter * }
              { chapter tie.or.space.connect }
            if$
          }
      if$
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}
FUNCTION {format.in.ed.booktitle}
{
  booktitle empty$
    { "" }
    { editor empty$
        { booktitle emphasize }
        { booktitle emphasize " (" * format.in.ed.editors * ")" *  }
      if$
    }
  if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}
FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}
FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}
FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { title is.kanji.str$
            { " " journal *  }
            { journal emphasize }
          if$
        }
      if$
    }
    { title is.kanji.str$
        { " " key * }
        { "in " key * }
      if$
    }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.crossref.editor}
{ editor is.kanji.str$
    { editor #1 "{ff}{ll}" format.name$ duplicate$
      empty$
        { pop$ editor #1 "{ll}" format.name$ }
        'skip$
      if$
    }
    { editor #1 "{f. }{vv~}{ll}{ , jj}" format.name$ }
  if$
  editor num.names$ duplicate$
  #2 >
    { editor is.kanji.str$
        { pop$ "ほか" * }
        { pop$ ", et~al." * }
      if$
    }
    { #2 <
        'skip$
        { editor #2 "{f. }{vv }{ll}{, jj}" format.name$ "others" =
            { editor is.kanji.str$
                { "ほか" * }
                { ", et~al." * }
              if$
            }
            { editor is.kanji.str$
                { ", " *
                  editor #2 "{ff}" format.name$ duplicate$
                  empty$
                    { pop$ editor #2 "{ll}" format.name$ }
                    'skip$
                  if$
                  *
                }
                { " and " * editor #2 "{vv~}{ll}" format.name$ * }
              if$
            }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
       title is.kanji.str$
         { "  " }
         { "in " }
       if$
    }
    { volume is.kanji.str$
        { volume }
        { is.kanji.entry
            { "第" volume * "巻" * }
            { "Vol." volume tie.or.space.connect }
          if$
        }
      if$
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series is.kanji.str$
                { series ", " * swap$ * }
                { " of " * series emphasize * }
              if$
            }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { booktitle is.kanji.str$
                { booktitle }
                { booktitle emphasize }
               if$
            }
          if$
        }
        { "in " key * }
      if$
    }
    { title is.kanji.str$
        { " " format.crossref.editor * }
        { "in " format.crossref.editor * }
      if$
    }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { journal emphasize
      "journal" output.check
      format.vol.num output
      new.block
      format.left
      format.date "year" output.check
      format.right
    }
    { format.article.crossref output.nonnull
    }
  if$
  new.block
  format.pages output
  new.block
  note output
  fin.entry
}
FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      new.block
      format.left
      publisher "publisher" output.check
      address output
      format.edition output
      format.date "year" output.check
      format.right
    }
    { format.book.crossref output.nonnull
      new.block
      format.left
      format.edition output
      format.date "year" output.check
      format.right
    }
  if$
  new.block
  note output
  fin.entry
}
FUNCTION {booklet}
{ output.bibitem
  author empty$
    'skip$
    { format.authors output.nonnull
      new.block
    }
  if$
  format.title "title" output.check
  howpublished empty$ address empty$ year empty$
  and and
    'skip$
    { new.block
      format.left
      howpublished output
      address output
      format.date output
      format.right
    }
  if$
  new.block
  note output
  fin.entry
}
FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      new.block
      format.left
      publisher "publisher" output.check
      address output
      format.edition output
      format.date "year" output.check
      format.right
    }
    { format.book.crossref output.nonnull
      new.block
      format.left
      format.edition output
      format.date "year" output.check
      format.right
    }
  if$
  new.block
  format.chapter.pages "chapter and pages" output.check
  new.block
  note output
  fin.entry
}
FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      new.block
      format.left
      publisher "publisher" output.check
      address output
      format.edition output
      format.date "year" output.check
      format.right
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  new.block
  format.chapter.pages output
  new.block
  note output
  fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      new.block
      format.left
      organization output
      publisher output
      address output
      format.date "year" output.check
      format.right
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  new.block
  format.pages output
  new.block
  note output
  fin.entry
}
FUNCTION {conference} { inproceedings }
FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          address output
          new.block
        }
      if$
    }
    { format.authors output.nonnull
      new.block
    }
  if$
  format.btitle "title" output.check
  author empty$
    { organization empty$
        { address empty$ edition empty$ year empty$
          and and
            'skip$
            { new.block
              format.left
              address output
              format.edition output
              format.date output
              format.right
            }
          if$
        }
        'skip$
      if$
    }
    { organization empty$ address empty$ edition empty$ year empty$
      and and and
        'skip$
        { new.block
          format.left
          organization output
          address output
          format.edition output
          format.date output
          format.right
        }
      if$
    }
  if$
  new.block
  note output
  fin.entry
}
FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  school is.kanji.str$ 
    { "修士論文" }
    { "Master's thesis" }
  if$
  format.thesis.type output.nonnull
  new.block
  format.left
  school "school" output.check
  address output
  format.date "year" output.check
  format.right
  new.block
  note output
  fin.entry
}
FUNCTION {doctorsthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  school is.kanji.str$ 
    { "博士論文" }
    { "Doctoral Dissertation" }
  if$
  format.thesis.type output.nonnull
  new.block
  format.left
  school "school" output.check
  address output
  format.date "year" output.check
  format.right
  new.block
  note output
  fin.entry
}
FUNCTION {misc}
{ output.bibitem
  author empty$
    'skip$
    { format.authors output.nonnull
      new.block
    }
  if$ 
  title empty$
    'skip$
    { format.title output.nonnull
      new.block
    }
  if$
  howpublished empty$ year empty$
  and
    'skip$
    { format.left
      howpublished output
      format.date output
      format.right
      new.block
    }
  if$
  note output
  fin.entry
  empty.misc.check
}
FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  "PhD thesis" format.thesis.type output.nonnull
  new.block
  format.left
  school "school" output.check
  address output
  format.date "year" output.check
  format.right
  new.block
  note output
  fin.entry
}
FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          new.block
        }
      if$
    }
    { format.editors output.nonnull
      new.block
    }
  if$
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  new.block
  format.left
  editor empty$
    'skip$
    { organization output }
  if$
  publisher output
  address output
  format.date "year" output.check
  format.right
  new.block
  note output
  fin.entry
}
FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  new.block
  format.left
  institution "institution" output.check
  address output
  format.date "year" output.check
  format.right
  new.block
  note output
  fin.entry
}
FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.left
  note "note" output.check
  year output
  format.right
  fin.entry
}
FUNCTION {default.type} { misc }
MACRO {jan} {"Jan."}
MACRO {feb} {"Feb."}
MACRO {mar} {"Mar."}
MACRO {apr} {"Apr."}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"Aug."}
MACRO {sep} {"Sept."}
MACRO {oct} {"Oct."}
MACRO {nov} {"Nov."}
MACRO {dec} {"Dec."}
MACRO {acmcs} {"ACM Comput. Surv."}
MACRO {acta} {"Acta Inf."}
MACRO {cacm} {"Commun. ACM"}
MACRO {ibmjrd} {"IBM J. Res. Dev."}
MACRO {ibmsj} {"IBM Syst.~J."}
MACRO {ieeese} {"IEEE Trans. Softw. Eng."}
MACRO {ieeetc} {"IEEE Trans. Comput."}
MACRO {ieeetcad} {"IEEE Trans. Comput.-Aided Design Integrated Circuits"}
MACRO {ipl} {"Inf. Process. Lett."}
MACRO {jacm} {"J.~ACM"}
MACRO {jcss} {"J.~Comput. Syst. Sci."}
MACRO {scp} {"Sci. Comput. Programming"}
MACRO {sicomp} {"SIAM J. Comput."}
MACRO {tocs} {"ACM Trans. Comput. Syst."}
MACRO {tods} {"ACM Trans. Database Syst."}
MACRO {tog} {"ACM Trans. Gr."}
MACRO {toms} {"ACM Trans. Math. Softw."}
MACRO {toois} {"ACM Trans. Office Inf. Syst."}
MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}
MACRO {tcs} {"Theoretical Comput. Sci."}
MACRO {tieice} {"信学論"}
MACRO {tipsj}  {"情報処理学会論文誌"}
MACRO {jipsj}  {"J.~Info. Proc. Soc. of Japan"}
MACRO {jorsj}  {"Journal of the O. R. Society of Japan"}
READ
FUNCTION {set.is.kanji.entry}
{ author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}
ITERATE {set.is.kanji.entry}
STRINGS { longest.label }
INTEGERS { number.label longest.label.width }
FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}
FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}
EXECUTE {initialize.longest.label}
ITERATE {longest.label.pass}
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
