-- ==============================================================================
-- CODELEARN C++ ACADEMY - SEED DATA & DUMP
-- Tạo lúc: 2026-10-13T23:16:23.951750
-- Tương thích: SQLite 3 / MySQL / PostgreSQL
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `users` (3 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at, current_streak, longest_streak, last_study_date) VALUES ('user-admin', 'admin', 'admin@codelearn.vn', 'b63c0e4bfd5ac27c4650220372805f3af66360e65cafbe0b537f04b43e94cc51', 'Quản Trị Viên', 'admin', '', '2026-10-05T13:01:59.709488', '2026-10-05T13:01:59.709488', 1, 1, '2026-10-05');
INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at, current_streak, longest_streak, last_study_date) VALUES ('user-student', 'letrunghau', 'letrunghau@codelearn.vn', 'b58be62b65fb8bdf0998a214aa48c780b301a98272772fba96d1f28e3dca3953', 'Lê Trung Hậu', 'student', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADb/2wBDAAQDAwMDAgQDAwMEBAQFBgoGBgUFBgwICQcKDgwPDg4MDQ0PERYTDxAVEQ0NExoTFRcYGRkZDxIbHRsYHRYYGRj/2wBDAQQEBAYFBgsGBgsYEA0QGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBj/wAARCACqAQADASIAAhEBAxEB/8QAHQAAAQQDAQEAAAAAAAAAAAAAAwECBAUABgcICf/EADoQAAIBAwIEBAUCBQIGAwAAAAECAwAEERIhBQYxQRMiUWEHFDJxgZHBI0JSobEz8AgVFmLR4SRDgv/EABoBAAIDAQEAAAAAAAAAAAAAAAECAAMEBQb/xAAoEQACAgEEAgIBBAMAAAAAAAAAAQIRAwQSITEiQRNRYQUUIzNxkeH/2gAMAwEAAhEDEQA/APCX36elKD3/AM0uAcGk8xJ7VagD9IPc59aUAKcY3rEVhuacOuetMAwKSetOG21YupttOPenEBfMTtUIIASdyRTtO4AAP3pR5167UpZACAMmp6IZp21Gm5XO29OBLLvkCm6SD02+1SwUITlsAVg1Z2Ip6qwXYEjqQKajZUhlYb7ZFDsJmB9z60sYG+5zTiDjGQAKzAbGN29qXn0Hga2dW+Wx0FM0MX69e3pRSkgziM/rSLHIeqjGegO4+9Sg2A8Mr9L6vaiLGUjLOxz6GilF14HX1pVQMCrHY9qnQOyOJI2GhsH7ilTTHnSWo5t00nAAPtTBbhVGot9qn5sILEh8uk49aVUZck/3p4IOyagw9awqWOTJ+BUtLonY3Rsd8n1FJhSoOneiOu3oO1MbCrhqNgGNkDIXNDbJOx/BozPlcDahEZPoTSt2ShmN6TB1bUulgKTcDJGKisgoJ770hHcUvv2pcbEGiQHjIpMdutEx7UhA07GoRCoR9qdgkbf3pq7fSDmn5YgD6f3ooA4Z04ABNLGCD5qQHA260hZSPMBRboIXIcEAj70gxjBUH+9D8VdIVVH4pyKeoFCyUGUgnGAo+1NLgHc0hXURkkGlWNaXewpGCRydhgURA3iZO+eppv0g9vel8RAQNW/pQi/ojQUrKXwjAr/ei+EqxZlO/TrWImI9Xv1pGQlvNucjrRdJ0FK1YIQl3x9K+1E+QV0ykjfg0VX8M4VSW9e1EUTfUCPvihKb9BjFeyMtr4TZ0nPqSTmsYNnJXTipJ8Zx5gD9qxVBk0uCT2HrSqV9jOP0AWISgADB70NYGEpBKkg7b71PNpO28SBR7mgNbzaikqEHrqBzVipiNNAtIHor5pBGxbLyDH6UYWgOG0s5x1JxWeB5vNj8b0rpvsKVIGYEfJDkkbjBxQ2s/DcOjHB9akojLqyAQO570uvyBWGVPSinQKshyRS+HqRhj+bIzQ/DBjwzDV6Y2NSyFAOlSARg+lDK7atO3So5cgoieAy9ACKTZhg9u1Scrnp1H6UKRMEMq5HehYKAlce9M6NkUYgN02Pp60LGN6hBpVT5lG/cUh6DNL/NttTthsf70U2QHuKQnAIpz4I2amYyd6m4ND1Y7dAPWlJYd8k0oUk40gAUoKjfbNFySBQjBlHbH3puw3O596fksSBTo4Q+ckUOfYRI9m2UUVQDuvf1pqqMnB6bU4KVz7dKSTsKQoBG5Iz6Up60mqSU7YHpRYrNjJqkYtj06CpVcsPfQNIJJn2Xy/1VYQ2tvEpGks3rTkTRkkdttqYhleN2DAAMQcbmkeV9RLFj+wkksIj05UEd+lRQ0t3KUtwAindiakpCuNMseQfXepMZjij0xoAB0IFK5pcjKDfYJYVVAGPmo0agDU+4Gyr70zOuTIBz71J0BosE4bOcmq5Sb7LIxS6AmRiuMAj1pqqDg50t/KcfvRlhUyaQdWNzRRCCpOM7U8eAO2RszLkyK+QfrHQ0Ulmt9aAORUtVHhmN1DIetMSO3tnYRQtNnqAaLd+gKP5ImidjlsMO4JrBAScd/wCnGKmm4dwG8AhTsc4BFKiWswBkmZCP6RUTl0kFxXdlcY3RgSMAeo602eNpCAIsAdNIzVg9smCDdF8HYUjQSLCDHIu3XIzTbxHCymaC5IbwlDFRnBGKZGxZfPGV9qt4hMwYbbjGRUSSFlchlxU+T8CPH9EIxgjBZfzTfDwoAIP561KaI6C3p7UCWHVFqQH8GmsWiO8TL1Xyk5BHahsmoZGQaNIjgDHftQizDY7qe1MKwAAyehpGH5B6iiYR9gSppNDnbTn3FG+AEV1cfT5h29aegz9Q0+1E0+bfO9KVwck7dMUUkAYSBuScegpvmI8q7ZpKVdevKA7UEEKisq4bfajDwzHkgkjfFJkugL7MetKFKbt0z+tJKVjJD2wqEsnvSBCVORjPY0QecaSd6eYzkljhQOtBMagMI3BUZwc5NTH4jaWtuQ8is5/lG5qlvbz/AOmFsDuRVadzRlDd2CM9vReScbyn8NPMf6u1RRxW4BGlgB6YqtzvS5OfeiopAc2y+t+K27s3zbSAAeXQucn067Vd2yR3cyQWkkc+pQdEbb59CD3/ANitGBosczxOGRmBByCDilcF6GWRrhm+GzaFzgFQvVX7Uvy6z4VUZj6qSMVB5f41Ne3KWdy4Z22EjtuT9zW2xQm0kdREfEP1DHSsspOD5RrhBTVp8FXb8OCEByygn8iprW1tEAA7FzsBR5pHnUYGCD9Xbao/hXDTjo2dyw7D0pN85v6LNkIKhF4cmvVqeUnrnYfpTGS7hk0RWMJA6MX/AGq4tbW6wP4e39Pc1Nbh9zK4KRRqh3J3ytWyyRXixIwb5Rq0sMjhWuVXPop/alXh00hzGqoMdW2rbF4faRREMPEkI6mqy5tHRiHGF9jml/ceoBen9zKOWyZAdSpJ7ig48NihB0ntjNXfy6kYJAPbNDuLZQmlgp7ajUWVdMDxtcorYUTT5Tls7HtiiSwRAASDJI7UWGwaIsV85VdQUmo0UiyTE3MbwsCfNnIOKeMl6K3H0yumhXLBSQO2agyoyzjS2+n6getbJcWsU6GWMhehOF37b4qjliCXJKklRgYIxTrImJKDRFdpNJGRn3FR2Ylc4674x0xU9zGV2TORjJqKS2AyqBpGNh+tMmvQjTIc6s0ZKoMjceXFMgnVmK6GVl6ipLAtp3O3SgMi69xv/enXJWYUSSJmTBJ9aj+YE5BGKK0bIjFDt2yaFHNljHMhB/q7USdiqmCNgfXJp4ODuNvSlVRjOMk9fanBcHcj80G7CqHBQVBxnfoaJgMpz+M0wYJyBt3owRUTLHOf7VW2OkR2lbxCijJp1wXgsS7MCcYA7UhwZ9SLkgd6h8Slk0LGzbZyBVsehH+Stc5NN6dqcd+lNphBe9LjasBBrD1qEMpRSU7FQhLspHgnWdCwCn6h2Nd44ba/9R8jWHMkUWllDW15oTA1R6MOSBjLB1z3zueorgsCFlJAyB1Fd/8Ahc/HYfhTfcLTiLR8JubpHEH8rsR1P20DI9h6CsmqpUzoaOEpWkQBYwg6y+VGwGMYp8FqJJiyADtWx3HBHLaZnjGN9Kd6kHhsM1wwhi8BQBhc6iv5xvWSU9vC7NXx32VVvasUJI0+mKkrA6oBKoMZI3I9DV5wvglzeXa21vC8spIVVUZZifT1rqdr8FuMcx8vzTcMgjintYxHJG7ZMhwcsMb7VQ7k0qHuMVyzhl1wyNRqQSAHfSBkCoCxLC+XgkZf+9Dv+cV1ni/J3EuACQXFixVHMZlCnSWGx3+/7etaNzLxi04JweS5viIgCQqgZLn0FIptvakNtVbrNWm4XYylgjIiMd43TBUnuDUOaxHhNFcaZEPlJA2Ppt2rSOM/EDit67x2aR2sWrKtjL4Gds/n/FUEnM/HnUK/E5zjpvW+GlyVyzFPU40+EdJ+URR4SuQw6HUTn2370BoYZImhEavPqGVkGnSPU/3rn1tzVxm3fLXPirnJWQA1s1nzlbXwj8cGC5QYydww9M07wziKs0JF+bRViOllCk4OPLiqiW1RrxIHQhgWUlSTq9yO1Xtu8V9bBkI8wyPtVZOXS6F4w0qgwcDBznr/AIqpTp0PKKaKma0CL0Eka5JZNjgevvUaaAYHhrksAQM7/rVnMo1LKqnSWLaV6EVCkhbxMjPmH0npj2q+M0yiWMrpVXwmlQEKpwQ3UVElGp8bdcfarGdDGpJIGD0PeozIrIduvWrlJlDiV51MTn03oYB1YU532P8A59qmugAzjoMZqOmDnWNJ7GnTEaF1bjGwphGssudl9KxmVHOTuBQxJ4kmiMbdSPWgo2Gw6SNoZTtg4pUVSNKEkE5yxzj1oqWzFlVmBfA8oG2PWrvh3A7i8lyiiNB5SxGcH7VZDG5cpWK5JcPgrIogUQ+GGJUtg/2H+aq+PQeE8TLkqQd/euy8C+DfMPM0TPwS6srll6q0hjI79D/vetF585O4/wABjmg4nwe6t5LRwsrGMlF2/q6b/eqN9T2su2XG0c7zuNqysINLV5QYKWkrMZNQgveiRgswUdSdqZ2p8Ss0owCd+1QKVs2HgVkycReKaMlcqpztv1r0By3p/wChrfh8EPy0AunlVN+nTO/3auVclct8T4zxtJ5YZI7U4Esh22HTFdsW20wrDGgSNBpUe1cXWZrmkjv6OGzG2w09pbIIzDNrJXsMb+lToI/BsIMLHqkYuW6nGdIU/kE/mhWNnJISWjLIhDFgudI/atsuLSO1uvlRaRxyRIsbgb6mxu2fesWfP5WjTGN8kTgarFxOG9jDxTxSK4fWAGAPoV2PT1r158PLziV4bfickYe0ulPnDqWD9SJMKMn3AGfQd/LvBLKGbiMMMyworMMtI2lAPc+leiuBfFLlrgwt+GwO0wHhweKZHZVz9TeYnCj27Vdos0d1ydGDWwbVRVl/8VuUYuM8mXHgTWFiyxuTPODhM4JAAG2ogZbqMbDevlX8WeISXPO91Z+KDDat4aBTldu4+9fRv4/fF/gXLvw6v3hZ7tprZoLae3fypMzMpGfUaQfsc18tOP38t5xSe5mlMkkrl2djksSdzXTxxjPNvj6Mm6UMDi/ZRync70A7HrRXOTnvQTW9mAaaaTilzvSZwKBDZ+V+YZbO4SznfMbHyk9j6fmt44i3i2PzMLdtZyBgN7+1cfGQ2Qa6lybcxca4K0dxIQ8OFdR/N6H8isOqx15o26bI5eDHxoJFmfSQy7hR1JxvUZklRmDLhPrYyLgJnbBrbJrazteGSOsQ8R2A1Zwf19Ko5ZY7iOK1AbxEXDuwwGIOTj74rPCZolFmucUKRW6yBhJnZgu+AKgRyB48qpxVlxC2EYmutflbOFH36GoUMfh2y52Zhk575rZGSrgxyi75I7rkZwc1HZCXxj/1U+WNY1Ds46A4H6UN4wwYId/Qdz6U6kVtMqCUkGNwfejW8KjYY1dayPBIJAOamLGkBMjDLHoorVDHLI9sf9lEpqPLJEQEcYll2cjCj0FXPBeN3nC9YjUPHJjUj71Twgk+JJux/tRfGJkGCAB6V2YYoQgoVwc2U5yk5Ls6RwbnDiDyLquhw62cmLMJKBtvMXbPQZAwOpNbnd83cH5j+GPE+AwcflVflnXROo8xG+2cHt1rztNxGRbu3wuVh2GrcZ1Fv3oN7eSu0ihyqyEvhTgHO5rzer0/y5XJOqZ3cGfZjSfJr7LpdhkHBxmm4osqaWPY0L7itBmMpQtKq6jgLmrzhXLl1xBgznw4/UjJP4pJzjBXJj48cpuoop40DkDOBXWeRfhs081txbiRhbh5iS5yrZLhui9OvYiofK3IQm5kxfQyfJRR62LL9Z7D8mu0cPSPwY7aOKOGCIqiRhcKNs5wPauXrNZxtgdjTaJY/KfLJltbwm/aVYViQKNEaLhQMYHp6fmry3tI5oQzIEUnckdvWodqYTxUifIYgE52LbegraOGycOs7uG640ga2Q50E4VgPU+lca5ZJqKOnGPqjduUeUbe35VfmSKO4v7IxmUWxQwvcAjToZD/APo/gVE4vytb3XAV5p4DFcrYGTwp7aXLG3Ynbzdx29jgZ3FFm515Ot4+HcP4pJcXUTT/AD9tOkpAjbGApz2x2qYvP3LfMfJc/K/LNlc28Vpfa5JSD4cpw2cE9Tvkj2rRkhHa39F2eL28L/iNZfhLQWTXEjhtK5Kqd6yGPSznGAqjOc9auBAFVoJRlXXBFRZoY7e0e5uJYre3U6nmmYKifcmua230ZVG+DhH/ABB87Rry1wzk22togWnHEpZjkvGAjIiA5xg63JGOqrvXmWeZpJSSc10L40cbg4t8Sp3s5Q9ukMcaEAgbLvsfcmualjnNev0EHHDGzh61/wAriITTSaw7GmVrMJmab3pSffFJ2qEM71sXJV7Lac0xJG5AmBQgbg+m1a4cY96uOVzIvNFq0a5ZXBH61XlVwZZidTVHXLqRhAxuACgGcHaqmSNZysitsTlSp3Xc7ffrV3bok8bSORJnbTjp7VEueDx2cDPbEqDgrGTt1/3+tcaDR1ZJ0azxOOSVUUAZJyYztv3qA8WFXRuD0z0FXF5NNeOUwFii6vjdj6A1GkjTSMoDj77Vsi2uDJOnyVE4EhXzZ26EdqCHPhsYj51PUft+akSrpnZCgYDpkU0S6cr9AI6rVyspZX20Yi1OcHfy57UaJGmfW2yimqmrCDoOtNlucERR/SOvvXoMcY4oqzlSbm+A9xdAHw0wB60GOVjcDeorHz5PY0VGw4ag8rlK2MsajGgc7EXDrnbNCKs6hTjboanSRiUeIBvqxQPDYbYrBka3s0xXiiI9rrG5po4ZI+0Z1NnoamiNidzVpwi2a7uxbwBdXqxwKrm0lY8Fbobw/lziNusU11w6aJH+h2Q6Wx6Hoa6jwThENjYoZ0Kyt9RK/Tt0+9bb8L+EX0PE4eHcfntbrg0pBlidv9LH8wJ6EetdI5o5Ej4tyVFzLweZWuVmkQgqF+biBOmQ4216Rue/Xr189qcspTr0d7Aowx8dnM7CCQqJIwWU9Mb1e2sA8vl3DElW23xj961zhUkc/kZASZfD0kZUYOx71vFjbXd3OltAhZycljsV9SfQViytp7UacfKtk/gHDRxLjixuQ2FJffGVx7VeXXC4uL33/TTcLhkjuIHjDlypjBGNS9tQ6jORkVZ8ItbPgkCkaXlIw8jZ83tjsK2blvmHlx+N3d1xWCKDwVjVJosgLqYg5BJz0HpV+PGornsqlne7dE4lzT8KebLPmdOBWd3q4ZGist1PIuqEY6MAckgemxyOnQbdwTl1OWuXIbG0u5pmQl3lJyC5G7BSTp6bYrceKXpvuPX0rsHDSfwp0OpZEI2KkegwDUEQIisdXUack7D0rn6jPNvb6NayynHljor3h9m8MnE5JSjHGE3Z29BnYdK0++j5n4h8X7yfmbgcFvytwuDxopLlP/jvtqRI2JCvITjLb6QCMjIzccY4PLxpre2t7hUkSQOFcnbAIPTrsTWr/EXmW24DydJwKOa8Zo4yy+MgMfvnzdO/StGjjatIeGaGNcvk8f8AOXFH4zzzxPiTKqeNcO2hPpXfoPaqE9KPfSmbiE8rbl3LH8moxNesgqikeTzS3TcvswmmmlJ83SmnrTFQnas7UmazNQg6NGlnSJcZdgoycDJNbzy/wOCz58ubb5jxI+HoDLLGR9QALEAnfByK0VN3FXXBL2a0nlnQ4eUY1kZx+Km1S4fQVLbyuzrvDuIcNlupo7WUyDGQWTSW/H/unyT/ADDP4xBK+Ub9MHpWg2l1OkguPFcy51aydya2JeNW0wCR6ldRhw3U++34rDqtJ8b3Q6NmDU7+Jdk28topYgkSBMDYDuapbkx28BQfUdtQ/v8A5qZPxGSMHw8gkYLEdKrJYDIPF3kcqdIXpVUGWSKV9TTP4mRjcAHb9awJ8wB4JB2JB+1HudKgKTls+b/wPSo5Z0WSOLoduvfrWmLMzVdkOaQRRaB9RqCDvmskcyHJpoPauvlybmYYR2okEBk1Gnw7yKO2aAGyuM7elGhKiUHpTRabQGuGWtjD8008IKgqvijPfT1A/BJ/FNurJwmpBQBdPbXyXVq+GQ5FW631teRkwlUcnJiO2Pt7Vh1Kksm6PRpwtOO1mvulwMrggHrVzyjxOy4LzHHc8TgMtv0YDqPeh3EbAEkD9ar2khDYbzew6Un9iphXg7R2yDjMHOXMcXDuBSyw2asqlVTTqHck/tXqHh1pwxbDhfCl4gii3Q2r2bHYll1Aj/uGn9Ca8Q8qc5Q8un5iOEAoQdure1di+HfxdtuIc2vLfRBrm4ZWxjI1A7HB71zM2kcHcVwdHHqFNJN8lLcObPnniFjA8w0XTpFGsZOfMRgAD16DrXbOX+HSW9hEjJm9l2fGP0+w3/SiXHw0STm5edOFWTNHLDqW3VydMpJy5yem9Fv+LRcDtxawsRcMuHk6H7D0rFsju3M0b21tQ/jCWnDFLzSSX92Nks4ASM/9x64rnF9ecSTiLWL2k4nnkGYBGyksegC/4q0m5mjtr1ZAZYpVbUs0ZIZT65ro3InxUk4lxWDgXHJIrnxfLb3RUBtQ3CuOm/Y+tWObnxXBFHZyjUOI2XEeUOF8PmveICKadfEmtwpIgGR136+pq8N1b3tis0T52yNPcn/zWu/ETm7hXFfjTdcn/wAMyx2KSA6sq2dWpSM7EDBqi4V85wyOSI8QWW1tv9NbZzr09wy49P19q5WrxNSaao24ZKUU0bk/H+CcsXq8S43cTtIudFlAoyx36sfp7bYPXsa418WOfeXOZI/AWyurMsCZphIr/wAMb4C4G5OF6962DmuzsuKmK8vuLS2Sw2uAgiD5YFicnV1rztzs9xZcVa1lmZnZFZw2MjO4XYnpXY0emiopRMOfK1bZp1y/iXMkn9Tk0E52pWJLbGsCMfpBJrtI4r5Yhz3pp9acwZeopmfaiAw9OlITSGs2qEJEESyOFc6Qe9XKwgCNlUALsQKpoJMPg1eWUviqVOx6VZChZFjaON4id16Us0jQXsc2cA7GoYk8PiC46HY1MuVEtscdRvVrSfDEXHJsqPE0fnZXQgeY96r7id+Gzq6NmFsjB6AGovCroy2Xy8rfQcfii3YBglSdxjSSpz9P61xHjeObidTepxTIEj65jPId22GT1oYCENqOnbqO1PVLiSBHCacr1bahMYEkIaQO3VlXt+tXRKZFErYIBpxoed9zinhl09RXT/yYxQaIpoWR6inhh0zRTAE37NjNNOrP70gek8Q9KLIO1MThnJH3rNW+BTPespaDY4s2MZNSrC/uuH3a3FpM0Uq7hl61Ez2o1sEe4VZDgE1GkRNncfhp8c+drfmbh3Brq+e7iuJ0gTxDgLqIH6V6Sv8AgN/cB7zi8dhFKfMVkc6t9+wNefPhD8LzxjjVnf8AyTaI2EviFdttxg/ivUfiCPll7XiQBWNsL4u5HoR6Y2/FcPVKEp1BHVwOSj5M5hccw8vcCujJDqvpF6xCEJH7g6sk/oKqJeeuWjcLc2nKVjw+5iPjm5R8BAvmJ9B0qZx+TluW34ldJy9bS38APjRuzjOCMkaSPvtXnb4kcxJa8PNjw2B7db7KvmQvhAQSAfQ7Dvtmkw497otyZNqthuTOZbjmf/iLu+Y7l213hmZc7FUxhR+FAFdwm8OJ/nIUXxOj5Gz+v715t+EoJ+JEMwU+GkEmSO21d6vbmT/l1yIjIH8JtJG5zg9u5rN+qRXzJL6L/wBPl/E2/sr+dJrS25fMt9dSKRLqZQRqZQdRz2AJ2HfpsK81cVu5OI8Tmun1DW5bzbnc9K9HDgs3M9xaxX0Fk4t5Fkmt44d30nJ8Vcnbr2/Jqq+LNtwHiVwk97cwWltZoIhDAqqQAML5QMfgV0dKtioyahOZ58hiEs6rjCE4Josskcdy8cJUR52bFbNHwvh16DP8u8MONEEY2L4A87ffNV9/wu1hTTAoVl9O9b4xcjBLxRSs0R+lGfPc0z5d23wqipSoMkHYinlCB7VaoFTkVzwaRtuSaaIHB9RVgsZZi7D7D2oixjfIorHYNxVMjJuKsbK8Bdc7NkZ96SSJfT9KgENFLn9KWnFh7ReuT8wzH1qyV8Ow65qngl8VVbrnFWLNi4q2PIjJvCSE4i2OhU9qlXItf+aSweGHuQmoSOcgbZ6VBsZ/l+IiQehGPWnTF2uxOdJbceVu3XGaw6lfyWasMvCgInml1Gc4K7FR/LVfJqa8bw9yzaQB0FTCpd3cvoDbBAf3oMgNogeLd26MRnT70kUST+yjV875NMeQ5pi/RTa3NlFD0dtYwanjYVXdqsE/0l+wowJIWkzWHoKaelM2KOzWZpvesHWlDQ7Oe9OB3FMHU0tBMlHV+R/jpzrydZR2VrcR3drHskc65Kj0BrpvL/xxu+b7p4OO+FbRkaf4e2n3xXl+H6jVhA7pMjIxU56g4rPl08JJ8F+PNKLPSvM/zPAOc4OKW0ubfiEIkB7Ejynb/fWuRfGO1TmHnjgUHLthpVuGAvDENo38WTUSew26muqczu8nwq5akkdmfUw1McnGPWtWsCSRk5yrg57jP/s1zN/xeaN7h8nizT+VbC/5Pl8a0SOa8mXw5hKDhVznCjuOm9dT5Z4nNxvjMMVlZpLdnIMOTpx0Of1O4rTONknh4UnIyRj7A4ravgi7txC9nZ2MqQeVyfMvToe1Z0vmlvn2X/1R2x6Gc+c733ALnifKvLsa251iO9uYzlyABqUZ+kasiuD8S4hecXvStxI3y6NnH9R9z3rceZJpn4vx6Z5XaR72Yu5YksdXc9609gBYwYH8ma7+DHFJJHIzTk3bCtfFLVEQaQhJBB65wP2FRTMXPmbOaY30H7UBfqNa0qM7YsqKTkdfWhksTpbb1op6UOSo1XIEzGYAYoRY6dqR+lIelVbmxqBkuWwDio84yKk/ymo8lUsZEnhjFn0ehzVtI38XNUnDCfmz9jVu/wDqn7j/ABVsHwLLskK3m1Zx3qQEj0CTUxx5Tv8Amoi9fxRW2tlxtVOpXCLMT7HgwpITpBPcCotwCziT+wqWwA6Ad/8ANRJ/pHuTVEVQ8mf/2Q==', '2026-10-05T13:01:59.709488', '2026-10-05T16:04:47.126238', 2, 2, '2026-10-06');
INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, role, avatar, created_at, updated_at, current_streak, longest_streak, last_study_date) VALUES ('user-e1bebac2', 'nguyenthibaongoc', 'baongoc180220@gmail.com', '5fe8513f50d8666aa17865175eeb4436a2ef86568b87d156e5ba68037cd8f7e1', 'nguyenthibaongoc', 'student', '', '2026-10-05T15:11:57.576285', '2026-10-12T19:17:19.219972', 0, 0, '');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `sessions` (22 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('6dbb5945-270e-4186-8c0a-462c0dfae4ff', 'user-admin', '2026-10-05T13:14:56.563665', '2026-11-04T13:14:56.563665');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('b1833494-e5aa-4f68-9df5-3ff4d3c62fae', 'user-student', '2026-10-05T15:03:55.042675', '2026-11-04T15:03:55.042675');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('1550535c-8909-461c-b268-e06670ec57bb', 'user-admin', '2026-10-05T15:03:57.108795', '2026-11-04T15:03:57.108795');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('2eef7810-d2ff-4aec-8173-9b1e127503aa', 'user-student', '2026-10-05T15:04:49.796133', '2026-11-04T15:04:49.796133');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('ea8c6d7c-1134-4eca-8dd8-2d6acac59087', 'user-admin', '2026-10-05T15:04:51.853716', '2026-11-04T15:04:51.853716');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('c828255a-07b3-4b27-bc5f-1129698c4e60', 'user-e1bebac2', '2026-10-05T15:11:57.591370', '2026-11-04T15:11:57.591370');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('d664bc63-c7ea-41db-8f68-5b030c645770', 'user-admin', '2026-10-05T15:22:37.555580', '2026-11-04T15:22:37.555580');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('5e2246d5-caf2-46f9-9495-c816378d8d33', 'user-admin', '2026-10-05T15:24:11.650664', '2026-11-04T15:24:11.650664');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('b6a34408-f0dd-44b9-aabe-b52040571e2f', 'user-student', '2026-10-05T15:32:50.918579', '2026-11-04T15:32:50.918579');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('a3856cc0-6d74-4cd5-b5cb-19a0571b4170', 'user-admin', '2026-10-05T15:32:53.026896', '2026-11-04T15:32:53.026896');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('5e776f3c-8f72-4c65-86b3-e172cde67582', 'user-student', '2026-10-05T15:34:56.490560', '2026-11-04T15:34:56.490560');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('8b26a339-e53b-4908-8578-1ee7d6c389f2', 'user-admin', '2026-10-05T15:58:27.256975', '2026-11-04T15:58:27.256975');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('78577fe1-bea1-4e70-a9e4-fce2ec65fc7b', 'user-student', '2026-10-05T16:03:24.888680', '2026-11-04T16:03:24.888680');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('bea0b423-0794-47b7-beb3-d4e86dde67aa', 'user-student', '2026-10-05T19:07:22.914088', '2026-11-04T19:07:22.914088');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('0cbfd02e-19d2-47f8-97ec-ad9933699e44', 'user-admin', '2026-10-05T22:03:36.236752', '2026-11-04T22:03:36.236752');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('7ac3cc81-25e2-44f4-a72f-c40f4682c8b6', 'user-admin', '2026-10-05T22:06:14.276339', '2026-11-04T22:06:14.276339');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('6035f5af-f624-4293-8fe8-966802f425fb', 'user-admin', '2026-10-05T22:09:14.086637', '2026-11-04T22:09:14.086637');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('a59490d7-7b39-4355-89d2-264e4cb13a8f', 'user-student', '2026-10-06T22:43:59.374672', '2026-11-05T22:43:59.374672');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('b98ae935-38c3-43f3-9459-48bd8f397570', 'user-admin', '2026-10-06T23:07:33.565107', '2026-11-05T23:07:33.565107');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('c5db3d5f-3c7c-4b00-8a35-455d10d1a3ff', 'user-student', '2026-10-08T23:28:40.102797', '2026-11-07T23:28:40.102797');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('4288ecb5-7214-4062-b77d-02f026a7d8df', 'user-admin', '2026-10-12T19:16:29.236131', '2026-11-11T19:16:29.236131');
INSERT OR REPLACE INTO sessions (token, user_id, created_at, expires_at) VALUES ('0cfd059c-ae6d-4c7b-ac95-5309e0c42ff5', 'user-admin', '2026-10-12T19:16:58.480332', '2026-11-11T19:16:58.480332');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `lessons` (20 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-01', 'Giới thiệu về C++ & Cấu trúc chương trình', 'Chương 1: Bắt đầu với C++', 'Làm quen với ngôn ngữ C++, quy trình biên dịch, giải phẫu hàm main() và viết chương trình đầu tiên xuất lời chào ra màn hình.', 'Cơ bản', '25 phút', '<h3>1. Ngôn ngữ C++ là gì & Tại sao lại quan trọng?</h3>
<p><strong>C++</strong> là ngôn ngữ lập trình bậc trung (middle-level language) do <strong>Bjarne Stroustrup</strong> phát triển tại phòng thí nghiệm Bell Labs từ năm 1979 (ban đầu gọi là "C with Classes"). C++ kết hợp hoàn hảo hai thế giới:</p>
<ul>
    <li><strong>Sức mạnh phần cứng của bậc thấp:</strong> Tốc độ thực thi cực nhanh, cho phép quản lý trực tiếp từng ô nhớ RAM và CPU.</li>
    <li><strong>Tư duy hiện đại của bậc cao:</strong> Hỗ trợ Lập trình Hướng đối tượng (OOP), Lập trình Tổng quát (Templates) và thư viện chuẩn STL đồ sộ.</li>
</ul>
<p>Ngày nay, C++ đứng đằng sau hầu hết các hệ thống đòi hỏi hiệu năng tối đa: Hệ điều hành (Windows, macOS, nhân Linux), Game Engine (Unreal Engine), Trình duyệt web (Google Chrome V8), Hệ thống giao dịch tài chính高频 (High-Frequency Trading) và phần mềm nhúng ô tô tự lái.</p>

<h3>2. Giải phẫu cấu trúc một chương trình C++ chuẩn</h3>
<p>Mọi chương trình C++ dù nhỏ hay lớn đều xoay quanh một bộ khung tiêu chuẩn gồm 4 thành phần cốt lõi:</p>
<ul>
    <li><code>#include &lt;iostream&gt;</code>: <strong>Chỉ thị tiền xử lý (Preprocessor Directive)</strong>. Báo cho trình biên dịch nạp thư viện nhập/xuất chuẩn (Input/Output Stream) trước khi dịch code, giúp chương trình biết cách hiển thị chữ lên màn hình hoặc đọc phím bấm.</li>
    <li><code>using namespace std;</code>: <strong>Khai báo không gian tên chuẩn (Standard Namespace)</strong>. Mọi công cụ chuẩn của C++ đều được đóng gói trong hộp tên <code>std</code>. Nhờ dòng này, bạn chỉ cần viết <code>cout</code> thay vì phải viết đầy đủ <code>std::cout</code>.</li>
    <li><code>int main() { ... }</code>: <strong>Hàm chính (Entry Point)</strong>. Khi bạn bấm chạy chương trình, hệ điều hành sẽ luôn tìm đến đúng hàm <code>main()</code> để bắt đầu thực thi từng dòng lệnh từ trên xuống dưới.</li>
    <li><code>return 0;</code>: <strong>Mã trạng thái thoát (Exit Code)</strong>. Trả số <code>0</code> về cho Hệ điều hành để báo hiệu: <em>"Chương trình đã chạy hoàn tất mà không gặp bất kỳ lỗi nào!"</em>.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Quy trình mở quán Pha chế Cà phê buổi sáng</h4>
    </div>
    <p>Hãy tưởng tượng việc viết một chương trình C++ giống hệt như <strong>quy trình vận hành một quầy pha chế cà phê</strong>:</p>
    <ul>
        <li><strong><code>#include &lt;iostream&gt;</code></strong> giống như việc <em>nhập nguyên liệu và máy pha cà phê</em> về quán trước giờ mở cửa. Nếu không nhập máy pha (thư viện), bạn không thể phục vụ khách.</li>
        <li><strong><code>using namespace std;</code></strong> giống như việc <em>bày sẵn dụng cụ pha chế ngay trên mặt bàn</em> thay vì mỗi lần pha lại phải chạy vào kho chính lấy từng món.</li>
        <li><strong><code>int main() { ... }</code></strong> chính là <em>ca làm việc chính thức từ lúc mở cửa đón khách</em>: nhân viên thực hiện tuần tự từng bước từ in phiếu order, pha chế đến giao nước.</li>
        <li><strong><code>return 0;</code></strong> giống như <em>báo cáo chốt ca cuối ngày an toàn</em> (0 sự cố) trước khi đóng cửa quán.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Quên dấu chấm phẩy <code>;</code> cuối câu lệnh:</strong> Trong C++, dấu <code>;</code> giống như dấu chấm kết thúc câu văn tiếng Việt. Thiếu nó, trình biên dịch sẽ báo lỗi <code>expected '';'' before...</code>.</li>
        <li><strong>Phân biệt chữ HOA và chữ thường:</strong> C++ cực kỳ nghiêm ngặt — viết <code>Main()</code> hay <code>COUT</code> đều sẽ báo lỗi vì chuẩn bắt buộc là chữ thường <code>main()</code> và <code>cout</code>.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // In loi chao dau tien ra man hinh
    cout << "Xin chao! Chao mung ban den voi C++ Basic Academy." << endl;
    cout << "Lap trinh C++ that don gian va thu vi!" << endl;
    return 0;
}', 'In lời chào ra màn hình', 'Viết chương trình C++ in ra màn hình dòng chữ: Hello C++ Academy!', '#include <iostream>
using namespace std;

int main() {
    // Viet code in ra man hinh tai day

    return 0;
}', 1, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-02', 'Biến, Kiểu dữ liệu & Hằng số', 'Chương 1: Bắt đầu với C++', 'Tìm hiểu cách bộ nhớ RAM lưu trữ dữ liệu qua Biến, các kiểu dữ liệu nguyên thủy và từ khóa bảo vệ const.', 'Cơ bản', '25 phút', '<h3>1. Bản chất của Biến (Variables) trong bộ nhớ RAM</h3>
<p>Khi một chương trình chạy, nó cần nơi lưu trữ các thông tin tạm thời như tuổi tác, giá tiền sản phẩm hay điểm thi. <strong>Biến (Variable)</strong> chính là một vùng nhớ trong RAM được đặt tên để lập trình viên dễ dàng đọc và thay đổi dữ liệu bên trong mà không cần nhớ địa chỉ thập lục phân phức tạp.</p>
<pre>kiểu_dữ_liệu tên_biến = giá_trị_khởi_tạo;</pre>

<h3>2. Bảng phân tích các Kiểu dữ liệu cơ bản trong C++</h3>
<p>Tại sao C++ lại chia ra nhiều kiểu dữ liệu khác nhau? Vì mỗi loại thông tin cần dung lượng bộ nhớ RAM khác nhau để tránh lãng phí:</p>
<ul>
    <li><strong><code>int</code> (4 bytes):</strong> Lưu số nguyên thông thường (từ khoảng -2 tỷ đến +2 tỷ). Phù hợp lưu: tuổi, số lượng hàng hóa, năm sinh.</li>
    <li><strong><code>long long</code> (8 bytes):</strong> Lưu số nguyên siêu lớn (lên tới ±9 × 10<sup>18</sup>). Bắt buộc dùng khi tính toán dân số thế giới, số dư tài khoản ngân hàng hàng tỷ đồng.</li>
    <li><strong><code>float</code> (4 bytes) &amp; <code>double</code> (8 bytes):</strong> Lưu số thực có phần thập phân. Trong thực tế, <code>double</code> luôn được ưu tiên dùng để tính lãi suất, điểm trung bình GPA, tọa độ GPS vì độ chính xác cao gấp đôi <code>float</code>.</li>
    <li><strong><code>char</code> (1 byte):</strong> Lưu đúng 1 ký tự đơn đặt trong dấu nháy đơn, ví dụ: <code>''A''</code>, <code>''9''</code>, <code>''$''</code>.</li>
    <li><strong><code>bool</code> (1 byte):</strong> Chỉ nhận 2 trạng thái đúng (<code>true</code> = 1) hoặc sai (<code>false</code> = 0). Dùng cho các công tắc trạng thái như: Đã thanh toán chưa? Đèn đang bật hay tắt?</li>
</ul>

<h3>3. Hằng số (Constants) với từ khóa <code>const</code></h3>
<p>Những đại lượng không bao giờ được phép thay đổi trong suốt quá trình chạy chương trình (như số <code>PI = 3.14159</code>, thuế suất <code>VAT = 0.08</code>) cần được khóa lại bằng từ khóa <code>const</code>. Nếu bất kỳ dòng code nào cố tình sửa giá trị biến <code>const</code>, trình biên dịch sẽ chặn lại ngay lập tức.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Hệ thống Hộp bảo quản trong Gian bếp &amp; Siêu thị</h4>
    </div>
    <p>Hãy hình dung bộ nhớ RAM của máy tính giống như <strong>kệ tủ trong căn bếp gia đình</strong>:</p>
    <ul>
        <li><strong>Kiểu dữ liệu (Data Type)</strong> là <em>kích cỡ và chất liệu chiếc hộp</em>: Hộp nhỏ <code>char</code> chỉ đựng vừa 1 viên gia vị, hộp vừa <code>int</code> đựng các quả trứng nguyên vẹn (không thể đựng nửa quả), bình thủy tinh chia vạch <code>double</code> dùng để đong 1.5 lít sữa tươi, còn thùng phi lớn <code>long long</code> dùng để chứa hàng ngàn lít nước.</li>
        <li><strong>Tên biến (Variable Name)</strong> là <em>nhãn dán ngoài vỏ hộp</em> (ví dụ: <code>giaTien</code>, <code>soLuongTonKho</code>) để bạn nhìn vào biết ngay bên trong đựng gì.</li>
        <li><strong>Hằng số (<code>const</code>)</strong> giống như <em>thông tin in chìm cố định trên tờ tiền mệnh giá 500.000đ hoặc thuế VAT 8% của Nhà nước</em> — bạn chỉ được phép đọc để tính toán chứ không thể tự ý xóa đi viết số khác đè lên.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi tràn số (Integer Overflow):</strong> Nếu bạn lưu số tiền <code>5.000.000.000 VND</code> (5 tỷ đồng) vào biến <code>int</code> (giới hạn ~2.14 tỷ), số sẽ bị tràn và biến thành số âm sai lệch hoàn toàn! Hãy dùng <code>long long</code> cho tiền tệ lớn.</li>
        <li><strong>Biến chưa khởi tạo chứa "giác bộ nhớ":</strong> Khai báo <code>int x;</code> mà quên gán <code>= 0</code> sẽ khiến <code>x</code> mang một con số ngẫu nhiên vô nghĩa còn sót lại trong RAM.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong quan ly san pham tai Sieu thi Mini
    const double THUE_VAT = 0.08;      // Hang so thue VAT 8% co dinh
    int soLuongSua = 4;                // So nguyen: 4 loc sua
    double donGia = 32500.5;           // So thuc: 32,500.5 VND / loc
    char phanHang = ''A'';               // Ky tu: Hang chat luong loai A
    bool conHang = true;               // Logic: Dang con hang trong kho

    double tamTinh = soLuongSua * donGia;
    double tongThanhToan = tamTinh + (tamTinh * THUE_VAT);

    cout << "=== THONG TIN SAN PHAM SIEU THI ===" << endl;
    cout << "Phan hang chat luong: Loai " << phanHang << endl;
    cout << "Trang thai ton kho: " << conHang << " (1: Con hang, 0: Het)" << endl;
    cout << "So luong mua: " << soLuongSua << " loc" << endl;
    cout << "Tam tinh: " << tamTinh << " VND" << endl;
    cout << "Tong tien (gom VAT 8%): " << tongThanhToan << " VND" << endl;
    return 0;
}', 'Tính chu vi hình tròn', 'Khai báo hằng số PI = 3.14 và biến bán kính r = 5. Tính chu vi hình tròn (C = 2 * PI * r) và in ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    const double PI = 3.14;
    double r = 5.0;

    // Tinh chu vi va in ket qua tai day

    return 0;
}', 2, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-03', 'Nhập & Xuất dữ liệu với cin, cout', 'Chương 1: Bắt đầu với C++', 'Thành thạo luồng giao tiếp hai chiều giữa người dùng và máy tính thông qua đối tượng cin và cout.', 'Cơ bản', '25 phút', '<h3>1. Luồng xuất chuẩn <code>cout</code> (Character Output)</h3>
<p>Một phần mềm thực tế luôn cần hiển thị thông báo, kết quả tính toán cho người dùng nhìn thấy. C++ sử dụng đối tượng <code>cout</code> đi kèm với <strong>toán tử chèn luồng <code>&lt;&lt;</code></strong> (hướng mũi tên chỉ về phía <code>cout</code> như đang đẩy dữ liệu ra màn hình):</p>
<pre>cout &lt;&lt; "Tong tien cua ban la: " &lt;&lt; tongTien &lt;&lt; " VND" &lt;&lt; endl;</pre>
<ul>
    <li>Có thể nối nhiều toán tử <code>&lt;&lt;</code> liên tiếp trên cùng một dòng để in kết hợp cả chữ và giá trị biến.</li>
    <li>Dùng <code>endl</code> hoặc ký tự điều khiển <code>\n</code> để ngắt xuống dòng mới, dùng <code>\t</code> để căn lề một khoảng Tab.</li>
</ul>

<h3>2. Luồng nhập chuẩn <code>cin</code> (Character Input)</h3>
<p>Để chương trình có tính tương tác (nhận số lượng hàng khách muốn mua, nhận số tiền cần chuyển khoản...), ta dùng <code>cin</code> đi kèm với <strong>toán tử trích xuất luồng <code>&gt;&gt;</code></strong> (hướng mũi tên chỉ vào biến như đang rót dữ liệu từ bàn phím vào biến):</p>
<pre>cin &gt;&gt; soLuong &gt;&gt; donGia;</pre>
<p>Khi gặp lệnh <code>cin</code>, chương trình sẽ tạm dừng chờ người dùng gõ dữ liệu rồi nhấn phím <strong>Enter</strong>. Dấu cách (Space), phím Tab hoặc phím Enter được <code>cin</code> dùng làm dấu hiệu phân tách giữa các giá trị.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Máy bán nước tự động &amp; Cây rút tiền ATM</h4>
    </div>
    <p>Hãy quan sát cách bạn tương tác với một <strong>máy bán nước ngọt tự động ở sảnh tòa nhà</strong>:</p>
    <ul>
        <li><strong><code>cout &lt;&lt; ...</code></strong> chính là <em>màn hình LED của máy bán hàng</em> hiển thị lời chào: <code>"Mời bạn chọn mã lon nước và số lượng cần mua"</code>, hoặc in ra số tiền thừa trả lại.</li>
        <li><strong><code>cin &gt;&gt; ...</code></strong> chính là <em>bàn phím bấm số và khe nhận tiền</em> của máy: máy đứng đợi bạn bấm mã món hàng và số lượng. Tùy vào con số bạn nhập vào lúc đó mà máy sẽ tính ra số tiền tương ứng, chứ không cố định một mức giá sẵn trong code!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nhầm chiều mũi tên giữa <code>cout</code> và <code>cin</code>:</strong> Mẹo nhớ cực dễ: <code>cout &lt;&lt;</code> mũi tên hướng ra ngoài màn hình; <code>cin &gt;&gt;</code> mũi tên đẩy thẳng vào tên biến cần lưu.</li>
        <li><strong><code>cin &gt;&gt;</code> dừng lại khi gặp khoảng trắng:</strong> Nếu nhập họ tên có dấu cách như <code>"Nguyen Van A"</code> bằng <code>cin &gt;&gt; ten</code>, biến sẽ chỉ lấy được chữ <code>"Nguyen"</code>. (Ở Chương 5 bạn sẽ học hàm <code>getline</code> để đọc trọn vẹn cả dòng có dấu cách).</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong He thong dat ve xem phim rap CGV
    int soVeNguoiLon, soVeTreEm;
    const int GIA_NGUOI_LON = 90000;
    const int GIA_TRE_EM = 60000;

    // Gia lap nguoi dung nhap 2 ve nguoi lon va 1 ve tre em
    soVeNguoiLon = 2;
    soVeTreEm = 1;

    int tongTien = (soVeNguoiLon * GIA_NGUOI_LON) + (soVeTreEm * GIA_TRE_EM);

    cout << "=== QUAY DAT VE XEM PHIM TU DONG ===" << endl;
    cout << "So ve nguoi lon: " << soVeNguoiLon << " x 90.000d" << endl;
    cout << "So ve tre em   : " << soVeTreEm << " x 60.000d" << endl;
    cout << "------------------------------------" << endl;
    cout << "Tong thanh toan: " << tongTien << " VND" << endl;
    return 0;
}', 'Tính tổng 2 số từ bàn phím', 'Nhập vào 2 số nguyên a và b từ bàn phím. In ra tổng của hai số đó theo định dạng: Tong = [gia tri].', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhap a va b roi in ra Tong = a + b

    return 0;
}', 3, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-04', 'Các toán tử trong C++', 'Chương 1: Bắt đầu với C++', 'Làm chủ bộ công cụ tính toán số học, chia lấy dư %, so sánh quan hệ và kết hợp điều kiện logic.', 'Cơ bản', '30 phút', '<h3>1. Nhóm Toán tử Số học (Arithmetic Operators)</h3>
<p>C++ cung cấp 5 phép toán cơ bản: Cộng (<code>+</code>), Trừ (<code>-</code>), Nhân (<code>*</code>), Chia (<code>/</code>) và Chia lấy phần dư (<code>%</code>). Trong đó có 2 quy tắc vàng bạn bắt buộc phải nhớ:</p>
<ul>
    <li><strong>Phép chia nguyên (<code>/</code>):</strong> Khi lấy hai số nguyên chia cho nhau (ví dụ <code>7 / 2</code>), C++ sẽ <strong>cắt bỏ hoàn toàn phần thập phân</strong> và chỉ trả về thương nguyên là <code>3</code>. Muốn ra <code>3.5</code>, ít nhất một vế phải là số thực: <code>7.0 / 2</code>.</li>
    <li><strong>Phép chia lấy dư (<code>%</code> - Modulo):</strong> Chỉ áp dụng cho số nguyên, trả về phần dư sau phép chia (ví dụ <code>7 % 2 = 1</code>). Cực kỳ hữu ích để kiểm tra số chẵn/lẻ (<code>n % 2 == 0</code>), đổi giây sang giờ:phút:giây, hoặc tính số tờ tiền lẻ khi rút ATM.</li>
</ul>

<h3>2. Toán tử Quan hệ (So sánh) &amp; Toán tử Logic</h3>
<p>Dùng để đặt câu hỏi đúng/sai cho máy tính (trả về <code>1</code> nếu đúng, <code>0</code> nếu sai):</p>
<ul>
    <li><strong>So sánh:</strong> Bằng nhau (<code>==</code>), Khác nhau (<code>!=</code>), Lớn hơn (<code>&gt;</code>), Nhỏ hơn (<code>&lt;</code>), Lớn hơn hoặc bằng (<code>&gt;=</code>), Nhỏ hơn hoặc bằng (<code>&lt;=</code>).</li>
    <li><strong>Logic <code>&amp;&amp;</code> (VÀ - AND):</strong> Chỉ đúng khi <strong>TẤT CẢ</strong> các điều kiện cùng đúng (Ví dụ: Đủ 18 tuổi <code>&amp;&amp;</code> Có giấy phép lái xe).</li>
    <li><strong>Logic <code>||</code> (HOẶC - OR):</strong> Đúng ngay khi có <strong>ÍT NHẤT MỘT</strong> điều kiện đúng (Ví dụ: Có thẻ thành viên VIP <code>||</code> Đơn hàng trên 500k thì được freeship).</li>
    <li><strong>Logic <code>!</code> (PHỦ ĐỊNH - NOT):</strong> Đảo ngược trạng thái từ Đúng sang Sai và ngược lại.</li>
</ul>

<h3>3. Toán tử Gán phức hợp &amp; Tăng giảm (<code>++</code>, <code>--</code>)</h3>
<p>Viết gọn <code>tong += 50;</code> tương đương <code>tong = tong + 50;</code>. Toán tử <code>i++</code> giúp tăng biến đếm lên 1 đơn vị nhanh chóng.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Máy rút tiền ATM chia mệnh giá &amp; Xét duyệt Freeship sàn TMĐT</h4>
    </div>
    <p>Các toán tử C++ hiện diện khắp nơi trong đời sống hàng ngày:</p>
    <ul>
        <li><strong>Phép chia nguyên <code>/</code> và chia dư <code>%</code> tại cây ATM:</strong> Giả sử bạn rút <code>1.350.000đ</code> và máy ưu tiên trả tờ <code>500.000đ</code> trước. Máy tính số tờ 500k bằng phép chia nguyên: <code>1350000 / 500000 = 2</code> tờ. Số tiền lẻ còn lại cần trả tiếp bằng mệnh giá nhỏ hơn chính là phép chia dư: <code>1350000 % 500000 = 350.000đ</code>!</li>
        <li><strong>Toán tử logic <code>&amp;&amp;</code> và <code>||</code> trên ứng dụng Shopee/Grab:</strong> Khi bạn bấm áp mã giảm giá, hệ thống kiểm tra: <code>(giaTriDonHang &gt;= 200000) &amp;&amp; (soLuotDungConLai &gt; 0)</code>. Cả hai vế đều thỏa mãn thì mã giảm giá mới có hiệu lực.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nhầm lẫn giữa dấu gán <code>=</code> và dấu so sánh bằng <code>==</code>:</strong> Một dấu <code>=</code> dùng để gán giá trị mới cho biến (<code>a = 5</code>), còn hai dấu <code>==</code> mới dùng để kiểm tra hai bên có bằng nhau hay không (<code>a == 5</code>).</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Bai toan thuc te: May ATM doi tien 1.350.000 VND ra to 500k, 200k, 100k, 50k
    int soTienRut = 1350000;
    int conLai = soTienRut;

    int to500k = conLai / 500000;
    conLai = conLai % 500000;

    int to200k = conLai / 200000;
    conLai = conLai % 200000;

    int to100k = conLai / 100000;
    conLai = conLai % 100000;

    int to50k = conLai / 50000;

    cout << "=== MAY ATM PHAN BO MENH GIA TIEN ===" << endl;
    cout << "So tien yeu cau rut: " << soTienRut << " VND" << endl;
    cout << "- Menh gia 500.000d: " << to500k << " to" << endl;
    cout << "- Menh gia 200.000d: " << to200k << " to" << endl;
    cout << "- Menh gia 100.000d: " << to100k << " to" << endl;
    cout << "- Menh gia  50.000d: " << to50k << " to" << endl;
    return 0;
}', 'Kiểm tra số chẵn lẻ', 'Nhập số nguyên n. Sử dụng toán tử chia dư % để in ra 1 nếu n là số chẵn, in ra 0 nếu n là số lẻ.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Kiem tra va in 1 neu chan, 0 neu le

    return 0;
}', 4, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-05', 'Cấu trúc điều kiện if, else if, else', 'Chương 2: Cấu trúc rẽ nhánh', 'Trao khả năng ra quyết định thông minh cho chương trình dựa trên các điều kiện thực tế.', 'Cơ bản', '30 phút', '<h3>1. Tại sao chương trình cần Cấu trúc rẽ nhánh?</h3>
<p>Nếu không có cấu trúc rẽ nhánh, chương trình chỉ biết chạy thẳng từ dòng đầu đến dòng cuối một cách máy móc. Trong thực tế, phần mềm luôn phải đưa ra quyết định tùy thuộc vào tình huống: <em>Nếu số dư đủ thì cho phép chuyển khoản, ngược lại thì báo lỗi; Nếu trời mưa thì bật gạt nước ô tô...</em></p>

<h3>2. Cú pháp <code>if - else if - else</code> &amp; Luồng thực thi</h3>
<pre>if (điều_kiện_1) {
    // Chạy khối lệnh này nếu điều_kiện_1 ĐÚNG
} else if (điều_kiện_2) {
    // Chỉ kiểm tra khi điều_kiện_1 SAI và điều_kiện_2 ĐÚNG
} else {
    // Phương án dự phòng cuối cùng khi tất cả điều kiện trên đều SAI
}</pre>
<p><strong>Cơ chế loại trừ tuần tự:</strong> Máy tính kiểm tra từ trên xuống dưới. Ngay khi tìm thấy <strong>một nhánh đầu tiên đúng</strong>, nó thực thi khối lệnh đó rồi <strong>bỏ qua toàn bộ các nhánh <code>else if / else</code> bên dưới</strong>.</p>

<h3>3. Toán tử điều kiện 3 ngôi (Ternary Operator)</h3>
<p>Khi chỉ cần gán nhanh một giá trị theo điều kiện đúng/sai, ta có thể rút gọn 4 dòng <code>if-else</code> thành 1 dòng duy nhất:</p>
<pre>string trangThai = (tuoi &gt;= 18) ? "Du tuoi thi bang lai" : "Chua du tuoi";</pre>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Trạm thu phí tự động &amp; Cách tính Hóa đơn Tiền điện bậc thang EVN</h4>
    </div>
    <p>Hãy liên tưởng cấu trúc <code>if - else if - else</code> với các quy tắc phân loại ngoài đời thực:</p>
    <ul>
        <li><strong>Cổng soát vé Khu vui chơi theo chiều cao:</strong>
            <ul>
                <li><code>if (chieuCao &lt; 100)</code> → Miễn phí vé hoàn toàn (Trẻ dưới 1m).</li>
                <li><code>else if (chieuCao &lt; 140)</code> → Tính giá vé Trẻ em (150.000đ).</li>
                <li><code>else</code> → Tính giá vé Người lớn tiêu chuẩn (250.000đ).</li>
            </ul>
        </li>
        <li><strong>Hệ thống cảnh báo Pin điện thoại:</strong> <code>if (pin &lt;= 10)</code> bật chế độ Siêu tiết kiệm pin màu đỏ; <code>else if (pin &lt;= 20)</code> hiện thông báo nhắc cắm sạc màu vàng; <code>else</code> hoạt động bình thường.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Sắp xếp thứ tự điều kiện từ chặt đến lỏng:</strong> Khi xếp loại điểm hoặc bậc lương, phải kiểm tra mốc cao nhất trước (<code>diem &gt;= 8.5</code> rồi mới tới <code>diem &gt;= 6.5</code>). Nếu đặt <code>if (diem &gt;= 5.0)</code> lên đầu, học sinh 9.0 điểm cũng sẽ lọt ngay vào nhánh Trung bình!</li>
        <li><strong>Lỗi gán nhầm trong <code>if (a = 5)</code>:</strong> Viết 1 dấu bằng sẽ gán <code>a</code> thành 5 và biểu thức luôn đúng! Hãy luôn kiểm tra kỹ <code>if (a == 5)</code>.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong He thong tinh cuoc Taxi & Giam gia khach hang VIP
    double soKm = 14.5;
    bool laKhachVIP = true;
    double giaCuoc = 0;

    // Quy tac tinh cuoc theo bac quang duong
    if (soKm <= 1.0) {
        giaCuoc = 20000; // Gia mo cua 1km dau
    } else if (soKm <= 10.0) {
        giaCuoc = 20000 + (soKm - 1.0) * 15000;
    } else {
        // Tu km thu 11 tro di gia giam con 12.000d/km
        giaCuoc = 20000 + 9.0 * 15000 + (soKm - 10.0) * 12000;
    }

    // Neu la khach VIP thi giam 10% tong hoa don
    double thanhToan = laKhachVIP ? (giaCuoc * 0.9) : giaCuoc;

    cout << "=== HOA DON CUOC TAXI CONG NGHE ===" << endl;
    cout << "Quang duong di chuyen: " << soKm << " km" << endl;
    cout << "Cuoc tam tinh: " << giaCuoc << " VND" << endl;
    cout << "Hang khach hang: " << (laKhachVIP ? "Thanh vien VIP (-10%)" : "Thuong") << endl;
    cout << "Tong thanh toan: " << thanhToan << " VND" << endl;
    return 0;
}', 'Tìm số lớn nhất trong 2 số', 'Nhập 2 số nguyên a và b. Sử dụng câu lệnh if-else để tìm và in ra số lớn hơn.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    cin >> a >> b;

    // In ra so lon hon trong hai so

    return 0;
}', 5, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-06', 'Cấu trúc rẽ nhánh switch - case', 'Chương 2: Cấu trúc rẽ nhánh', 'Xây dựng hệ thống Menu lựa chọn rõ ràng, tối ưu tốc độ kiểm tra các trường hợp giá trị rời rạc.', 'Cơ bản', '25 phút', '<h3>1. Khi nào nên dùng <code>switch - case</code> thay cho <code>if - else</code>?</h3>
<p>Khi bạn cần kiểm tra một biến nguyên (<code>int</code>, <code>char</code>) với <strong>nhiều giá trị hằng số cụ thể rời rạc</strong> (ví dụ: bấm phím số 1, 2, 3 trên menu, các thứ trong tuần từ 2 đến 8, hoặc các phép toán <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>), cấu trúc <code>switch - case</code> giúp mã nguồn sạch sẽ, dễ đọc hơn hẳn và được trình biên dịch tối ưu bằng bảng nhảy (Jump Table) tốc độ cao.</p>

<h3>2. Cú pháp chuẩn &amp; Vai trò của <code>break</code>, <code>default</code></h3>
<pre>switch (biểu_thức_nguyên) {
    case giá_trị_1:
        // Thực thi khi biểu_thức == giá_trị_1
        break; // Thoát khỏi switch ngay lập tức
    case giá_trị_2:
        // Thực thi khi biểu_thức == giá_trị_2
        break;
    default:
        // Thực thi khi KHÔNG khớp với bất kỳ case nào ở trên
}</pre>
<ul>
    <li><strong>Lệnh <code>break</code>:</strong> Đóng vai trò như "bức tường ngăn" giữa các nhánh. Nếu quên <code>break</code>, chương trình sẽ bị <strong>trôi (fall-through)</strong> và chạy luôn các câu lệnh của những <code>case</code> nằm kế tiếp bên dưới!</li>
    <li><strong>Nhóm nhiều <code>case</code> chung kết quả:</strong> Có thể tận dụng tính chất trôi có chủ đích để gom các tháng có 31 ngày: <code>case 1: case 3: case 5: ...</code></li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Bảng nút bấm Thang máy tòa nhà &amp; Tổng đài Chăm sóc khách hàng</h4>
    </div>
    <p>Cấu trúc <code>switch - case</code> hoạt động giống hệt <strong>hệ thống tổng đài tự động hoặc thang máy</strong>:</p>
    <ul>
        <li>Khi bạn gọi tổng đài ngân hàng: <em>"Bấm phím 1 để tra cứu số dư, phím 2 để khóa thẻ khẩn cấp, phím 3 để gặp tổng đài viên..."</em>. Biến <code>phimBam</code> được đưa vào <code>switch(phimBam)</code> để nhảy thẳng tới đúng dịch vụ bạn chọn (<code>case 1</code>, <code>case 2</code>, <code>case 3</code>).</li>
        <li>Nếu bạn bấm nhầm phím 9 (không có trong danh mục), hệ thống tự động chuyển vào nhánh <strong><code>default</code></strong>: <em>"Phím bấm không hợp lệ, xin vui lòng chọn lại!"</em>.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong><code>switch</code> chỉ nhận số nguyên (<code>int</code>, <code>long</code>) hoặc ký tự (<code>char</code>):</strong> Bạn KHÔNG thể truyền số thực <code>double</code> hay chuỗi văn bản <code>string</code> vào <code>switch(...)</code> trong C++.</li>
        <li><strong>Giá trị sau từ khóa <code>case</code> bắt buộc phải là hằng số cố định:</strong> Không thể viết biểu thức biến động như <code>case x &gt; 5:</code> trong <code>switch</code>.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Menu Giao dich tai Cay ATM Ngan hang
    int luaChon = 2; // Gia su khach hang bam phim chuc nang so 2
    long long soDu = 15000000;
    long long soTienRut = 3000000;

    cout << "=== MENU CAY ATM NGAN HANG C++ ===" << endl;
    cout << "1. Van tin so du  | 2. Rut tien mat  | 3. Chuyen khoan" << endl;
    cout << "Khach hang da chon chuc nang so: " << luaChon << endl;
    cout << "----------------------------------" << endl;

    switch (luaChon) {
        case 1:
            cout << "So du hien tai cua quy khach: " << soDu << " VND" << endl;
            break;
        case 2:
            soDu -= soTienRut;
            cout << "Rut thanh cong: " << soTienRut << " VND" << endl;
            cout << "So du con lai : " << soDu << " VND" << endl;
            break;
        case 3:
            cout << "Chuyen den man hinh nhap so tai khoan nhan..." << endl;
            break;
        default:
            cout << "Lua chon khong hop le! Vui long bam phim tu 1 den 3." << endl;
    }
    return 0;
}', 'Máy tính đơn giản với switch', 'Nhập 2 số nguyên a, b và 1 ký tự phép toán (+, -, *, /). Sử dụng switch-case để tính và in ra kết quả tương ứng.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    char op;
    cin >> a >> b >> op;

    // Su dung switch(op) de thuc hien phep tinh

    return 0;
}', 6, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-07', 'Vòng lặp for cơ bản & nâng cao', 'Chương 3: Cấu trúc vòng lặp', 'Tự động hóa các công việc lặp đi lặp lại với số lần xác định trước bằng vòng lặp for và for lồng nhau.', 'Trung bình', '30 phút', '<h3>1. Sức mạnh của Vòng lặp (Loops) trong lập trình</h3>
<p>Con người rất dễ mệt mỏi và nhầm lẫn khi phải làm đi làm lại một việc hàng nghìn lần, nhưng máy tính có thể lặp lại hàng triệu phép tính mỗi giây với độ chính xác tuyệt đối. <strong>Vòng lặp <code>for</code></strong> được thiết kế chuyên biệt cho những bài toán <strong>đã biết trước số lần lặp</strong> (ví dụ: tính lương cho 500 nhân viên, tính lãi tiết kiệm qua 12 tháng).</p>

<h3>2. Chu trình 4 bước của vòng lặp <code>for</code></h3>
<pre>for (Bước_1_Khởi_tạo; Bước_2_Điều_kiện_lặp; Bước_4_Bước_nhảy) {
    // Bước_3: Khối lệnh được lặp lại khi điều kiện còn ĐÚNG
}</pre>
<ul>
    <li><strong>Bước 1 (Khởi tạo):</strong> Chạy <strong>duy nhất 1 lần</strong> lúc bắt đầu vòng lặp (ví dụ: <code>int thang = 1</code>).</li>
    <li><strong>Bước 2 (Kiểm tra điều kiện):</strong> Nếu đúng (<code>thang &lt;= 12</code>) thì đi vào Bước 3; nếu sai thì kết thúc vòng lặp ngay.</li>
    <li><strong>Bước 3 (Thân vòng lặp):</strong> Thực hiện các câu lệnh tính toán bên trong cặp ngoặc nhọn <code>{ ... }</code>.</li>
    <li><strong>Bước 4 (Bước nhảy):</strong> Cập nhật biến đếm (<code>thang++</code>), sau đó quay lại Bước 2.</li>
</ul>

<h3>3. Vòng lặp <code>for</code> lồng nhau (Nested Loops)</h3>
<p>Khi đặt một vòng lặp <code>for</code> bên trong một vòng lặp <code>for</code> khác, mỗi lần vòng ngoài nhích lên 1 bước thì vòng trong sẽ chạy trọn vẹn một chu kỳ từ đầu đến cuối (giống như kim giờ nhích 1 nấc thì kim phút phải quay đủ 60 vòng).</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Tính Lãi kép Sổ tiết kiệm Ngân hàng &amp; Chạy bộ quanh Sân vận động</h4>
    </div>
    <p>Hãy hình dung vòng lặp <code>for</code> qua hai tình huống quen thuộc:</p>
    <ul>
        <li><strong>Vận động viên chạy đủ 10 vòng sân:</strong>
            <ul>
                <li>Khởi tạo: Đứng ở vạch xuất phát (<code>vong = 1</code>).</li>
                <li>Điều kiện: Chưa vượt quá 10 vòng (<code>vong &lt;= 10</code>).</li>
                <li>Thực thi: Chạy hết 1 vòng sân.</li>
                <li>Bước nhảy: Đồng hồ bấm tăng thêm 1 vòng (<code>vong++</code>).</li>
            </ul>
        </li>
        <li><strong>Sổ tiết kiệm tính lãi kép hàng năm:</strong> Bạn gửi 100 triệu đồng với lãi suất 7%/năm trong 5 năm. Mỗi năm (mỗi lượt lặp <code>for</code> từ năm 1 đến năm 5), tiền lãi được cộng dồn thẳng vào vốn gốc để năm sau sinh lời nhiều hơn!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi vòng lặp vô tận (Infinite Loop):</strong> Nếu điều kiện lặp không bao giờ sai (ví dụ: <code>for (int i = 1; i &gt; 0; i++)</code>), chương trình sẽ treo cứng máy hoặc bị quá thời gian thực thi (Time Limit Exceeded).</li>
        <li><strong>Dư dấu chấm phẩy ngay sau <code>for(...);</code>:</strong> Viết <code>for (int i = 1; i &lt;= 5; i++);</code> sẽ khiến vòng lặp chạy rỗng không làm gì cả!</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Bai toan tinh Lai kep gui tiet kiem Ngan hang trong 5 nam
    double tienGui = 100000000; // Von ban dau: 100 trieu VND
    double laiSuatNam = 0.07;   // Lai suat: 7% / nam
    int soNam = 5;

    cout << "=== BANG KE LAI KEP TIET KIEM NGAN HANG ===" << endl;
    cout << "Von ban dau: " << (long long)tienGui << " VND (Lai suat 7%/nam)" << endl;
    cout << "-------------------------------------------" << endl;

    for (int nam = 1; nam <= soNam; nam++) {
        double tienLai = tienGui * laiSuatNam;
        tienGui += tienLai; // Cong don lai vao goc
        cout << "Het nam " << nam << " -> Tong so du: " << (long long)tienGui << " VND" << endl;
    }
    return 0;
}', 'Tính tổng dãy số 1 đến N', 'Nhập số nguyên dương n. Sử dụng vòng lặp for để tính tổng S = 1 + 2 + ... + n và in kết quả ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Viet vong lap for tinh tong tai day

    return 0;
}', 7, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-08', 'Vòng lặp while và do-while', 'Chương 3: Cấu trúc vòng lặp', 'Xử lý các bài toán lặp theo điều kiện sự kiện chưa biết trước số lần kết thúc bằng while và do-while.', 'Trung bình', '30 phút', '<h3>1. Khi nào dùng <code>while</code> thay vì <code>for</code>?</h3>
<p>Trong thực tế, có rất nhiều tình huống ta <strong>không thể biết trước chính xác cần lặp bao nhiêu lần</strong>, mà chỉ biết điều kiện để dừng lại: <em>Đọc file dữ liệu cho tới khi hết dòng; Cho khách nhập lại mật khẩu cho đến khi đúng; Trừ dần số dư cho đến khi hết tiền...</em> Đó là lúc <code>while</code> và <code>do-while</code> phát huy tác dụng.</p>

<h3>2. Phân biệt <code>while</code> (Kiểm tra trước) và <code>do-while</code> (Làm trước, kiểm tra sau)</h3>
<ul>
    <li><strong>Vòng lặp <code>while (điều_kiện) { ... }</code>:</strong> Kiểm tra điều kiện ngay ở cửa. Nếu điều kiện sai ngay từ đầu, khối lệnh bên trong sẽ <strong>không chạy dù chỉ 1 lần</strong> (Số lần chạy tối thiểu: <code>0</code>).</li>
    <li><strong>Vòng lặp <code>do { ... } while (điều_kiện);</code>:</strong> Cứ thực hiện khối lệnh bên trong <strong>ít nhất 1 lần trước</strong>, sau đó mới kiểm tra điều kiện ở cuối để quyết định có lặp tiếp hay không (Số lần chạy tối thiểu: <code>1</code>).</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Cổng soát vé Tàu điện (while) vs Mở khóa Mã PIN Điện thoại (do-while)</h4>
    </div>
    <p>Sự khác biệt giữa <code>while</code> và <code>do-while</code> thể hiện rất rõ qua 2 thiết bị hàng ngày:</p>
    <ul>
        <li><strong>Cổng soát vé tàu điện Metro (<code>while</code> — Kiểm tra trước, hành động sau):</strong> Khi bạn chạm thẻ vào cổng, hệ thống kiểm tra <code>while (soDuThe &gt;= giaVe)</code> trước. Nếu thẻ hết tiền ngay từ đầu, cửa chắn không mở lần nào.</li>
        <li><strong>Màn hình nhập mật khẩu mở khóa điện thoại (<code>do-while</code> — Hành động trước, kiểm tra sau):</strong> Điện thoại bắt buộc phải hiện bàn phím cho bạn nhập mật khẩu <strong>ít nhất 1 lần trước</strong> (<code>do</code>). Sau khi bạn bấm xong, máy mới kiểm tra <code>while (matKhauNhap != matKhauDung)</code> để yêu cầu bạn nhập lại nếu sai!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Quên thay đổi biến điều kiện bên trong <code>while</code>:</strong> Khác với <code>for</code> có sẵn ô bước nhảy, trong <code>while</code> bạn phải tự viết lệnh cập nhật biến (ví dụ <code>n /= 10;</code> hoặc <code>soLanThu++;</code>), nếu quên vòng lặp sẽ chạy mãi mãi.</li>
        <li><strong>Quên dấu chấm phẩy <code>;</code> cuối dòng <code>while (điều_kiện);</code> của cấu trúc <code>do-while</code>.</strong></li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Tiet kiem tien mua Laptop 20 trieu VND
    long long mucTieu = 20000000;
    long long quyTietKiem = 0;
    long long tietKiemMoiThang = 3500000;
    int soThang = 0;

    // Chua biet can bao nhieu thang, lap cho den khi du muc tieu
    while (quyTietKiem < mucTieu) {
        soThang++;
        quyTietKiem += tietKiemMoiThang;
        cout << "Thang thu " << soThang << ": Da tich luy duoc " << quyTietKiem << " VND" << endl;
    }

    cout << "=> Chuc mung! Ban can " << soThang << " thang de du tien mua Laptop!" << endl;
    return 0;
}', 'Đảo ngược số nguyên', 'Nhập số nguyên dương n. Sử dụng vòng lặp while để in ra các chữ số của n theo thứ tự ngược lại (ví dụ: 123 -> 321).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Su dung while de dao nguoc va in ra cac chu so

    return 0;
}', 8, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-09', 'Lệnh điều khiển break & continue', 'Chương 3: Cấu trúc vòng lặp', 'Kiểm soát linh hoạt dòng chảy vòng lặp: Dừng khẩn cấp với break hoặc bỏ qua trường hợp ngoại lệ với continue.', 'Trung bình', '20 phút', '<h3>1. Lệnh <code>break</code> — Phanh khẩn cấp thoát khỏi vòng lặp</h3>
<p>Thông thường, vòng lặp chỉ dừng khi điều kiện lặp bị sai. Tuy nhiên, nếu bạn đang tìm kiếm một món đồ trong 1.000 chiếc hộp và đã tìm thấy nó ngay ở chiếc hộp thứ 5, việc mở tiếp 995 chiếc hộp còn lại là vô ích! Câu lệnh <strong><code>break;</code></strong> giúp chương trình <strong>dừng và thoát ngay lập tức</strong> khỏi vòng lặp chứa nó để tiết kiệm thời gian xử lý.</p>

<h3>2. Lệnh <code>continue</code> — Bỏ qua lượt hiện tại, đi tiếp lượt sau</h3>
<p>Ngược lại với <code>break</code> (dừng hẳn cả vòng lặp), câu lệnh <strong><code>continue;</code></strong> chỉ <strong>bỏ qua các câu lệnh phía dưới nó trong lượt lặp hiện tại</strong> và nhảy thẳng sang lượt lặp kế tiếp.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Dây chuyền Kiểm định chất lượng Sản phẩm trong Nhà máy</h4>
    </div>
    <p>Hãy tưởng tượng một <strong>băng chuyền đóng gói 100 chai nước ngọt trong nhà máy</strong>:</p>
    <ul>
        <li><strong>Lệnh <code>continue</code> (Loại bỏ sản phẩm lỗi lẻ tẻ):</strong> Khi cảm biến phát hiện chai thứ 15 bị lệch nhãn dán, cánh tay robot gạt chai thứ 15 ra khỏi băng chuyền (bỏ qua khâu đóng nắp cho chai đó) rồi <strong>băng chuyền vẫn tiếp tục chạy sang chai thứ 16, 17...</strong> bình thường.</li>
        <li><strong>Lệnh <code>break</code> (Nút dừng khẩn cấp toàn bộ dây chuyền):</strong> Nếu cảm biến phát hiện có dị vật nguy hiểm hoặc chập điện động cơ ở chai thứ 40, hệ thống kích hoạt <code>break</code> — <strong>ngắt toàn bộ băng chuyền ngay lập tức</strong> để kỹ sư kiểm tra!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Trong vòng lặp lồng nhau:</strong> Lệnh <code>break</code> hoặc <code>continue</code> chỉ tác động lên <strong>vòng lặp gần nhất bao quanh nó</strong> chứ không thoát một lúc cả 2 vòng lặp trong và ngoài.</li>
        <li><strong>Cẩn thận khi dùng <code>continue</code> trong vòng lặp <code>while</code>:</strong> Hãy đảm bảo biến đếm đã được tăng trước khi gọi <code>continue</code>, nếu không chương trình sẽ lặp lại mãi một giá trị!</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Day chuyen kiem tra 8 kien hang (So am = Hang hong, So 999 = Loi he thong)
    int kienHang[8] = {120, 150, -1, 200, 180, 999, 130, 160};
    int tongKhoiLuong = 0;

    cout << "=== HE THONG QUET KIEN HANG TU DONG ===" << endl;
    for (int i = 0; i < 8; i++) {
        if (kienHang[i] == -1) {
            cout << "[Canh bao] Kien hang #" << (i + 1) << " bi loi bao bi -> Bo qua (continue)!" << endl;
            continue; // Bo qua kien hang hong, quet tiep kien sau
        }
        if (kienHang[i] == 999) {
            cout << "[NGUY HIEM] Kien hang #" << (i + 1) << " qua tai -> Dung bang chuyen (break)!" << endl;
            break; // Dung han day chuyen
        }
        tongKhoiLuong += kienHang[i];
        cout << "Kien hang #" << (i + 1) << " hop le (" << kienHang[i] << "g) -> Da dong goi." << endl;
    }

    cout << "Tong khoi luong hang da dong goi an toan: " << tongKhoiLuong << "g" << endl;
    return 0;
}', 'In các số chẵn', 'Dùng vòng lặp for từ 1 đến 20. Nếu là số lẻ thì dùng lệnh continue để bỏ qua, chỉ in ra các số chẵn cách nhau bằng dấu cách.', '#include <iostream>
using namespace std;

int main() {
    // Su dung for va continue de in cac so chan tu 1 den 20

    return 0;
}', 9, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-10', 'Hàm (Functions) & Truyền tham số', 'Chương 4: Hàm & Tổ chức mã nguồn', 'Chia để trị: Đóng gói mã nguồn thành các hàm chuyên biệt tái sử dụng và phân biệt Tham trị với Tham chiếu (&).', 'Trung bình', '35 phút', '<h3>1. Tại sao phải chia chương trình thành các Hàm (Functions)?</h3>
<p>Một phần mềm thực tế có hàng chục nghìn dòng lệnh. Nếu nhồi nhét tất cả vào trong <code>main()</code>, code sẽ rối như tơ vò và phải viết đi viết lại cùng một công thức nhiều lần. <strong>Hàm (Function)</strong> là một khối lệnh độc lập có tên riêng, nhận đầu vào (tham số), xử lý công việc cụ thể và trả về kết quả (<code>return</code>). Nếu hàm chỉ thực hiện hành động (như in hóa đơn) mà không trả về số liệu, ta dùng kiểu <code>void</code>.</p>
<pre>kiểu_trả_về tên_hàm(kiểu_1 tham_số_1, kiểu_2 tham_số_2) {
    // Xử lý nghiệp vụ
    return kết_quả;
}</pre>

<h3>2. Sự khác biệt sống còn: Truyền Tham trị vs Truyền Tham chiếu (<code>&amp;</code>)</h3>
<ul>
    <li><strong>Truyền tham trị (Pass by Value — Mặc định):</strong> Ví dụ <code>void tangLuong(int luong)</code>. Máy tính tạo ra một <strong>bản sao (photocopy)</strong> của biến truyền vào. Mọi chỉnh sửa bên trong hàm chỉ làm thay đổi tờ giấy photocopy, còn biến gốc trong <code>main()</code> vẫn giữ nguyên giá trị cũ!</li>
    <li><strong>Truyền tham chiếu (Pass by Reference — Có dấu <code>&amp;</code>):</strong> Ví dụ <code>void tangLuong(int &amp;luong)</code>. Hàm làm việc <strong>trực tiếp trên biến gốc</strong> trong bộ nhớ. Mọi thay đổi bên trong hàm sẽ cập nhật thẳng vào biến gốc ngoài <code>main()</code>!</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Gửi Bản Photocopy (Tham trị) vs Chia sẻ File Google Docs gốc (Tham chiếu &amp;)</h4>
    </div>
    <p>Hãy hình dung sự khác nhau giữa Tham trị và Tham chiếu qua cách làm việc văn phòng:</p>
    <ul>
        <li><strong>Truyền Tham trị (<code>int x</code>):</strong> Giống như bạn <em>in bản hợp đồng ra giấy photocopy</em> rồi đưa cho đồng nghiệp ghi chú. Đồng nghiệp có gạch xóa thế nào trên tờ bản sao đó thì <strong>tờ hợp đồng gốc trong tủ của bạn vẫn không hề thay đổi</strong>.</li>
        <li><strong>Truyền Tham chiếu (<code>int &amp;x</code>):</strong> Giống như bạn <em>gửi link tài liệu Google Docs quyền chỉnh sửa trực tiếp</em> hoặc đưa tận tay sổ tiết kiệm gốc cho nhân viên ngân hàng. Khi nhân viên ngân hàng cộng tiền lãi vào sổ, <strong>số dư thực tế của bạn thay đổi ngay lập tức</strong>!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Hàm phải được khai báo trước khi gọi:</strong> Trong C++, nếu bạn viết hàm ở phía dưới hàm <code>main()</code> mà không khai báo nguyên mẫu hàm (Function Prototype) ở trên đầu, trình biên dịch sẽ báo lỗi không nhận diện được tên hàm.</li>
        <li><strong>Quên dấu <code>&amp;</code> khi viết hàm hoán đổi (<code>swap</code>) hoặc hàm cập nhật số dư:</strong> Đây là lỗi kinh điển khiến hàm chạy xong mà dữ liệu không hề thay đổi!</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

// Ham tinh thue VAT (Truyen tham tri: chi doc gia tri de tinh toan)
double tinhThueVAT(double giaGoc) {
    return giaGoc * 0.08;
}

// Ham nap tien vao Vi dien tu (Truyen tham chieu &: cap nhat truc tiep so du goc)
void napTienVaoVi(long long &soDuVi, long long soTienNap) {
    soDuVi += soTienNap;
}

int main() {
    long long soDuMoMo = 500000;
    cout << "So du Vi MoMo ban dau : " << soDuMoMo << " VND" << endl;

    // Goi ham nap them 200.000 VND (tac dong truc tiep len bien soDuMoMo)
    napTienVaoVi(soDuMoMo, 200000);
    cout << "So du sau khi nap tien: " << soDuMoMo << " VND" << endl;

    double donHang = 300000;
    cout << "Thue VAT (8%) cua don hang 300k: " << tinhThueVAT(donHang) << " VND" << endl;
    return 0;
}', 'Viết hàm tính lũy thừa', 'Viết hàm luyThua(int coSo, int soMu) trả về kết quả cơ số mũ. Trong hàm main nhập a, b và gọi hàm in kết quả.', '#include <iostream>
using namespace std;

// Dinh nghia ham luyThua tai day

int main() {
    int a, b;
    cin >> a >> b;
    // Goi ham va in ket qua

    return 0;
}', 10, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-11', 'Nạp chồng hàm & Đệ quy (Recursion)', 'Chương 4: Hàm & Tổ chức mã nguồn', 'Khám phá kỹ thuật Nạp chồng hàm (Function Overloading) đa hình tĩnh và tư duy giải bài toán Đệ quy.', 'Trung bình', '35 phút', '<h3>1. Nạp chồng hàm (Function Overloading) — Cùng tên, đa năng</h3>
<p>Trong C++, bạn được phép đặt <strong>nhiều hàm trùng tên nhau</strong> miễn là chúng <strong>khác nhau về số lượng tham số hoặc kiểu dữ liệu tham số</strong>. Trình biên dịch sẽ tự động nhìn vào các đối số bạn truyền vào lúc gọi hàm để chọn đúng phiên bản hàm tương ứng.</p>
<pre>double tinhPhiShip(double khoiLuongKg);                  // Giao hàng nội thành
double tinhPhiShip(double khoiLuongKg, double soKmXa);   // Giao hàng liên tỉnh</pre>

<h3>2. Đệ quy (Recursion) — Hàm tự gọi lại chính nó</h3>
<p>Một hàm được gọi là <strong>đệ quy</strong> khi bên trong thân hàm lại có lời gọi đến chính hàm đó để giải quyết bài toán con nhỏ hơn. Mọi hàm đệ quy bắt buộc phải có đủ <strong>2 phần sống còn</strong>:</p>
<ul>
    <li><strong>Điều kiện dừng (Base Case):</strong> Trường hợp nhỏ nhất đã biết sẵn đáp án, giúp dừng việc gọi hàm tiếp. Nếu thiếu Base Case, hàm sẽ gọi vô tận gây lỗi tràn bộ nhớ ngăn xếp (<strong>Stack Overflow</strong>).</li>
    <li><strong>Bước thu nhỏ đệ quy (Recursive Step):</strong> Biến đổi bài toán kích thước <code>n</code> về bài toán kích thước nhỏ hơn (<code>n - 1</code>).</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Búp bê gỗ Nga Matryoshka (Đệ quy) &amp; Nút "Thanh toán" đa phương thức (Overloading)</h4>
    </div>
    <p>Hai kỹ thuật trong bài học này gắn liền với những hình ảnh rất gần gũi:</p>
    <ul>
        <li><strong>Nạp chồng hàm (Overloading):</strong> Giống như hành động <em>"Thanh toán"</em> tại siêu thị: Dù bạn đưa <code>thanhToan(tienMat)</code>, hay quẹt thẻ <code>thanhToan(maThe, maPIN)</code>, hay quét QR <code>thanhToan(maQR, appNganHang)</code> thì cùng một tên hành động "Thanh toán" đều xử lý trơn tru tùy theo thứ bạn đưa vào!</li>
        <li><strong>Đệ quy (Recursion):</strong> Giống như việc mở một bộ <em>Búp bê gỗ Nga Matryoshka</em> lồng vào nhau: Mở con búp bê lớn thứ <code>n</code> sẽ thấy con búp bê nhỏ hơn <code>n - 1</code> bên trong (Bước đệ quy), cứ mở tiếp tục như vậy cho đến khi gặp con búp bê gỗ đặc nhỏ nhất ở trong cùng không thể mở tiếp được nữa (<strong>Base Case — Điều kiện dừng</strong>)!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nạp chồng hàm KHÔNG phân biệt qua kiểu trả về:</strong> Hai hàm chỉ khác nhau mỗi kiểu trả về (ví dụ <code>int tong(int a)</code> và <code>double tong(int a)</code>) sẽ báo lỗi trùng lặp.</li>
        <li><strong>Đệ quy quá sâu gây tốn RAM:</strong> Mỗi lần gọi đệ quy sẽ tốn một khung nhớ trên Stack. Với <code>n</code> rất lớn (hàng triệu), nên ưu tiên dùng vòng lặp hoặc Quy hoạch động.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

// 1. Nap chong ham (Overloading): Tinh cuoc van chuyen Giao Hang Nhanh
double tinhCuocShip(double soKg) {
    // Goi noi thanh: Dong gia 15.000d + 5.000d moi kg
    return 15000 + soKg * 5000;
}

double tinhCuocShip(double soKg, int khoangCachKm) {
    // Goi lien tinh: Tinh them phu phi khoang cach 2.000d / km
    return 15000 + soKg * 5000 + khoangCachKm * 2000;
}

// 2. Ham De quy (Recursion): Tinh tong tien li xi tich luy tu ngay 1 den ngay n
int tongLiXiDeQuy(int ngay) {
    if (ngay <= 1) return 10000; // Base case: Ngay mung 1 nhan 10.000d
    return (ngay * 10000) + tongLiXiDeQuy(ngay - 1);
}

int main() {
    cout << "=== 1. NAP CHONG HAM TINH CUOC SHIP ===" << endl;
    cout << "Ship noi thanh (2.5 kg)         : " << tinhCuocShip(2.5) << " VND" << endl;
    cout << "Ship lien tinh (2.5 kg, 30 km)  : " << tinhCuocShip(2.5, 30) << " VND" << endl;

    cout << "\n=== 2. DE QUY TINH TIEN LI XI 5 NGAY TET ===" << endl;
    cout << "Tong li xi sau 5 ngay Tet: " << tongLiXiDeQuy(5) << " VND" << endl;
    return 0;
}', 'Tính số Fibonacci thứ n', 'Viết hàm đệ quy fibo(int n) tính số Fibonacci thứ n (fibo(1)=1, fibo(2)=1, fibo(n) = fibo(n-1) + fibo(n-2)). Nhập n và in kết quả.', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 11, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-12', 'Mảng một chiều (1D Array)', 'Chương 5: Mảng & Chuỗi ký tự', 'Quản lý hàng loạt dữ liệu cùng kiểu trong một dãy ô nhớ liên tiếp bằng Mảng một chiều (1D Array).', 'Trung bình', '30 phút', '<h3>1. Tại sao cần Mảng một chiều (1D Array)?</h3>
<p>Giả sử bạn cần lưu điểm thi của 50 học sinh trong lớp. Nếu dùng biến rời rạc, bạn phải khai báo <code>diem1, diem2, ..., diem50</code> — cực kỳ thủ công và không thể dùng vòng lặp để xử lý! <strong>Mảng 1 chiều</strong> giải quyết triệt để vấn đề này bằng cách gom tất cả các phần tử có <strong>cùng kiểu dữ liệu</strong> vào một dãy các ô nhớ <strong>nằm liền kề nhau trong RAM</strong> dưới một cái tên chung duy nhất.</p>
<pre>kiểu_dữ_liệu tên_mảng[số_lượng_phần_tử];
double nhietDoTuan[7] = {28.5, 30.0, 31.2, 29.8, 27.5, 26.0, 29.0};</pre>

<h3>2. Quy tắc đánh chỉ số từ <code>0</code> (Zero-based Indexing)</h3>
<ul>
    <li>Trong C++, phần tử đầu tiên của mảng có kích thước <code>N</code> luôn bắt đầu tại vị trí <strong><code>0</code></strong> (<code>arr[0]</code>), và phần tử cuối cùng nằm tại vị trí <strong><code>N - 1</code></strong> (<code>arr[N - 1]</code>).</li>
    <li>Nhờ các ô nhớ nằm sát cạnh nhau liên tiếp, máy tính có thể truy cập thẳng tới bất kỳ phần tử <code>arr[i]</code> nào chỉ trong 1 phép tính địa chỉ tức thời <strong>O(1)</strong>!</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Hộp chia thuốc 7 ngày trong tuần &amp; Tủ gửi đồ Siêu thị đánh số</h4>
    </div>
    <p>Mảng một chiều trong đời thực chính là những dãy ngăn chứa đồng nhất nằm liền kề nhau:</p>
    <ul>
        <li><strong>Hộp chia thuốc 7 ngăn (Thứ Hai đến Chủ Nhật):</strong> Cả 7 ngăn gắn liền thành một thanh nhựa dài tên là <code>hopThuoc[7]</code>. Ngăn đầu tiên là <code>hopThuoc[0]</code>, ngăn cuối cùng là <code>hopThuoc[6]</code>. Mỗi ngày bạn chỉ cần mở đúng ngăn thứ <code>i</code> để uống.</li>
        <li><strong>Bảng theo dõi Chi tiêu 7 ngày trên ứng dụng Ngân hàng:</strong> Lưu số tiền bạn tiêu mỗi ngày vào mảng <code>chiTieu[7]</code> để cuối tuần dùng vòng lặp <code>for</code> cộng tổng và tính trung bình chi tiêu/ngày.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi tràn chỉ số mảng (Index Out of Bounds):</strong> Khi khai báo <code>int a[5];</code>, các vị trí hợp lệ chỉ từ <code>a[0]</code> đến <code>a[4]</code>. Nếu bạn cố tình truy cập <code>a[5]</code>, chương trình sẽ đọc/ghi đè vào vùng nhớ lạ gây lỗi sập chương trình (Segmentation Fault) hoặc sai kết quả ngầm!</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Quan ly chi tieu ca nhan 7 ngay trong tuan (don vi: nghin dong)
    int chiTieu[7] = {85, 120, 60, 95, 150, 210, 180};
    int tongChiTieu = 0;
    int ngayTieuNhieuNhat = 0;

    cout << "=== BAO CAO CHI TIEU 7 NGAY TRONG TUAN ===" << endl;
    for (int i = 0; i < 7; i++) {
        cout << "Ngay thu " << (i + 2 <= 7 ? i + 2 : 8) << ": " << chiTieu[i] << ".000 VND" << endl;
        tongChiTieu += chiTieu[i];
        if (chiTieu[i] > chiTieu[ngayTieuNhieuNhat]) {
            ngayTieuNhieuNhat = i;
        }
    }

    cout << "------------------------------------------" << endl;
    cout << "Tong chi tieu ca tuan : " << tongChiTieu << ".000 VND" << endl;
    cout << "Trung binh moi ngay   : " << (tongChiTieu / 7) << ".000 VND" << endl;
    cout << "Muc chi cao nhat ngay : " << chiTieu[ngayTieuNhieuNhat] << ".000 VND" << endl;
    return 0;
}', 'Tính tổng mảng n phần tử', 'Nhập số nguyên n, sau đó nhập n số nguyên vào mảng. Tính và in ra tổng của tất cả các phần tử trong mảng.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 12, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-13', 'Các thuật toán mảng cơ bản', 'Chương 5: Mảng & Chuỗi ký tự', 'Làm chủ 3 bài toán cốt lõi trên mảng: Tìm cực trị (Max/Min), Tìm kiếm tuyến tính và Sắp xếp tăng/giảm dần.', 'Trung bình', '35 phút', '<h3>1. Thuật toán Tìm giá trị Lớn nhất (Max) &amp; Nhỏ nhất (Min)</h3>
<p>Ý tưởng chuẩn mực: Giả sử phần tử đầu tiên <code>a[0]</code> đang là "nhà vô địch" tạm thời (<code>maxVal = a[0]</code>). Sau đó cho vòng lặp duyệt từ phần tử thứ hai (<code>i = 1</code>) đến cuối mảng: hễ gặp phần tử <code>a[i]</code> nào lớn hơn <code>maxVal</code> thì trao lại ngôi vô địch cho nó (<code>maxVal = a[i]</code>).</p>

<h3>2. Thuật toán Tìm kiếm tuyến tính (Linear Search)</h3>
<p>Duyệt tuần tự từng phần tử từ đầu mảng đến cuối mảng để kiểm tra xem có phần tử nào bằng giá trị <code>X</code> cần tìm hay không. Nếu khớp thì trả về vị trí <code>i</code> và dùng <code>break</code> dừng tìm kiếm.</p>

<h3>3. Thuật toán Sắp xếp nổi bọt / Đổi chỗ (Bubble &amp; Selection Sort)</h3>
<p>Sử dụng 2 vòng lặp lồng nhau để so sánh các cặp phần tử. Nếu phần tử đứng trước lại lớn hơn phần tử đứng sau (<code>a[i] &gt; a[j]</code>), ta thực hiện <strong>hoán đổi vị trí (swap)</strong> thông qua một biến trung gian <code>temp</code> để đưa các giá trị nhỏ về đầu mảng, giá trị lớn về cuối mảng.</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Bộ lọc "Giá từ Thấp đến Cao" trên Shopee/Tiki &amp; Xếp hàng Chào cờ</h4>
    </div>
    <p>Các thuật toán mảng bạn vừa học chính là bộ máy vận hành các tính năng quen thuộc hàng ngày:</p>
    <ul>
        <li><strong>Tìm Min/Max ngoài thực tế:</strong> Khi bạn tìm vé máy bay trên Traveloka và chọn <em>"Vé rẻ nhất trong tháng"</em>, hệ thống chạy thuật toán tìm <code>Min</code> trên mảng giá vé.</li>
        <li><strong>Hoán đổi 2 biến qua biến tạm <code>temp</code>:</strong> Giống như khi bạn có <em>1 ly nước Cam</em> và <em>1 ly nước Táo</em> muốn đổi cốc cho nhau — bạn bắt buộc phải lấy thêm <strong>1 chiếc cốc rỗng thứ 3 (biến <code>temp</code>)</strong> để rót tạm nước Cam sang trước!</li>
        <li><strong>Sắp xếp mảng tăng dần:</strong> Chính là nút <em>"Sắp xếp theo Giá: Thấp đến Cao"</em> trên sàn thương mại điện tử hoặc cách giáo viên thể dục xếp hàng học sinh từ thấp đến cao.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Đừng khởi tạo <code>maxVal = 0</code> hoặc <code>minVal = 0</code>:</strong> Nếu cả mảng toàn số âm (ví dụ nhiệt độ mùa đông <code>{-5, -12, -3}</code>), khởi tạo <code>maxVal = 0</code> sẽ trả về kết quả sai là <code>0</code>! Hãy luôn khởi tạo <code>maxVal = a[0]</code>.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Tinh nang "Loc gia tu Thap den Cao" tren san Thuong mai dien tu
    int giaSanPham[5] = {450, 199, 890, 120, 320}; // Don vi: nghin VND
    int n = 5;

    // 1. Tim san pham re nhat (Min) va dat nhat (Max)
    int giaReNhat = giaSanPham[0];
    int giaDatNhat = giaSanPham[0];
    for (int i = 1; i < n; i++) {
        if (giaSanPham[i] < giaReNhat) giaReNhat = giaSanPham[i];
        if (giaSanPham[i] > giaDatNhat) giaDatNhat = giaSanPham[i];
    }

    // 2. Sap xep bang gia tang dan (Tu thap den cao)
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (giaSanPham[i] > giaSanPham[j]) {
                int temp = giaSanPham[i];
                giaSanPham[i] = giaSanPham[j];
                giaSanPham[j] = temp;
            }
        }
    }

    cout << "=== BO LOC GIA SAN PHAM SHOPEE C++ ===" << endl;
    cout << "San pham re nhat : " << giaReNhat << ".000 VND" << endl;
    cout << "San pham dat nhat: " << giaDatNhat << ".000 VND" << endl;
    cout << "Danh sach gia tu Thap -> Cao: ";
    for (int i = 0; i < n; i++) {
        cout << giaSanPham[i] << "k ";
    }
    cout << endl;
    return 0;
}', 'Tìm số nhỏ nhất trong mảng', 'Nhập mảng n số nguyên. Tìm và in ra phần tử có giá trị nhỏ nhất (Min) trong mảng.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 13, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-14', 'Chuỗi ký tự std::string', 'Chương 5: Mảng & Chuỗi ký tự', 'Xử lý văn bản chuyên nghiệp với thư viện std::string: nhập chuỗi có khoảng trắng, kiểm tra mật khẩu và chuẩn hóa tên.', 'Trung bình', '30 phút', '<h3>1. Bản chất của lớp <code>std::string</code> trong C++</h3>
<p>Khai báo thư viện <code>#include &lt;string&gt;</code> mang đến cho bạn kiểu dữ liệu <code>string</code> — về bản chất là một mảng ký tự động thông minh có khả năng tự co giãn kích thước và tích hợp sẵn hàng chục hàm xử lý văn bản mạnh mẽ.</p>

<h3>2. Các thao tác cốt lõi trên <code>std::string</code></h3>
<ul>
    <li><strong>Đo độ dài chuỗi:</strong> Dùng <code>s.length()</code> hoặc <code>s.size()</code> để biết chuỗi có bao nhiêu ký tự (kể cả dấu cách).</li>
    <li><strong>Truy cập từng ký tự:</strong> Giống hệt mảng 1 chiều, <code>s[i]</code> trả về ký tự kiểu <code>char</code> tại vị trí <code>i</code> (từ <code>0</code> đến <code>s.length() - 1</code>).</li>
    <li><strong>Ghép nối chuỗi &amp; So sánh:</strong> Dùng trực tiếp dấu <code>+</code> để nối 2 chuỗi (<code>ho + " " + ten</code>) và dấu <code>==</code> để kiểm tra hai chuỗi có giống hệt nhau không.</li>
    <li><strong>Nhập cả dòng có dấu cách:</strong> Dùng <code>getline(cin, s);</code> thay vì <code>cin &gt;&gt; s;</code> để đọc trọn vẹn họ tên, địa chỉ nhà hoặc câu văn.</li>
    <li><strong>Cắt &amp; Tìm kiếm chuỗi con:</strong> <code>s.substr(vi_tri, so_ky_tu)</code> để trích xuất chuỗi con; <code>s.find("tu_khoa")</code> để tìm vị trí xuất hiện.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Kiểm tra độ mạnh Mật khẩu Ngân hàng &amp; Tự động tạo Email Sinh viên</h4>
    </div>
    <p>Xử lý chuỗi <code>std::string</code> xuất hiện ở mọi biểu mẫu đăng ký tài khoản ngoài đời thực:</p>
    <ul>
        <li><strong>Kiểm tra độ mạnh mật khẩu khi đăng ký tài khoản:</strong> Hệ thống kiểm tra <code>matKhau.length() &gt;= 8</code> và duyệt vòng lặp qua từng ký tự <code>matKhau[i]</code> xem có chứa ít nhất 1 chữ cái in hoa (<code>''A''..''Z''</code>) và 1 chữ số (<code>''0''..''9''</code>) hay không.</li>
        <li><strong>Hệ thống tự động cấp Email trường Đại học:</strong> Ghép mã số sinh viên với tên miền trường bằng phép cộng chuỗi: <code>email = maSV + "@student.edu.vn"</code>.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Lỗi trôi lệnh <code>getline()</code> sau <code>cin &gt;&gt;</code>:</strong> Khi bạn dùng <code>cin &gt;&gt; tuoi;</code> rồi gọi ngay <code>getline(cin, hoTen);</code>, phím Enter còn sót lại trong bộ đệm sẽ khiến <code>getline</code> đọc chuỗi rỗng! Cách khắc phục: Gọi <code>cin.ignore();</code> trước <code>getline</code>.</li>
    </ul>
</div>', '#include <iostream>
#include <string>
using namespace std;

int main() {
    // Mo phong He thong Kiem tra Do bao mat Mat khau & Cap Email Sinh vien
    string hoTen = "Le Trung Hau";
    string maSV = "B24DCCN001";
    string matKhau = "CppAcademy2026";

    // Ghep chuoi tao email tu dong
    string emailTruong = maSV + "@codelearn.edu.vn";

    // Duyet chuoi kiem tra so ky tu in hoa va chu so trong mat khau
    int soChuHoa = 0, soChuSo = 0;
    for (int i = 0; i < (int)matKhau.length(); i++) {
        if (matKhau[i] >= ''A'' && matKhau[i] <= ''Z'') soChuHoa++;
        if (matKhau[i] >= ''0'' && matKhau[i] <= ''9'') soChuSo++;
    }

    cout << "=== HE THONG TAI KHOAN SINH VIEN ===" << endl;
    cout << "Ho va ten      : " << hoTen << " (" << hoTen.length() << " ky tu)" << endl;
    cout << "Email cap phat : " << emailTruong << endl;
    cout << "Do dai mat khau: " << matKhau.length() << " ky tu (" << soChuHoa << " chu hoa, " << soChuSo << " chu so)" << endl;
    cout << "Danh gia       : " << (matKhau.length() >= 8 && soChuHoa > 0 && soChuSo > 0 ? "Mat khau Manh (Hop le)" : "Mat khau Yeu") << endl;
    return 0;
}', 'Đếm số ký tự in hoa', 'Nhập vào một chuỗi ký tự s. Đếm và in ra số lượng ký tự chữ in hoa (''A'' đến ''Z'') có trong chuỗi.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 14, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-15', 'Mảng hai chiều (Ma trận 2D)', 'Chương 5: Mảng & Chuỗi ký tự', 'Biểu diễn bảng tính, bản đồ tọa độ, ảnh kỹ thuật số và sơ đồ ghế ngồi bằng Mảng hai chiều (Ma trận 2D).', 'Trung bình', '35 phút', '<h3>1. Mảng hai chiều (2D Array / Matrix) là gì?</h3>
<p>Nếu mảng 1 chiều là một hàng ghế thẳng tắp, thì <strong>Mảng 2 chiều</strong> chính là một <strong>bảng lưới gồm nhiều Hàng (Rows) và nhiều Cột (Columns)</strong>. Cú pháp khai báo:</p>
<pre>kiểu_dữ_liệu tên_mảng[SỐ_HÀNG][SỐ_CỘT];</pre>
<p>Để xác định một ô trong bảng, ta luôn chỉ định <strong>toạ độ Hàng trước, Cột sau</strong>: <code>a[hang][cot]</code> (hàng chạy từ <code>0</code> đến <code>SO_HANG - 1</code>, cột chạy từ <code>0</code> đến <code>SO_COT - 1</code>).</p>

<h3>2. Kỹ thuật duyệt Ma trận bằng 2 vòng lặp <code>for</code> lồng nhau</h3>
<ul>
    <li><strong>Vòng lặp ngoài (<code>i</code>):</strong> Di chuyển qua từng hàng từ trên xuống dưới.</li>
    <li><strong>Vòng lặp trong (<code>j</code>):</strong> Tại mỗi hàng <code>i</code>, quét qua từng cột <code>j</code> từ trái sang phải để xử lý ô <code>a[i][j]</code>.</li>
    <li><strong>Đường chéo chính của ma trận vuông (<code>N × N</code>):</strong> Gồm các phần tử có chỉ số hàng bằng chỉ số cột (<code>a[i][i]</code>).</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Sơ đồ đặt ghế Rạp chiếu phim CGV &amp; Bảng tính Excel / Điểm ảnh màn hình</h4>
    </div>
    <p>Mảng hai chiều là cấu trúc dữ liệu nền tảng của rất nhiều ứng dụng trực quan:</p>
    <ul>
        <li><strong>Sơ đồ ghế ngồi rạp chiếu phim hoặc khoang máy bay:</strong> Rạp phim có các hàng ghế A, B, C, D (Hàng <code>0, 1, 2, 3</code>) và các số ghế trong mỗi hàng 1, 2, 3, 4, 5 (Cột <code>0..4</code>). Ô <code>ghe[2][3] = 1</code> nghĩa là ghế Hàng 2 - Cột 3 đã có người đặt, còn <code>= 0</code> nghĩa là ghế đang trống!</li>
        <li><strong>Màn hình Điện thoại / Tivi &amp; Ảnh kỹ thuật số:</strong> Một bức ảnh Full HD thực chất là mảng 2 chiều kích thước <code>1080 hàng × 1920 cột</code> các điểm ảnh (pixels).</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Nhầm lẫn giữa chỉ số Hàng và Cột:</strong> Khi khai báo <code>int a[3][5];</code> (3 hàng, 5 cột), vòng lặp ngoài phải chạy đến <code>&lt; 3</code> và vòng lặp trong chạy đến <code>&lt; 5</code>. Đảo ngược hai con số này sẽ gây lỗi truy cập ngoài vùng nhớ!</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong So do ghe ngoi Rap chieu phim (3 hang x 4 cot)
    // Quy uoc: 0 = Ghe trong, 1 = Ghe da dat
    int rapPhim[3][4] = {
        {1, 1, 0, 0},
        {0, 1, 1, 1},
        {0, 0, 0, 1}
    };

    int gheTrong = 0, gheDaDat = 0;

    cout << "=== SO DO GHE RAP CHIEU PHIM (1: Da dat, 0: Trong) ===" << endl;
    for (int hang = 0; hang < 3; hang++) {
        cout << "Hang " << (char)(''A'' + hang) << ": ";
        for (int cot = 0; cot < 4; cot++) {
            cout << "[" << rapPhim[hang][cot] << "] ";
            if (rapPhim[hang][cot] == 0) gheTrong++;
            else gheDaDat++;
        }
        cout << endl;
    }

    cout << "------------------------------------------------------" << endl;
    cout << "So ghe da ban: " << gheDaDat << " ve | So ghe con trong: " << gheTrong << " ghe" << endl;
    return 0;
}', 'Tính tổng ma trận vuông', 'Nhập số nguyên n (kích thước ma trận n x n) và các phần tử của ma trận. Tính và in ra tổng tất cả các phần tử.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 15, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-16', 'Con trỏ (Pointers) trong C++', 'Chương 6: Con trỏ & Quản lý bộ nhớ', 'Làm chủ vũ khí mạnh nhất của C++: Địa chỉ bộ nhớ RAM, toán tử lấy địa chỉ (&) và toán tử giải tham chiếu (*).', 'Nâng cao', '35 phút', '<h3>1. Địa chỉ ô nhớ trong RAM &amp; Toán tử lấy địa chỉ <code>&amp;</code></h3>
<p>Bộ nhớ RAM của máy tính giống như một con phố dài gồm hàng tỷ căn phòng được đánh số thứ tự hệ thập lục phân (ví dụ: <code>0x7ffee3b4c8a4</code>). Khi bạn khai báo <code>int soDu = 500;</code>, biến <code>soDu</code> được cấp một căn phòng cụ thể. Để hỏi máy tính xem biến <code>soDu</code> đang nằm ở địa chỉ nào, ta đặt dấu <strong><code>&amp;</code></strong> trước tên biến: <code>&amp;soDu</code>.</p>

<h3>2. Biến Con trỏ (Pointer) &amp; Toán tử giải tham chiếu <code>*</code></h3>
<ul>
    <li><strong>Khai báo con trỏ (<code>int* ptr = &amp;soDu;</code>):</strong> Con trỏ <code>ptr</code> không lưu con số 500 trực tiếp, mà nó <strong>lưu địa chỉ căn phòng của biến <code>soDu</code></strong>.</li>
    <li><strong>Toán tử giải tham chiếu (Dereference <code>*ptr</code>):</strong> Khi đặt dấu <code>*</code> trước tên con trỏ đã khởi tạo, bạn ra lệnh cho máy tính: <em>"Hãy đi tới đúng địa chỉ ghi trong <code>ptr</code> và mở cửa lấy/sửa giá trị bên trong căn phòng đó!"</em>. Do đó, gán <code>*ptr = 900;</code> sẽ làm cho biến <code>soDu</code> đổi thành <code>900</code> ngay lập tức!</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Tờ giấy ghi Địa chỉ Kho hàng &amp; Định vị GPS trên Google Maps</h4>
    </div>
    <p>Tại sao không bê nguyên cả kho hàng đi khắp nơi mà lại dùng Con trỏ?</p>
    <ul>
        <li><strong>Biến thông thường (<code>khoHang</code>):</strong> Chính là một <em>tòa nhà kho chứa đầy hàng hóa nặng hàng chục tấn</em> nằm cố định tại một vị trí.</li>
        <li><strong>Địa chỉ (<code>&amp;khoHang</code>):</strong> Là <em>tọa độ số nhà</em> (ví dụ: Số 128 đường Cầu Giấy).</li>
        <li><strong>Biến Con trỏ (<code>ptr</code>):</strong> Chính là <em>một mảnh giấy nhỏ gọn ghi tọa độ "Số 128 đường Cầu Giấy"</em>. Thay vì phải bê cả tòa nhà đi giao dịch, bạn chỉ cần trao mảnh giấy <code>ptr</code> nhẹ tênh!</li>
        <li><strong>Giải tham chiếu (<code>*ptr</code>):</strong> Là việc tài xế <em>nhìn địa chỉ trên mảnh giấy <code>ptr</code>, lái xe đến tận kho hàng đó để bốc dỡ hoặc thêm hàng mới vào kho</em>.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Con trỏ hoang (Wild Pointer) &amp; <code>nullptr</code>:</strong> Khai báo <code>int* p;</code> mà chưa trỏ vào biến hợp lệ nào rồi dùng <code>*p = 10;</code> sẽ làm sập chương trình ngay lập tức! Nếu con trỏ chưa trỏ đi đâu, hãy luôn gán <code>int* p = nullptr;</code>.</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong Dieu khien Nhiet do Dieu hoa thong minh qua Con tro Cam bien
    int nhietDoPhong = 28;            // Nhiet do thuc te trong phong (28 do C)
    int* dieuKhienTuXa = &nhietDoPhong; // Con tro luu dia chi o nho cua cam bien phong

    cout << "=== HE THONG DIEU HOA SMART HOME C++ ===" << endl;
    cout << "Nhiet do phong ban dau      : " << nhietDoPhong << " do C" << endl;
    cout << "Dia chi o nho cam bien RAM  : " << dieuKhienTuXa << endl;
    cout << "Doc nhiet do qua dieu khien : " << *dieuKhienTuXa << " do C" << endl;

    // Bam dieu khien ha nhiet do xuong 24 do C thong qua giai tham chieu *
    *dieuKhienTuXa = 24;

    cout << "----------------------------------------" << endl;
    cout << "Sau khi chinh tren dieu khien (*dieuKhienTuXa = 24):" << endl;
    cout << "Nhiet do phong thuc te hien tai: " << nhietDoPhong << " do C" << endl;
    return 0;
}', 'Gấp đôi giá trị qua con trỏ', 'Khai báo số nguyên n nhập từ bàn phím. Sử dụng con trỏ trỏ tới n để nhân đôi giá trị của n và in kết quả n ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 16, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-17', 'Cấp phát bộ nhớ động (new & delete)', 'Chương 6: Con trỏ & Quản lý bộ nhớ', 'Quản lý linh hoạt vùng nhớ Heap khi chương trình đang chạy bằng toán tử new và chống rò rỉ bộ nhớ với delete.', 'Nâng cao', '35 phút', '<h3>1. Hạn chế của Mảng tĩnh (Stack) &amp; Sức mạnh của Bộ nhớ động (Heap)</h3>
<p>Với mảng tĩnh thông thường (nằm trên vùng nhớ <strong>Stack</strong>), kích thước phải cố định từ lúc viết code. Nếu bạn khai báo <code>int khachHang[10000];</code> nhưng hôm đó quán chỉ có 5 khách thì lãng phí 9.995 ô nhớ; ngược lại nếu có 10.001 khách thì chương trình bị tràn! <strong>Cấp phát động trên vùng nhớ Heap</strong> cho phép chương trình hỏi số lượng thực tế <code>n</code> từ người dùng lúc đang chạy rồi mới xin hệ điều hành cấp đúng <code>n</code> ô nhớ vừa khít.</p>

<h3>2. Cặp toán tử <code>new</code> (Xin cấp phát) và <code>delete</code> (Trả lại bộ nhớ)</h3>
<ul>
    <li><strong>Cấp phát 1 biến đơn lẻ:</strong> <code>int* p = new int(100);</code> → Giải phóng bằng: <code>delete p;</code></li>
    <li><strong>Cấp phát mảng động <code>n</code> phần tử:</strong> <code>int* arr = new int[n];</code> → Giải phóng bằng: <code>delete[] arr;</code></li>
</ul>
<p><strong>Quy tắc bất di bất dịch trong C++:</strong> Vùng nhớ Heap không tự động biến mất khi hàm kết thúc. Mọi lệnh <code>new</code> bắt buộc phải có một lệnh <code>delete</code> (hoặc <code>delete[]</code>) tương ứng khi dùng xong!</p>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Đặt phòng Khách sạn theo Đoàn khách thực tế &amp; Trả phòng (Check-out)</h4>
    </div>
    <p>Cơ chế cấp phát động <code>new / delete</code> giống hệt quy trình <strong>thuê và trả phòng khách sạn</strong>:</p>
    <ul>
        <li><strong>Mảng tĩnh (Stack):</strong> Giống như công ty bạn mua đứt cố định 50 căn hộ quanh năm dù có lúc chỉ có 2 nhân viên đi công tác (rất lãng phí).</li>
        <li><strong>Lệnh <code>new int[n]</code> (Check-in):</strong> Đoàn khách đến quầy lễ tân báo chính xác hôm nay có <code>n</code> người. Lễ tân cấp đúng <code>n</code> chìa khóa phòng vừa đủ nhu cầu.</li>
        <li><strong>Lệnh <code>delete[] arr</code> (Check-out trả phòng):</strong> Khi đoàn khách rời đi, bạn phải làm thủ tục trả lại <code>n</code> phòng cho khách sạn để đón đoàn khác. Nếu bỏ về mà quên trả phòng, những phòng đó bị khóa chết mãi mãi — trong lập trình gọi là <strong>Rò rỉ bộ nhớ (Memory Leak)</strong> làm máy tính ngày càng chậm và treo cứng!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Dùng nhầm <code>delete arr;</code> thay vì <code>delete[] arr;</code> cho mảng động:</strong> Với mảng cấp phát bằng <code>new[]</code>, bắt buộc phải có cặp ngoặc vuông <code>delete[]</code> để giải phóng toàn bộ dãy phần tử.</li>
        <li><strong>Sau khi <code>delete p;</code> nên gán <code>p = nullptr;</code></strong> để tránh lỗi con trỏ treo (Dangling Pointer).</li>
    </ul>
</div>', '#include <iostream>
using namespace std;

int main() {
    // Mo phong He thong Dat ban Tiec cuoi linh hoat theo so luong khach thuc te
    int soBanTiec = 4; // So luong ban thuc te khach dat luc chay chuong trinh

    // Xin cap phat dong mang luu so khach ngoi tai moi ban tren Heap
    int* dsBan = new int[soBanTiec];

    dsBan[0] = 10;
    dsBan[1] = 8;
    dsBan[2] = 10;
    dsBan[3] = 12;

    int tongKhach = 0;
    cout << "=== QUAN LY DAT BAN TIEC NHA HANG (DYNAMIC MEMORY) ===" << endl;
    for (int i = 0; i < soBanTiec; i++) {
        cout << "Ban tiec so " << (i + 1) << ": " << dsBan[i] << " khach" << endl;
        tongKhach += dsBan[i];
    }
    cout << "Tong so suat phuc vu: " << tongKhach << " khach" << endl;

    // Thu hoi va giai phong bo nho Heap sau khi tiec ket thuc
    delete[] dsBan;
    dsBan = nullptr;
    cout << "[He thong] Da giai phong bo nho (delete[]) an toan!" << endl;
    return 0;
}', 'Mảng động n phần tử', 'Nhập số nguyên n. Sử dụng toán tử new để cấp phát mảng n số nguyên, tính tổng mảng, sau đó giải phóng mảng bằng delete[] và in tổng ra màn hình.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 17, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-18', 'Kiểu dữ liệu cấu trúc (struct)', 'Chương 7: Lập trình Hướng đối tượng (OOP)', 'Đóng gói nhiều thông tin khác kiểu dữ liệu của một thực thể đời thực vào một hồ sơ thống nhất với struct.', 'Trung bình', '30 phút', '<h3>1. Tại sao Mảng chưa đủ và chúng ta cần <code>struct</code>?</h3>
<p>Mảng chỉ lưu được các phần tử <strong>cùng một kiểu dữ liệu</strong> (toàn số nguyên, hoặc toàn chuỗi). Nhưng ngoài đời thực, một đối tượng như <em>Sản phẩm trên Shopee</em> lại bao gồm nhiều thông tin khác kiểu đi liền với nhau: Tên sản phẩm (<code>string</code>), Giá bán (<code>double</code>), Số lượng tồn kho (<code>int</code>), Còn khuyến mãi không (<code>bool</code>). Từ khóa <strong><code>struct</code> (Structure)</strong> giúp bạn tự định nghĩa một kiểu dữ liệu tổng hợp mới gom tất cả các thuộc tính đó vào chung một gói!</p>
<pre>struct SanPham {
    string tenSP;
    double giaBan;
    int tonKho;
};</pre>

<h3>2. Khởi tạo &amp; Truy xuất thành viên bằng Toán tử dấu chấm (<code>.</code>)</h3>
<ul>
    <li>Sau khi định nghĩa khuôn mẫu <code>struct SanPham</code>, bạn có thể tạo ra các biến cụ thể: <code>SanPham sp1 = {"Ban phim Co", 850000, 15};</code> hoặc tạo cả một mảng các sản phẩm <code>SanPham khoHang[100];</code>.</li>
    <li>Sử dụng dấu chấm <code>.</code> để đọc hoặc gán từng thông tin bên trong: <code>sp1.giaBan = 790000;</code>.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Thẻ Căn cước Công dân (CCCD) &amp; Hồ sơ Bệnh án Điện tử Bệnh viện</h4>
    </div>
    <p>Một <code>struct</code> trong C++ giống hệt <strong>một biểu mẫu hồ sơ hoặc tấm thẻ Căn cước công dân</strong>:</p>
    <ul>
        <li>Nếu không có tấm thẻ CCCD (<code>struct CongDan</code>), mỗi khi đi làm thủ tục bạn phải cầm rời rạc 4 mảnh giấy: mảnh ghi Họ tên, mảnh ghi Năm sinh, mảnh ghi Quê quán, mảnh ghi Số định danh — rất dễ thất lạc và nhầm thông tin người này sang người kia!</li>
        <li>Nhờ đóng gói thành một thẻ <code>struct CongDan</code> duy nhất, khi truyền hồ sơ của một người vào hàm xử lý, bạn chỉ cần truyền đúng 1 biến <code>congDanA</code> là mang theo đầy đủ mọi thông tin của người đó.</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Quên dấu chấm phẩy <code>;</code> ngay sau dấu ngoặc nhọn đóng <code>};</code> của <code>struct</code>:</strong> Đây là lỗi cú pháp phổ biến nhất khi mới học <code>struct</code> và <code>class</code> trong C++.</li>
    </ul>
</div>', '#include <iostream>
#include <string>
using namespace std;

// Dinh nghia kieu cau truc Ho so Benh nhan tai Benh vien
struct HoSoBenhNhan {
    string maBN;
    string hoTen;
    int namSinh;
    double nhietDoCoThe;
};

int main() {
    HoSoBenhNhan bn1 = {"BN2026", "Nguyen Minh Khang", 1998, 37.8};
    int namHienTai = 2026;
    int tuoi = namHienTai - bn1.namSinh;

    cout << "=== PHIEU KHAM BENH DIEN TU (STRUCT) ===" << endl;
    cout << "Ma benh nhan : " << bn1.maBN << endl;
    cout << "Ho va ten    : " << bn1.hoTen << " (" << tuoi << " tuoi)" << endl;
    cout << "Than nhiet   : " << bn1.nhietDoCoThe << " do C" << endl;
    cout << "Chan doan so : " << (bn1.nhietDoCoThe >= 37.5 ? "Co dau hieu sot - Can theo doi" : "Binh thuong") << endl;
    return 0;
}', 'Định nghĩa struct Phân số', 'Tạo struct PhanSo gồm 2 thành phần tử số (tu) và mẫu số (mau). Nhập 1 phân số và in ra theo định dạng tu/mau.', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 18, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-19', 'Lớp (Class) & Đối tượng (Object)', 'Chương 7: Lập trình Hướng đối tượng (OOP)', 'Nắm vững nền tảng Lập trình Hướng đối tượng (OOP): Lớp, Đối tượng và Tính đóng gói bảo mật dữ liệu (Encapsulation).', 'Nâng cao', '35 phút', '<h3>1. Tư duy Lập trình Hướng đối tượng (OOP): Class vs Object</h3>
<p>Nâng cấp từ <code>struct</code>, <strong>Lớp (<code>class</code>)</strong> không chỉ gom các dữ liệu (gọi là <strong>Thuộc tính - Attributes</strong>) mà còn đóng gói cả các hàm hành động (gọi là <strong>Phương thức - Methods</strong>) và cơ chế bảo mật vào chung một khối.</p>
<ul>
    <li><strong>Class (Lớp):</strong> Là <em>bản thiết kế khuôn mẫu</em> (chưa tốn bộ nhớ lưu trữ thực thể).</li>
    <li><strong>Object (Đối tượng):</strong> Là <em>sản phẩm thực tế cụ thể</em> được đúc ra từ bản thiết kế Class đó.</li>
</ul>

<h3>2. Tính Đóng gói (Encapsulation) — Tại sao cần <code>private</code> và <code>public</code>?</h3>
<ul>
    <li><strong><code>private</code> (Riêng tư — Mặc định của Class):</strong> Dữ liệu nhạy cảm bên trong đối tượng bị khóa kín, bên ngoài <strong>không thể tự ý truy cập hay sửa trực tiếp</strong> (ngăn chặn các thao tác bất hợp lệ như gán số dư ngân hàng thành số âm <code>-999999</code>).</li>
    <li><strong><code>public</code> (Công khai):</strong> Các phương thức giao tiếp hợp lệ (<code>napTien()</code>, <code>rutTien()</code>, <code>xemSoDu()</code> — hay các hàm Getter/Setter) được mở ra để bên ngoài tương tác có kiểm soát.</li>
</ul>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Bản vẽ Thiết kế Ô tô (Class) vs Chiếc xe ngoài đời &amp; Két sắt Ngân hàng (private/public)</h4>
    </div>
    <p>Hai khái niệm cốt lõi của bài học này cực kỳ dễ hiểu khi nhìn ra thế giới xung quanh:</p>
    <ul>
        <li><strong>Class vs Object:</strong> Bản vẽ kỹ thuật dòng xe <em>VinFast VF8</em> trên máy tính của kỹ sư chính là <strong><code>class Oto</code></strong>. Từ 1 bản vẽ đó, nhà máy sản xuất ra 10.000 chiếc xe thực tế lăn bánh ngoài đường mang biển số khác nhau — mỗi chiếc xe đó là một <strong><code>Object</code> (Đối tượng)</strong>!</li>
        <li><strong>Tính Đóng gói (<code>private</code> vs <code>public</code>):</strong> Giống như <strong>Tài khoản Ngân hàng của bạn</strong>: Biến <code>soDu</code> bắt buộc phải để ở chế độ <strong><code>private</code></strong> (nằm sâu trong két sắt máy chủ ngân hàng, không ai được thò tay vào sửa số trực tiếp). Muốn thay đổi số dư, bạn bắt buộc phải đi qua giao diện <strong><code>public</code></strong> là hàm <code>rutTien(soTien)</code> — nơi ngân hàng kiểm tra xem bạn nhập đúng PIN và đủ số dư hay không rồi mới trừ tiền!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Mặc định trong <code>class</code> là <code>private</code> (ngược với <code>struct</code> mặc định là <code>public</code>):</strong> Nếu bạn quên viết nhãn <code>public:</code> trước các phương thức trong <code>class</code>, hàm <code>main()</code> sẽ bị báo lỗi <code>is private within this context</code> khi gọi!</li>
    </ul>
</div>', '#include <iostream>
#include <string>
using namespace std;

// Ban thiet ke Lop Tai Khoan Ngan Hang co Tinh Dong Goi (Encapsulation)
class TaiKhoanNganHang {
private:
    string chuTaiKhoan;
    long long soDu; // Bao mat tuyet doi (private), khong cho sua truc tiep tu ben ngoai

public:
    void moTaiKhoan(string ten, long long soDuBanDau) {
        chuTaiKhoan = ten;
        soDu = (soDuBanDau >= 0) ? soDuBanDau : 0;
    }

    void rutTien(long long soTien) {
        if (soTien > 0 && soTien <= soDu) {
            soDu -= soTien;
            cout << "[Giao dich] Rut thanh cong " << soTien << " VND." << endl;
        } else {
            cout << "[Tu choi] So du khong du hoac so tien khong hop le!" << endl;
        }
    }

    void inSaoKe() {
        cout << "Chu TK: " << chuTaiKhoan << " | So du bao mat: " << soDu << " VND" << endl;
    }
};

int main() {
    TaiKhoanNganHang tkVietcombank;
    tkVietcombank.moTaiKhoan("Le Trung Hau", 5000000);
    tkVietcombank.inSaoKe();

    tkVietcombank.rutTien(1500000);
    tkVietcombank.inSaoKe();
    return 0;
}', 'Xây dựng lớp Hình Tròn', 'Tạo class HinhTron có thuộc tính banKinh (private), phương thức setBanKinh(double r) và tinhChuVi() (chu vi = 2 * 3.14 * r). Tạo đối tượng với r = 4 và in chu vi.', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 19, '2026-10-13T22:35:16.317972');
INSERT OR REPLACE INTO lessons (id, title, chapter, description, level, duration, content, example, exercise_title, exercise_description, starter_code, order_num, created_at) VALUES ('lesson-20', 'Constructor, Destructor & Kế thừa (OOP)', 'Chương 7: Lập trình Hướng đối tượng (OOP)', 'Hoàn thiện tư duy OOP hiện đại với Hàm khởi tạo tự động (Constructor), Hàm hủy (Destructor) và Tính Kế thừa (Inheritance).', 'Nâng cao', '40 phút', '<h3>1. Vòng đời Đối tượng: Constructor (Hàm khởi tạo) &amp; Destructor (Hàm hủy)</h3>
<ul>
    <li><strong>Constructor (Hàm khởi tạo):</strong> Là một phương thức đặc biệt có <strong>tên trùng khít với tên Class</strong> và <strong>không có kiểu trả về</strong>. Nó được <strong>tự động gọi ngay khoảnh khắc đối tượng vừa được tạo ra</strong> để thiết lập các giá trị ban đầu (không lo đối tượng chứa dữ liệu rác).</li>
    <li><strong>Destructor (Hàm hủy):</strong> Có tên trùng tên Class nhưng thêm dấu ngã <code>~</code> ở đầu (ví dụ <code>~TaiKhoan()</code>). Tự động chạy khi đối tượng kết thúc vòng đời để dọn dẹp tài nguyên, đóng file hoặc giải phóng bộ nhớ động.</li>
</ul>

<h3>2. Tính Kế thừa (Inheritance) — Tái sử dụng &amp; Mở rộng quy mô lớn</h3>
<p>Trong thực tế, nhiều đối tượng có chung một nhóm đặc điểm gốc (ví dụ: <em>Lập trình viên</em>, <em>Kế toán</em>, <em>Quản lý</em> đều là <strong>Nhân viên công ty</strong> — đều có Mã NV, Họ tên, Lương cơ bản). Thay vì viết lại code trùng lặp ở cả 3 lớp, C++ cho phép tạo một <strong>Lớp cha (Base Class)</strong> chứa phần chung, và cho các <strong>Lớp con (Derived Class)</strong> kế thừa lại:</p>
<pre>class LapTrinhVien : public NhanVien {
    // Tự động thừa hưởng các thuộc tính/phương thức của NhanVien
    // và bổ sung thêm thuộc tính riêng (ví dụ: tienThuongDuAn)
};</pre>

<div class="real-world-box">
    <div class="real-world-header">
        <span class="real-world-badge">🌍 Ví dụ minh họa thực tế ngoài đời sống</span>
        <h4>Cài đặt gốc xuất xưởng Điện thoại (Constructor) &amp; Hệ thống Nhân sự Tập đoàn (Kế thừa)</h4>
    </div>
    <p>Hãy quan sát cách các tập đoàn công nghệ ứng dụng Constructor và Kế thừa:</p>
    <ul>
        <li><strong>Constructor (Hàm khởi tạo tự động):</strong> Giống như khi một chiếc <em>iPhone vừa xuất xưởng</em> khỏi dây chuyền lắp ráp, hệ thống tự động nạp sẵn hệ điều hành iOS mặc định, ngôn ngữ và mức pin an toàn ngay từ giây đầu tiên mà người mua không cần tự lắp mạch!</li>
        <li><strong>Tính Kế thừa (Inheritance):</strong> Trong phần mềm Quản lý Nhân sự (HRM) của công ty: Lớp cha <strong><code>NhanVien</code></strong> định nghĩa sẵn <code>hoTen</code>, <code>luongCoBan</code>. Lớp con <strong><code>LapTrinhVien : public NhanVien</code></strong> thừa hưởng toàn bộ thông tin đó và chỉ cần cộng thêm <code>thuongCode</code>; còn lớp con <strong><code>NhanVienKinhDoanh : public NhanVien</code></strong> cộng thêm <code>hoaHongDoanhSo</code>. Khi công ty đổi quy định bảo hiểm chung, kỹ sư chỉ cần sửa đúng 1 chỗ ở lớp cha <code>NhanVien</code>!</li>
    </ul>
</div>

<div class="pitfall-box">
    <h4>⚠️ Lưu ý quan trọng & Lỗi thường gặp ngoài thực tế</h4>
    <ul>
        <li><strong>Thứ tự gọi Constructor trong Kế thừa:</strong> Khi khởi tạo một đối tượng Lớp con, <strong>Constructor của Lớp cha luôn chạy trước</strong> để xây xong phần móng, rồi mới đến Constructor của Lớp con hoàn thiện phần riêng! (Khi hủy bằng Destructor thì ngược lại: Con hủy trước, Cha hủy sau).</li>
    </ul>
</div>', '#include <iostream>
#include <string>
using namespace std;

// Lop Cha (Base Class): Nhan vien chung trong Cong ty
class NhanVien {
protected:
    string hoTen;
    long long luongCoBan;

public:
    // Constructor khoi tao tu dong khi tao doi tuong
    NhanVien(string ten, long long luongCB) : hoTen(ten), luongCoBan(luongCB) {}

    void inHoSoCoBan() {
        cout << "Nhan vien: " << hoTen << " | Luong co ban: " << luongCoBan << " VND" << endl;
    }
};

// Lop Con (Derived Class): Lap trinh vien ke thua tu NhanVien
class LapTrinhVien : public NhanVien {
private:
    string ngonNguChinh;
    long long thuongDuAn;

public:
    LapTrinhVien(string ten, long long luongCB, string nn, long long thuong)
        : NhanVien(ten, luongCB), ngonNguChinh(nn), thuongDuAn(thuong) {}

    void inBangLuongChiTiet() {
        inHoSoCoBan();
        cout << "Chuyen mon : " << ngonNguChinh << " | Thuong du an: " << thuongDuAn << " VND" << endl;
        cout << "=> TONG THU NHAP THUC LINH: " << (luongCoBan + thuongDuAn) << " VND" << endl;
    }
};

int main() {
    cout << "=== HE THONG QUAN LY NHAN SU CONG TY CONG NGHE (OOP) ===" << endl;
    LapTrinhVien dev("Le Trung Hau", 18000000, "C++ / Backend", 5000000);
    dev.inBangLuongChiTiet();
    return 0;
}', 'Kế thừa lớp Động vật', 'Tạo lớp DongVat có phương thức keu() in ''Dong vat keu''. Tạo lớp Meo kế thừa DongVat ghi đè keu() in ''Meo meo''. Khởi tạo đối tượng Meo và gọi phương thức keu().', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 20, '2026-10-13T22:35:16.317972');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `exercises` (60 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-01', 'In lời chào ra màn hình', 'Cơ bản', 'easy', 100, 'Viết chương trình C++ sử dụng đối tượng <code>cout</code> để in ra màn hình dòng chữ:<br><code>Hello C++ Academy!</code>', '#include <iostream>
using namespace std;

int main() {
    // Viết code in ra màn hình tại đây

    return 0;
}', 'Hello C++ Academy!', 'Sử dụng lệnh cout << \', '["cout", "hello c++ academy", "return 0", "#include"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-01', 'In danh thiếp cá nhân', 'Vận dụng', 'medium', 100, 'Viết chương trình C++ in ra 3 dòng thông tin giới thiệu bản thân:<br>Dòng 1: <code>Ho va ten: Hoc vien CodeLearn</code><br>Dòng 2: <code>Khoa hoc: Lap trinh C++ co ban</code><br>Dòng 3: <code>Muc tieu: Lam chu C++ trong 30 ngay</code>', '#include <iostream>
using namespace std;

int main() {
    // In 3 dòng thông tin cá nhân bằng cout kết hợp endl

    return 0;
}', 'Ho va ten: Hoc vien CodeLearn
Khoa hoc: Lap trinh C++ co ban
Muc tieu: Lam chu C++ trong 30 ngay', 'Sử dụng nhiều lệnh cout với endl hoặc \\n để ngắt dòng đúng yêu cầu.', '["cout", "ho va ten", "khoa hoc", "muc tieu", "endl"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-01', 'Vẽ hình chữ nhật bằng dấu sao', 'Thử thách', 'hard', 100, 'Viết chương trình C++ in ra một hình chữ nhật có kích thước 3 dòng, mỗi dòng chứa đúng 5 dấu sao:<br><code>*****</code><br><code>*****</code><br><code>*****</code>', '#include <iostream>
using namespace std;

int main() {
    // In hình chữ nhật 3x5 bằng ký tự *

    return 0;
}', '*****
*****
*****', 'In ra 3 dòng, mỗi dòng là chuỗi \', '["cout", "*****", "endl"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-02', 'Tính chu vi hình tròn', 'Cơ bản', 'easy', 100, 'Khai báo hằng số <code>const double PI = 3.14;</code> và biến bán kính <code>double r = 5.0;</code>. Tính chu vi hình tròn (C = 2 * PI * r) và in ra màn hình theo định dạng: <code>Chu vi: [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    const double PI = 3.14;
    double r = 5.0;

    // Tính chu vi và in kết quả

    return 0;
}', 'Chu vi: 31.4', 'Dùng công thức chuVi = 2 * PI * r; và in ra cout << \', '["const", "pi", "double", "chu vi", "cout"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-02', 'Tính diện tích hình chữ nhật', 'Vận dụng', 'medium', 100, 'Khai báo chiều dài <code>int dai = 12;</code> và chiều rộng <code>int rong = 7;</code>. Tính chu vi P và diện tích S của hình chữ nhật, sau đó in ra màn hình:<br>Dòng 1: <code>Chu vi: [P]</code><br>Dòng 2: <code>Dien tich: [S]</code>', '#include <iostream>
using namespace std;

int main() {
    int dai = 12;
    int rong = 7;

    // Tính chu vi và diện tích rồi in ra

    return 0;
}', 'Chu vi: 38
Dien tich: 84', 'Chu vi = (dai + rong) * 2; Diện tích = dai * rong;', '["dai", "rong", "chu vi", "dien tich", "cout"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-02', 'Quy đổi giây sang giờ, phút, giây', 'Thử thách', 'hard', 100, 'Khai báo biến tổng số giây <code>int totalSeconds = 3675;</code>. Sử dụng các phép toán số học chia lấy nguyên và chia lấy dư để quy đổi ra số giờ, phút, giây và in ra dạng:<br><code>1 gio 1 phut 15 giay</code>', '#include <iostream>
using namespace std;

int main() {
    int totalSeconds = 3675;

    // Tính gio, phut, giay và in ra màn hình

    return 0;
}', '1 gio 1 phut 15 giay', 'gio = totalSeconds / 3600; phut = (totalSeconds % 3600) / 60; giay = totalSeconds % 60;', '["totalseconds", "gio", "phut", "giay", "%"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-03', 'Tính tổng 2 số từ bàn phím', 'Cơ bản', 'easy', 100, 'Nhập vào 2 số nguyên <code>a</code> và <code>b</code> từ bàn phím bằng <code>cin</code>. In ra tổng của chúng theo định dạng:<br><code>Tong = [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và in Tong = a + b

    return 0;
}', 'Tong = 15', 'Sử dụng cin >> a >> b; sau đó cout << \', '["cin", "cout", "tong", "a", "b"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-03', 'Tính tiền mua hàng có thuế VAT', 'Vận dụng', 'medium', 100, 'Nhập vào số lượng mua <code>int sl;</code> và đơn giá <code>double donGia;</code>. Tính tổng tiền trước thuế (tienGoc = sl * donGia) và tổng thanh toán khi cộng thêm thuế VAT 10% (tongTien = tienGoc * 1.1). In ra:<br><code>Thanh toan: [tongTien]</code>', '#include <iostream>
using namespace std;

int main() {
    int sl;
    double donGia;
    // Nhập sl và donGia, tính tiền kèm VAT 10%

    return 0;
}', 'Thanh toan: 110', 'Nhập cin >> sl >> donGia; tính tongTien = sl * donGia * 1.1; và in ra.', '["cin", "cout", "thanh toan", "dongia", "sl"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-03', 'Tính điểm trung bình 3 môn', 'Thử thách', 'hard', 100, 'Nhập vào 3 số thực điểm Toán, Văn, Anh từ bàn phím. Tính điểm trung bình cộng của 3 môn và in ra theo định dạng:<br><code>Diem trung binh: [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    double toan, van, anh;
    // Nhập điểm 3 môn và tính trung bình cộng

    return 0;
}', 'Diem trung binh: 8.5', 'Dùng kiểu double cho toan, van, anh và tính dtb = (toan + van + anh) / 3.0;', '["cin", "cout", "diem trung binh", "toan", "van", "anh"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-04', 'Kiểm tra số chẵn lẻ bằng toán tử dư', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên <code>n</code>. Sử dụng toán tử chia lấy phần dư <code>%</code> để kiểm tra. Nếu n chẵn in ra <code>Chan</code>, nếu lẻ in ra <code>Le</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và kiểm tra chẵn/lẻ bằng toán tử %

    return 0;
}', 'Chan', 'Dùng điều kiện n % 2 == 0 để kiểm tra chẵn lẻ.', '["%", "cin", "cout", "chan", "le"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-04', 'Kiểm tra khoảng giá trị và chia hết', 'Vận dụng', 'medium', 100, 'Nhập vào số nguyên <code>x</code>. Dùng toán tử logic <code>&&</code> để kiểm tra xem x có nằm trong đoạn [10, 100] VÀ đồng thời chia hết cho 5 hay không. Nếu thỏa mãn in <code>Hop le</code>, ngược lại in <code>Khong hop le</code>.', '#include <iostream>
using namespace std;

int main() {
    int x;
    // Nhập x và kiểm tra bằng toán tử && và %

    return 0;
}', 'Hop le', 'Biểu thức: (x >= 10 && x <= 100 && x % 5 == 0)', '["&&", "%", "cin", "hop le", "khong hop le"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-04', 'Hoán vị 2 số không dùng biến trung gian', 'Thử thách', 'hard', 100, 'Nhập vào 2 số nguyên <code>a</code> và <code>b</code>. Chỉ sử dụng các phép toán số học cộng (+) và trừ (-) để đổi chỗ giá trị của a và b (không khai báo thêm biến thứ 3), sau đó in ra dạng:<br><code>a = [gia tri], b = [gia tri]</code>', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và hoán vị bằng toán tử + -

    return 0;
}', 'a = 20, b = 10', 'Cách làm: a = a + b; b = a - b; a = a - b;', '["cin", "cout", "a =", "b ="]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-05', 'Tìm số lớn nhất trong 2 số', 'Cơ bản', 'easy', 100, 'Nhập vào 2 số nguyên <code>a</code> và <code>b</code>. Dùng cấu trúc <code>if - else</code> để tìm và in ra số lớn hơn.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và dùng if-else tìm số lớn hơn

    return 0;
}', 'So lon nhat: 25', 'if (a > b) cout << \', '["if", "else", "cin", "cout"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-05', 'Xếp loại học lực học sinh', 'Vận dụng', 'medium', 100, 'Nhập điểm trung bình <code>dtb</code> (thang 10). Sử dụng <code>if - else if - else</code> để xếp loại:<br>• dtb >= 8.0: in <code>Gioi</code><br>• dtb >= 6.5: in <code>Kha</code><br>• dtb >= 5.0: in <code>Trung binh</code><br>• còn lại: in <code>Yeu</code>', '#include <iostream>
using namespace std;

int main() {
    double dtb;
    // Nhập dtb và xếp loại học lực

    return 0;
}', 'Gioi', 'Sắp xếp thứ tự kiểm tra từ cao xuống thấp: >= 8.0 -> >= 6.5 -> >= 5.0 -> else.', '["if", "else if", "gioi", "kha", "trung binh", "yeu"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-05', 'Kiểm tra và phân loại tam giác', 'Thử thách', 'hard', 100, 'Nhập 3 cạnh <code>a, b, c</code> của tam giác (số nguyên dương). Kiểm tra xem có tạo thành tam giác hợp lệ không (tổng 2 cạnh bất kỳ lớn hơn cạnh còn lại). Nếu hợp lệ: in <code>Tam giac deu</code> nếu 3 cạnh bằng nhau, <code>Tam giac vuong</code> nếu thỏa định lý Pytago, hoặc <code>Tam giac thuong</code>. Nếu không hợp lệ in <code>Khong phai tam giac</code>.', '#include <iostream>
using namespace std;

int main() {
    int a, b, c;
    // Nhập a, b, c và phân loại tam giác

    return 0;
}', 'Tam giac vuong', 'Điều kiện tam giác: a+b>c && a+c>b && b+c>a. Vuông: a*a + b*b == c*c (hoặc các hoán vị).', '["if", "else", "tam giac", "cin", "cout"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-06', 'Đọc thứ trong tuần', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên từ 2 đến 8. Sử dụng <code>switch - case</code> để in ra: 2: <code>Thu hai</code>, 3: <code>Thu ba</code>, ..., 8: <code>Chu nhat</code>. Nếu ngoài phạm vi in <code>Khong hop le</code>.', '#include <iostream>
using namespace std;

int main() {
    int day;
    // Nhập day và dùng switch-case để in thứ

    return 0;
}', 'Thu hai', 'Dùng switch(day) với các case 2, 3, 4, 5, 6, 7, 8 và default.', '["switch", "case", "break", "thu hai", "chu nhat"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-06', 'Máy tính đơn giản 4 phép toán', 'Vận dụng', 'medium', 100, 'Nhập vào 2 số thực <code>a, b</code> và 1 ký tự phép toán <code>char op;</code> (+, -, *, /). Dùng <code>switch(op)</code> để tính và in kết quả theo dạng <code>Ket qua = [gia tri]</code>.', '#include <iostream>
using namespace std;

int main() {
    double a, b;
    char op;
    // Nhập a, op, b và dùng switch tính kết quả

    return 0;
}', 'Ket qua = 15', 'Nhập cin >> a >> op >> b; dùng switch(op) cho ''+'', ''-'', ''*'', ''/''.', '["switch", "case", "op", "ket qua", "break"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-06', 'Đếm số ngày trong tháng', 'Thử thách', 'hard', 100, 'Nhập vào tháng <code>m</code> (1-12) và năm <code>y</code>. Dùng <code>switch(m)</code> để in ra số ngày trong tháng. Tháng 1, 3, 5, 7, 8, 10, 12 có 31 ngày; tháng 4, 6, 9, 11 có 30 ngày; tháng 2 có 29 ngày nếu năm nhuận hoặc 28 ngày nếu năm không nhuận.', '#include <iostream>
using namespace std;

int main() {
    int m, y;
    // Nhập m, y và in ra số ngày của tháng

    return 0;
}', '31 ngay', 'Gộp các case có cùng số ngày lại với nhau. Tháng 2 kiểm tra (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0)).', '["switch", "case", "break", "ngay", "cin"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-07', 'Tính tổng dãy số 1 đến N', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên dương <code>n</code>. Dùng vòng lặp <code>for</code> để tính tổng <code>S = 1 + 2 + ... + n</code> và in ra dạng <code>Tong = [S]</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng vòng lặp for tính tổng S

    return 0;
}', 'Tong = 55', 'Khởi tạo int sum = 0; chạy for (int i = 1; i <= n; i++) sum += i;', '["for", "cin", "cout", "tong ="]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-07', 'In bảng cửu chương của số K', 'Vận dụng', 'medium', 100, 'Nhập vào số nguyên <code>k</code> (1 <= k <= 9). Dùng vòng lặp <code>for</code> in ra bảng cửu chương của k từ 1 đến 10 theo định dạng mỗi dòng:<br><code>k x i = [k * i]</code>', '#include <iostream>
using namespace std;

int main() {
    int k;
    // Nhập k và in bảng nhân từ 1 đến 10

    return 0;
}', '5 x 1 = 5
5 x 2 = 10
5 x 3 = 15', 'Chạy vòng lặp for (int i = 1; i <= 10; i++) và in cout << k << \', '["for", "cin", "cout", "x", "="]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-07', 'Tính giai thừa N!', 'Thử thách', 'hard', 100, 'Nhập vào số nguyên dương <code>n</code> (1 <= n <= 15). Dùng kiểu <code>long long</code> và vòng lặp <code>for</code> để tính <code>n! = 1 * 2 * ... * n</code> và in ra: <code>Giai thua: [kq]</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và tính n! bằng vòng lặp for

    return 0;
}', 'Giai thua: 120', 'Khởi tạo long long fact = 1; for (int i = 1; i <= n; i++) fact *= i;', '["for", "long long", "giai thua", "cin", "cout"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-08', 'Đảo ngược số nguyên dương', 'Cơ bản', 'easy', 100, 'Nhập vào số nguyên dương <code>n</code>. Sử dụng vòng lặp <code>while</code> để in ra các chữ số của n theo thứ tự đảo ngược (ví dụ n = 123 in ra <code>321</code>).', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng while in đảo ngược

    return 0;
}', '321', 'while (n > 0) { cout << n % 10; n /= 10; }', '["while", "%", "/", "cin", "cout"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-08', 'Đếm số chữ số và tính tổng các chữ số', 'Vận dụng', 'medium', 100, 'Nhập số nguyên dương <code>n</code>. Dùng vòng lặp <code>while</code> đếm xem n có bao nhiêu chữ số và tổng các chữ số của n là bao nhiêu. In ra:<br><code>So chu so: [count]</code><br><code>Tong chu so: [sum]</code>', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và tính số chữ số và tổng các chữ số

    return 0;
}', 'So chu so: 4
Tong chu so: 10', 'Khởi tạo count = 0, sum = 0; while (n > 0) { sum += n % 10; count++; n /= 10; }', '["while", "so chu so", "tong chu so", "%", "/"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-08', 'Tìm ước chung lớn nhất (UCLN)', 'Thử thách', 'hard', 100, 'Nhập vào 2 số nguyên dương <code>a</code> và <code>b</code>. Sử dụng thuật toán Euclid với vòng lặp <code>while</code> để tìm và in ra: <code>UCLN = [gia tri]</code>.', '#include <iostream>
using namespace std;

int main() {
    int a, b;
    // Nhập a, b và tìm UCLN bằng thuật toán Euclid

    return 0;
}', 'UCLN = 6', 'while (b != 0) { int r = a % b; a = b; b = r; } UCLN chính là a.', '["while", "ucln", "%", "cin", "cout"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-09', 'In các số chẵn dùng lệnh continue', 'Cơ bản', 'easy', 100, 'Duyệt vòng lặp for từ 1 đến 20. Nếu gặp số lẻ, hãy dùng lệnh <code>continue</code> để bỏ qua. Chỉ in ra các số chẵn cách nhau bởi dấu cách.', '#include <iostream>
using namespace std;

int main() {
    // Duyệt từ 1 đến 20, dùng continue bỏ qua số lẻ

    return 0;
}', '2 4 6 8 10 12 14 16 18 20', 'if (i % 2 != 0) continue; cout << i << \', '["for", "continue", "cout", "%"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-09', 'Tìm số đầu tiên chia hết cho 7', 'Vận dụng', 'medium', 100, 'Nhập số nguyên <code>n</code>. Bắt đầu từ <code>n + 1</code>, duyệt các số tăng dần. Khi tìm được số đầu tiên chia hết cho 7, in số đó ra và dùng lệnh <code>break</code> để thoát ngay khỏi vòng lặp.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và dùng break khi tìm thấy số chia hết cho 7

    return 0;
}', '14', 'while (true) { n++; if (n % 7 == 0) { cout << n; break; } }', '["break", "% 7", "cout", "cin"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-09', 'Kiểm tra số nguyên tố tối ưu với break', 'Thử thách', 'hard', 100, 'Nhập số nguyên dương <code>n</code> (n > 1). Dùng vòng lặp kiểm tra từ 2 đến căn bậc hai của n (hoặc n/2). Nếu gặp bất kỳ ước số nào, đặt cờ hiệu và dùng <code>break</code> để dừng. In ra <code>Nguyen to</code> hoặc <code>Hop so</code>.', '#include <iostream>
using namespace std;

int main() {
    int n;
    // Nhập n và kiểm tra số nguyên tố dùng break

    return 0;
}', 'Nguyen to', 'bool isPrime = true; for (int i = 2; i * i <= n; i++) { if (n % i == 0) { isPrime = false; break; } }', '["break", "for", "nguyen to", "hop so", "cin"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-10', 'Viết hàm tính lũy thừa', 'Cơ bản', 'easy', 100, 'Viết hàm <code>long long luyThua(int coSo, int soMu)</code> trả về giá trị coSo mũ soMu. Trong hàm <code>main()</code>, nhập <code>a, b</code> và gọi hàm để in kết quả.', '#include <iostream>
using namespace std;

// Định nghĩa hàm luyThua tại đây

int main() {
    int a, b;
    cin >> a >> b;
    // Gọi hàm luyThua và in kết quả

    return 0;
}', '32', 'Duyệt vòng lặp nhân soMu lần giá trị coSo và return kết quả.', '["luythua", "long long", "return", "main"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-10', 'Hàm kiểm tra số chính phương', 'Vận dụng', 'medium', 100, 'Viết hàm <code>bool laChinhPhuong(int n)</code> trả về <code>true</code> nếu n là số chính phương (căn bậc 2 là số nguyên), ngược lại trả về <code>false</code>. Trong <code>main()</code> nhập n và in <code>Chinh phuong</code> hoặc <code>Khong chinh phuong</code>.', '#include <iostream>
#include <cmath>
using namespace std;

// Viết hàm bool laChinhPhuong(int n)

int main() {
    int n;
    cin >> n;
    // Gọi hàm và in kết luận

    return 0;
}', 'Chinh phuong', 'int can = sqrt(n); return can * can == n;', '["bool", "lachinhphuong", "sqrt", "return"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-10', 'Hàm hoán vị sử dụng tham chiếu', 'Thử thách', 'hard', 100, 'Viết hàm <code>void hoanDoi(int &x, int &y)</code> sử dụng tham chiếu <code>&</code> để tráo đổi giá trị 2 biến. Trong hàm <code>main()</code>, nhập 2 số a và b, gọi hàm <code>hoanDoi(a, b);</code> rồi in kết quả a và b sau khi hoán vị.', '#include <iostream>
using namespace std;

// Viết hàm void hoanDoi(int &x, int &y)

int main() {
    int a, b;
    cin >> a >> b;
    // Gọi hàm hoanDoi và in ra a, b

    return 0;
}', '20 10', 'Dùng toán tử tham chiếu &: void hoanDoi(int &x, int &y) { int temp = x; x = y; y = temp; }', '["&", "hoandoi", "temp", "void", "main"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-11', 'Tính số Fibonacci thứ n (Cơ bản)', 'Cơ bản', 'easy', 100, 'Viết hàm đệ quy fibo(int n) tính số Fibonacci thứ n (fibo(1)=1, fibo(2)=1, fibo(n) = fibo(n-1) + fibo(n-2)). Nhập n và in kết quả. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-11', 'Vận dụng logic: Nạp chồng hàm & Đệ quy (Recursion)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Nạp chồng hàm & Đệ quy (Recursion) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-11', 'Thử thách mở rộng: Nạp chồng hàm & Đệ quy (Recursion)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Nạp chồng hàm & Đệ quy (Recursion).', '#include <iostream>
using namespace std;

// Viet ham de quy fibo tai day

int main() {
    int n;
    cin >> n;

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-12', 'Tính tổng mảng n phần tử (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập số nguyên n, sau đó nhập n số nguyên vào mảng. Tính và in ra tổng của tất cả các phần tử trong mảng. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-12', 'Vận dụng logic: Mảng một chiều (1D Array)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Mảng một chiều (1D Array) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-12', 'Thử thách mở rộng: Mảng một chiều (1D Array)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Mảng một chiều (1D Array).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];

    // Nhap mang va tinh tong

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-13', 'Tìm số nhỏ nhất trong mảng (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập mảng n số nguyên. Tìm và in ra phần tử có giá trị nhỏ nhất (Min) trong mảng. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-13', 'Vận dụng logic: Các thuật toán mảng cơ bản', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Các thuật toán mảng cơ bản để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-13', 'Thử thách mở rộng: Các thuật toán mảng cơ bản', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Các thuật toán mảng cơ bản.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[100];
    // Nhap mang va tim min

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-14', 'Đếm số ký tự in hoa (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập vào một chuỗi ký tự s. Đếm và in ra số lượng ký tự chữ in hoa (''A'' đến ''Z'') có trong chuỗi. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-14', 'Vận dụng logic: Chuỗi ký tự std::string', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Chuỗi ký tự std::string để giải quyết bài toán tính toán thực tế.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-14', 'Thử thách mở rộng: Chuỗi ký tự std::string', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Chuỗi ký tự std::string.', '#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    cin >> s;

    // Dem so ky tu in hoa trong s

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-15', 'Tính tổng ma trận vuông (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập số nguyên n (kích thước ma trận n x n) và các phần tử của ma trận. Tính và in ra tổng tất cả các phần tử. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-15', 'Vận dụng logic: Mảng hai chiều (Ma trận 2D)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Mảng hai chiều (Ma trận 2D) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-15', 'Thử thách mở rộng: Mảng hai chiều (Ma trận 2D)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Mảng hai chiều (Ma trận 2D).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int a[50][50];

    // Nhap ma tran va tinh tong tat ca phan tu

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-16', 'Gấp đôi giá trị qua con trỏ (Cơ bản)', 'Cơ bản', 'easy', 100, 'Khai báo số nguyên n nhập từ bàn phím. Sử dụng con trỏ trỏ tới n để nhân đôi giá trị của n và in kết quả n ra màn hình. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-16', 'Vận dụng logic: Con trỏ (Pointers) trong C++', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Con trỏ (Pointers) trong C++ để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-16', 'Thử thách mở rộng: Con trỏ (Pointers) trong C++', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Con trỏ (Pointers) trong C++.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Dung con tro de nhan doi n va in ra

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-17', 'Mảng động n phần tử (Cơ bản)', 'Cơ bản', 'easy', 100, 'Nhập số nguyên n. Sử dụng toán tử new để cấp phát mảng n số nguyên, tính tổng mảng, sau đó giải phóng mảng bằng delete[] và in tổng ra màn hình. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-17', 'Vận dụng logic: Cấp phát bộ nhớ động (new & delete)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Cấp phát bộ nhớ động (new & delete) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-17', 'Thử thách mở rộng: Cấp phát bộ nhớ động (new & delete)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Cấp phát bộ nhớ động (new & delete).', '#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    // Cap phat dong, nhap lieu, tinh tong va delete[]

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-18', 'Định nghĩa struct Phân số (Cơ bản)', 'Cơ bản', 'easy', 100, 'Tạo struct PhanSo gồm 2 thành phần tử số (tu) và mẫu số (mau). Nhập 1 phân số và in ra theo định dạng tu/mau. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-18', 'Vận dụng logic: Kiểu dữ liệu cấu trúc (struct)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Kiểu dữ liệu cấu trúc (struct) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-18', 'Thử thách mở rộng: Kiểu dữ liệu cấu trúc (struct)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Kiểu dữ liệu cấu trúc (struct).', '#include <iostream>
using namespace std;

// Dinh nghia struct PhanSo tai day

int main() {
    // Nhap va in phan so

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-19', 'Xây dựng lớp Hình Tròn (Cơ bản)', 'Cơ bản', 'easy', 100, 'Tạo class HinhTron có thuộc tính banKinh (private), phương thức setBanKinh(double r) và tinhChuVi() (chu vi = 2 * 3.14 * r). Tạo đối tượng với r = 4 và in chu vi. Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-19', 'Vận dụng logic: Lớp (Class) & Đối tượng (Object)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Lớp (Class) & Đối tượng (Object) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-19', 'Thử thách mở rộng: Lớp (Class) & Đối tượng (Object)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Lớp (Class) & Đối tượng (Object).', '#include <iostream>
using namespace std;

// Dinh nghia class HinhTron

int main() {
    // Khoi tao doi tuong va in chu vi

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-1', 'lesson-20', 'Kế thừa lớp Động vật (Cơ bản)', 'Cơ bản', 'easy', 100, 'Tạo lớp DongVat có phương thức keu() in ''Dong vat keu''. Tạo lớp Meo kế thừa DongVat ghi đè keu() in ''Meo meo''. Khởi tạo đối tượng Meo và gọi phương thức keu(). Hãy áp dụng các câu lệnh nền tảng của bài học này.', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 'Thanh cong', 'Áp dụng cú pháp lý thuyết đã học ở phần trên.', '["cout", "main", "return 0"]', 1);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-2', 'lesson-20', 'Vận dụng logic: Constructor, Destructor & Kế thừa (OOP)', 'Vận dụng', 'medium', 100, 'Áp dụng kiến thức bài Constructor, Destructor & Kế thừa (OOP) để giải quyết bài toán tính toán thực tế.', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 'Ket qua dung', 'Kết hợp câu lệnh điều khiển hoặc vòng lặp để xử lý logic.', '["cin", "cout", "main"]', 2);
INSERT OR REPLACE INTO exercises (id, lesson_id, title, level, difficulty, points, description, starter_code, expected_output, hint, test_keywords, order_num) VALUES ('ex-3', 'lesson-20', 'Thử thách mở rộng: Constructor, Destructor & Kế thừa (OOP)', 'Thử thách', 'hard', 100, 'Tối ưu hóa mã nguồn và xử lý các trường hợp nâng cao cho chuyên đề Constructor, Destructor & Kế thừa (OOP).', '#include <iostream>
using namespace std;

// Dinh nghia lop DongVat va lop Meo ke thua

int main() {
    // Khoi tao Meo va goi keu()

    return 0;
}', 'Chinh xac', 'Kiểm tra kỹ các trường hợp giá trị biên đặc biệt.', '["main", "return"]', 3);

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `progress` (1 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO progress (id, user_id, lesson_id, status, code, score, comprehension_level, completed_at, updated_at) VALUES ('prog-1791905926.607001', 'user-student', 'lesson-01', 'in_progress', '#include <iostream>
using namespace std;

int main() {
    Cout << "Hello C++ Academy!";

    return 0;
}', 25, '', NULL, '2026-10-13T22:38:46.602990');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `submissions` (12 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-1791187503.96887', 'user-student', 'lesson-01', 'ex-1', '
    #include <iostream>
    using namespace std;
    int main() {
        cout << "Hello C++ Academy!" << endl;
        return 0;
    }
    ', 'Hello C++ Academy!
', 1, 100, 173.69, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Kết quả đầu ra chính xác 100% khớp với đề bài: \"Hello C++ Academy!\".", "Vận dụng tốt các từ khóa và cú pháp cốt lõi: cout, hello c++ academy, return 0, #include.", "Có lệnh ''return 0;'' chuẩn mực kết thúc hàm main()."]', '2026-10-05T15:05:03.968870');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-1791189193.573786', 'user-student', 'lesson-01', 'ex-1', '
    #include <iostream>
    using namespace std;
    int main() {
        cout << "Hello C++ Academy!" << endl;
        return 0;
    }
    ', 'Hello C++ Academy!
', 1, 100, 260.91, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Kết quả đầu ra chính xác 100% khớp với đề bài: \"Hello C++ Academy!\".", "Vận dụng tốt các từ khóa và cú pháp cốt lõi: cout, hello c++ academy, return 0, #include.", "Có lệnh ''return 0;'' chuẩn mực kết thúc hàm main()."]', '2026-10-05T15:33:13.573786');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-5e8a5387', 'user-admin', 'lesson-01', 'ex-01-easy', '#include <iostream>
using namespace std;
int main() {
    cout << "Xin chào C++" << endl;
    return 0;
}', 'Xin chÃ o C++
', 1, 95, 178.58, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Chương trình thực thi trơn tru và trả về mã kết thúc 0.", "Có lệnh ''return 0;'' chuẩn mực kết thúc hàm main()."]', '2026-10-05T22:03:39.123962');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-62e2dae1', 'user-admin', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;
int main() {
    cout << "Xin chào C++" << endl;
    return 0;
}', 'Xin chÃ o C++
', 0, 45, 202.63, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Có lệnh ''return 0;'' chuẩn mực kết thúc hàm main().", "Vượt qua 0/1 bộ test. Cần kiểm tra lại các trường hợp biên hoặc định dạng xuất.", "Cần áp dụng thêm các cú pháp trọng tâm của bài: hello c++ academy."]', '2026-10-05T22:06:17.212864');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-4fe7b4b4', 'user-admin', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;
int main() {
    cout << "Hello C++ Academy!" << endl;
    return 0;
}', 'Hello C++ Academy!
', 1, 100, 246.37, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Vượt qua xuất sắc toàn bộ 1/1 bộ test kiểm thử.", "Vận dụng tốt các từ khóa trọng tâm: cout, hello c++ academy, return 0, #include.", "Có lệnh ''return 0;'' chuẩn mực kết thúc hàm main()."]', '2026-10-05T22:09:17.210553');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-065d1b3c', 'user-student', 'lesson-01', 'ex-2', '#include <iostream>
using namespace std;

int main() {
    cout << "Ho va ten: le Trung Hau";
cout << "Khoa hoc: Lap trinh C++ co ban";
cout << "Muc tieu: Lam chu C++ trong 30 ngay";

    return 0;
}', 'Ho va ten: le Trung HauKhoa hoc: Lap trinh C++ co banMuc tieu: Lam chu C++ trong 30 ngay', 0, 46, 159.37, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Vận dụng tốt các từ khóa trọng tâm: cout, ho va ten, khoa hoc, muc tieu.", "Có lệnh `return 0;` chuẩn mực kết thúc hàm main().", "Khai báo thư viện `<iostream>` chuẩn.", "Kết thúc hàm `main()` với `return 0;` chuẩn mực.", "Vượt qua 0/1 bộ test. Cần kiểm tra lại các trường hợp biên hoặc định dạng xuất."]', '2026-10-05T23:21:29.804578');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-3a01502a', 'user-student', 'lesson-01', 'ex-2', '#include <iostream>
using namespace std;

int main() {
int a, b, c
    cout << "Ho va ten:"<< a;
cout << "Khoa hoc:"<< b;
cout << "Muc tieu:"<< c;

    return 0;
}', '', 0, 25, 0.0, '["Đã có nỗ lực triển khai cấu trúc chương trình C++.", "Lỗi biên dịch: solution.cpp: In function ''int main()'':", "Rà soát lại cú pháp đóng mở ngoặc `{ }` và khai báo thư viện `#include <iostream>`."]', '2026-10-05T23:23:35.338480');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-1454cdb0', 'user-student', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;

int main() {
    cuot << "Hello C++ Academy! ";

    return 0;
}', '', 0, 25, 0.0, '["Đã có nỗ lực triển khai cấu trúc chương trình C++.", "Lỗi biên dịch: solution.cpp: In function ''int main()'':", "Rà soát lại cú pháp đóng mở ngoặc `{ }` và khai báo thư viện `#include <iostream>`."]', '2026-10-06T22:52:45.404279');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-cc05ea91', 'user-student', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;

int main() {
    cuot << "Hello C++ Academy! ";

    return 0;
}', '', 0, 25, 0.0, '["Đã có nỗ lực triển khai cấu trúc chương trình C++.", "Lỗi biên dịch: solution.cpp: In function ''int main()'':", "Rà soát lại cú pháp đóng mở ngoặc `{ }` và khai báo thư viện `#include <iostream>`."]', '2026-10-06T22:53:03.510438');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-33b25981', 'user-student', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;

int main() {
    cuot << "Hello C++ Academy! ";

    return 0;
}', '', 0, 25, 0.0, '["Đã có nỗ lực triển khai cấu trúc chương trình C++.", "Lỗi biên dịch: solution.cpp: In function ''int main()'':", "Rà soát lại cú pháp đóng mở ngoặc `{ }` và khai báo thư viện `#include <iostream>`."]', '2026-10-06T22:53:12.314828');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-495bd99d', 'user-student', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;

int main() {
    cout << "Hello C++ Academy! ";

    return 0;
}', 'Hello C++ Academy! ', 1, 100, 141.73, '["Mã nguồn biên dịch thành công không có lỗi cú pháp.", "Vượt qua xuất sắc toàn bộ 1/1 bộ test kiểm thử.", "Vận dụng tốt các từ khóa trọng tâm: cout, hello c++ academy, return 0, #include.", "Có lệnh `return 0;` chuẩn mực kết thúc hàm main().", "Khai báo thư viện `<iostream>` chuẩn.", "Kết thúc hàm `main()` với `return 0;` chuẩn mực.", "Mã nguồn tương thích tốt với chuẩn học thuật VNOI Wiki (Con trỏ trong C/C++)."]', '2026-10-06T22:55:30.682358');
INSERT OR REPLACE INTO submissions (id, user_id, lesson_id, exercise_id, code, output, passed, score, execution_time_ms, ai_feedback, submitted_at) VALUES ('sub-cd550c1a', 'user-student', 'lesson-01', 'ex-1', '#include <iostream>
using namespace std;

int main() {
    Cout << "Hello C++ Academy!";

    return 0;
}', '', 0, 25, 0.0, '["Đã có nỗ lực triển khai cấu trúc chương trình C++.", "Lỗi biên dịch: solution.cpp: In function ''int main()'':", "Rà soát lại cú pháp đóng mở ngoặc `{ }` và khai báo thư viện `#include <iostream>`."]', '2026-10-06T23:02:26.339444');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `settings` (11 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO settings (key, value) VALUES ('site_name', 'CodeLearn C++ Academy');
INSERT OR REPLACE INTO settings (key, value) VALUES ('site_tagline', 'Nền tảng Học Lập Trình C++ Chuẩn Đại Học & Olympic Tin Học');
INSERT OR REPLACE INTO settings (key, value) VALUES ('site_version', '2.5.0');
INSERT OR REPLACE INTO settings (key, value) VALUES ('compiler_default', 'g++ 13.2.0 (C++17 / C++20)');
INSERT OR REPLACE INTO settings (key, value) VALUES ('compiler_timeout_sec', '5');
INSERT OR REPLACE INTO settings (key, value) VALUES ('max_execution_time_ms', '2000');
INSERT OR REPLACE INTO settings (key, value) VALUES ('pass_score_percentage', '70');
INSERT OR REPLACE INTO settings (key, value) VALUES ('maintenance_mode', 'false');
INSERT OR REPLACE INTO settings (key, value) VALUES ('ai_mentor_model', 'CodeLearn C++ Neural Tutor (VNOI Enhanced)');
INSERT OR REPLACE INTO settings (key, value) VALUES ('allow_guest_compilation', 'true');
INSERT OR REPLACE INTO settings (key, value) VALUES ('certificate_min_score', '80');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `certificates` (2 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO certificates (id, cert_code, user_id, course_name, final_score, issued_at, verification_hash) VALUES ('c0026d03-6044-462e-afd4-7bfd53af1e1a', 'CERT-CPP-2026-57D55A', 'user-admin', 'Khóa học Lập trình C++ Toàn diện', 95, '2026-10-05T22:03:41.189453', 'd465f2adc2fd33a34898d9217701988acc3deb04c0e5a536fd46c541a40574fc');
INSERT OR REPLACE INTO certificates (id, cert_code, user_id, course_name, final_score, issued_at, verification_hash) VALUES ('953565f7-7a3f-4800-8ac7-d78ba5cfee7c', 'CERT-CPP-2026-D80E65', 'user-student', 'Khóa học Lập trình C++ Toàn diện', 100, '2026-10-05T22:12:25.901858', '0351e53e2aafcb75d68a40dcd4391d3416f073cc48a1fbad5e162a6aa1ee7f27');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `test_cases` (120 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-01-ex-1-1', 'lesson-01', 'ex-1', '', 'Hello C++ Academy!', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-01-ex-1-2', 'lesson-01', 'ex-1', '', 'Hello C++ Academy!', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-01-ex-2-1', 'lesson-01', 'ex-2', '', 'Ho va ten: Hoc vien CodeLearn
Khoa hoc: Lap trinh C++ co ban
Muc tieu: Lam chu C++ trong 30 ngay', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-01-ex-2-2', 'lesson-01', 'ex-2', '', 'Ho va ten: Hoc vien CodeLearn
Khoa hoc: Lap trinh C++ co ban
Muc tieu: Lam chu C++ trong 30 ngay', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-01-ex-3-1', 'lesson-01', 'ex-3', '', '*****
*****
*****', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-01-ex-3-2', 'lesson-01', 'ex-3', '', '*****
*****
*****', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-02-ex-1-1', 'lesson-02', 'ex-1', '', 'Chu vi: 31.4', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-02-ex-1-2', 'lesson-02', 'ex-1', '', 'Chu vi: 31.4', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-02-ex-2-1', 'lesson-02', 'ex-2', '', 'Chu vi: 38
Dien tich: 84', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-02-ex-2-2', 'lesson-02', 'ex-2', '', 'Chu vi: 38
Dien tich: 84', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-02-ex-3-1', 'lesson-02', 'ex-3', '', '1 gio 1 phut 15 giay', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-02-ex-3-2', 'lesson-02', 'ex-3', '', '1 gio 1 phut 15 giay', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-03-ex-1-1', 'lesson-03', 'ex-1', '', 'Tong = 15', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-03-ex-1-2', 'lesson-03', 'ex-1', '', 'Tong = 15', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-03-ex-2-1', 'lesson-03', 'ex-2', '', 'Thanh toan: 110', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-03-ex-2-2', 'lesson-03', 'ex-2', '', 'Thanh toan: 110', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-03-ex-3-1', 'lesson-03', 'ex-3', '', 'Diem trung binh: 8.5', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-03-ex-3-2', 'lesson-03', 'ex-3', '', 'Diem trung binh: 8.5', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-04-ex-1-1', 'lesson-04', 'ex-1', '', 'Chan', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-04-ex-1-2', 'lesson-04', 'ex-1', '', 'Chan', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-04-ex-2-1', 'lesson-04', 'ex-2', '', 'Hop le', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-04-ex-2-2', 'lesson-04', 'ex-2', '', 'Hop le', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-04-ex-3-1', 'lesson-04', 'ex-3', '', 'a = 20, b = 10', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-04-ex-3-2', 'lesson-04', 'ex-3', '', 'a = 20, b = 10', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-05-ex-1-1', 'lesson-05', 'ex-1', '', 'So lon nhat: 25', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-05-ex-1-2', 'lesson-05', 'ex-1', '', 'So lon nhat: 25', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-05-ex-2-1', 'lesson-05', 'ex-2', '', 'Gioi', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-05-ex-2-2', 'lesson-05', 'ex-2', '', 'Gioi', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-05-ex-3-1', 'lesson-05', 'ex-3', '', 'Tam giac vuong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-05-ex-3-2', 'lesson-05', 'ex-3', '', 'Tam giac vuong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-06-ex-1-1', 'lesson-06', 'ex-1', '', 'Thu hai', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-06-ex-1-2', 'lesson-06', 'ex-1', '', 'Thu hai', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-06-ex-2-1', 'lesson-06', 'ex-2', '', 'Ket qua = 15', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-06-ex-2-2', 'lesson-06', 'ex-2', '', 'Ket qua = 15', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-06-ex-3-1', 'lesson-06', 'ex-3', '', '31 ngay', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-06-ex-3-2', 'lesson-06', 'ex-3', '', '31 ngay', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-07-ex-1-1', 'lesson-07', 'ex-1', '', 'Tong = 55', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-07-ex-1-2', 'lesson-07', 'ex-1', '', 'Tong = 55', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-07-ex-2-1', 'lesson-07', 'ex-2', '', '5 x 1 = 5
5 x 2 = 10
5 x 3 = 15', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-07-ex-2-2', 'lesson-07', 'ex-2', '', '5 x 1 = 5
5 x 2 = 10
5 x 3 = 15', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-07-ex-3-1', 'lesson-07', 'ex-3', '', 'Giai thua: 120', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-07-ex-3-2', 'lesson-07', 'ex-3', '', 'Giai thua: 120', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-08-ex-1-1', 'lesson-08', 'ex-1', '', '321', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-08-ex-1-2', 'lesson-08', 'ex-1', '', '321', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-08-ex-2-1', 'lesson-08', 'ex-2', '', 'So chu so: 4
Tong chu so: 10', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-08-ex-2-2', 'lesson-08', 'ex-2', '', 'So chu so: 4
Tong chu so: 10', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-08-ex-3-1', 'lesson-08', 'ex-3', '', 'UCLN = 6', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-08-ex-3-2', 'lesson-08', 'ex-3', '', 'UCLN = 6', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-09-ex-1-1', 'lesson-09', 'ex-1', '', '2 4 6 8 10 12 14 16 18 20', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-09-ex-1-2', 'lesson-09', 'ex-1', '', '2 4 6 8 10 12 14 16 18 20', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-09-ex-2-1', 'lesson-09', 'ex-2', '', '14', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-09-ex-2-2', 'lesson-09', 'ex-2', '', '14', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-09-ex-3-1', 'lesson-09', 'ex-3', '', 'Nguyen to', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-09-ex-3-2', 'lesson-09', 'ex-3', '', 'Nguyen to', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-10-ex-1-1', 'lesson-10', 'ex-1', '', '32', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-10-ex-1-2', 'lesson-10', 'ex-1', '', '32', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-10-ex-2-1', 'lesson-10', 'ex-2', '', 'Chinh phuong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-10-ex-2-2', 'lesson-10', 'ex-2', '', 'Chinh phuong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-10-ex-3-1', 'lesson-10', 'ex-3', '', '20 10', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-10-ex-3-2', 'lesson-10', 'ex-3', '', '20 10', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-11-ex-1-1', 'lesson-11', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-11-ex-1-2', 'lesson-11', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-11-ex-2-1', 'lesson-11', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-11-ex-2-2', 'lesson-11', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-11-ex-3-1', 'lesson-11', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-11-ex-3-2', 'lesson-11', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-12-ex-1-1', 'lesson-12', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-12-ex-1-2', 'lesson-12', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-12-ex-2-1', 'lesson-12', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-12-ex-2-2', 'lesson-12', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-12-ex-3-1', 'lesson-12', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-12-ex-3-2', 'lesson-12', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-13-ex-1-1', 'lesson-13', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-13-ex-1-2', 'lesson-13', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-13-ex-2-1', 'lesson-13', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-13-ex-2-2', 'lesson-13', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-13-ex-3-1', 'lesson-13', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-13-ex-3-2', 'lesson-13', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-14-ex-1-1', 'lesson-14', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-14-ex-1-2', 'lesson-14', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-14-ex-2-1', 'lesson-14', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-14-ex-2-2', 'lesson-14', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-14-ex-3-1', 'lesson-14', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-14-ex-3-2', 'lesson-14', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-15-ex-1-1', 'lesson-15', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-15-ex-1-2', 'lesson-15', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-15-ex-2-1', 'lesson-15', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-15-ex-2-2', 'lesson-15', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-15-ex-3-1', 'lesson-15', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-15-ex-3-2', 'lesson-15', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-16-ex-1-1', 'lesson-16', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-16-ex-1-2', 'lesson-16', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-16-ex-2-1', 'lesson-16', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-16-ex-2-2', 'lesson-16', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-16-ex-3-1', 'lesson-16', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-16-ex-3-2', 'lesson-16', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-17-ex-1-1', 'lesson-17', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-17-ex-1-2', 'lesson-17', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-17-ex-2-1', 'lesson-17', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-17-ex-2-2', 'lesson-17', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-17-ex-3-1', 'lesson-17', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-17-ex-3-2', 'lesson-17', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-18-ex-1-1', 'lesson-18', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-18-ex-1-2', 'lesson-18', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-18-ex-2-1', 'lesson-18', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-18-ex-2-2', 'lesson-18', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-18-ex-3-1', 'lesson-18', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-18-ex-3-2', 'lesson-18', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-19-ex-1-1', 'lesson-19', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-19-ex-1-2', 'lesson-19', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-19-ex-2-1', 'lesson-19', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-19-ex-2-2', 'lesson-19', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-19-ex-3-1', 'lesson-19', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-19-ex-3-2', 'lesson-19', 'ex-3', '', 'Chinh xac', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-20-ex-1-1', 'lesson-20', 'ex-1', '', 'Thanh cong', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-20-ex-1-2', 'lesson-20', 'ex-1', '', 'Thanh cong', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-20-ex-2-1', 'lesson-20', 'ex-2', '', 'Ket qua dung', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-20-ex-2-2', 'lesson-20', 'ex-2', '', 'Ket qua dung', 1, 50, 2);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-20-ex-3-1', 'lesson-20', 'ex-3', '', 'Chinh xac', 0, 50, 1);
INSERT OR REPLACE INTO test_cases (id, lesson_id, exercise_id, input_data, expected_output, is_hidden, weight_points, order_num) VALUES ('tc-lesson-20-ex-3-2', 'lesson-20', 'ex-3', '', 'Chinh xac', 1, 50, 2);

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `achievements` (6 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num) VALUES ('ach-1', 'first_lesson', 'Bắt đầu hành trình', 'Hoàn thành bài học C++ đầu tiên.', 50, 1);
INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num) VALUES ('ach-2', 'three_lessons', 'Tăng tốc kiến thức', 'Hoàn thành 3 bài học C++.', 100, 2);
INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num) VALUES ('ach-3', 'five_lessons', 'Chăm chỉ rèn luyện', 'Hoàn thành 5 bài học C++.', 150, 3);
INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num) VALUES ('ach-4', 'high_score', 'Thiện xạ C++', 'Đạt từ 90 điểm trở lên trong một bài tập.', 100, 4);
INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num) VALUES ('ach-5', 'half_way', 'Vượt qua nửa chặng', 'Hoàn thành ít nhất 10 bài học C++.', 200, 5);
INSERT OR REPLACE INTO achievements (id, code, title, description, points, order_num) VALUES ('ach-6', 'master', 'C++ Master Tinh anh', 'Hoàn thành xuất sắc toàn bộ khóa học C++.', 500, 6);

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `user_achievements` (4 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO user_achievements (user_id, achievement_id, unlocked_at) VALUES ('user-admin', 'ach-1', '2026-10-05T22:03:39.123962');
INSERT OR REPLACE INTO user_achievements (user_id, achievement_id, unlocked_at) VALUES ('user-admin', 'ach-4', '2026-10-05T22:09:17.210553');
INSERT OR REPLACE INTO user_achievements (user_id, achievement_id, unlocked_at) VALUES ('user-student', 'ach-1', '2026-10-06T22:55:30.682358');
INSERT OR REPLACE INTO user_achievements (user_id, achievement_id, unlocked_at) VALUES ('user-student', 'ach-4', '2026-10-06T22:55:30.682358');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `comments` (10 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-01', 'lesson-01', 'user-student', NULL, 'Cho em hỏi tại sao trong C++ luôn phải có hàm main() và return 0 ở cuối ạ?', '2026-03-01T08:30:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-02', 'lesson-01', 'user-admin', 'cm-01', 'Chào Trung Hậu! Hàm main() là điểm khởi đầu (entry point) của mọi chương trình C/C++. Lệnh return 0 báo cho hệ điều hành biết chương trình kết thúc trọn vẹn và an toàn nhé!', '2026-03-01T08:45:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-03', 'lesson-03', 'user-student', NULL, 'Lúc em dùng `cin >> n` rồi dùng `getline(cin, s)` thì bị trôi dòng không nhập được chuỗi, khắc phục thế nào ạ?', '2026-03-02T10:15:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-04', 'lesson-03', 'user-admin', 'cm-03', 'Lỗi kinh điển do ký tự Enter (`\n`) còn sót lại trong bộ đệm cin! Em chỉ cần thêm `cin.ignore();` ngay sau lệnh `cin >> n;` là xử lý xong ngay nhé.', '2026-03-02T10:20:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-05', 'lesson-07', 'user-student', NULL, 'Con trỏ (Pointer) và tham chiếu (Reference) khác nhau lớn nhất ở điểm nào khi truyền tham số vào hàm ạ?', '2026-03-03T14:00:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-06', 'lesson-07', 'user-admin', 'cm-05', 'Tham chiếu `int &x` bản chất là một bí danh an toàn, không thể NULL và không cần dùng toán tử `*`. Khi chỉ cần sửa trực tiếp giá trị biến thì nên ưu tiên dùng reference theo chuẩn C++ hiện đại nhé!', '2026-03-03T14:15:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-07', 'lesson-10', 'user-student', NULL, 'Trong C++, Struct và Class khác nhau cơ bản nhất là gì vậy thầy?', '2026-03-04T09:00:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-08', 'lesson-10', 'user-admin', 'cm-07', 'Điểm khác biệt duy nhất là phạm vi truy cập mặc định: các thuộc tính của Struct mặc định là `public`, còn của Class mặc định là `private`.', '2026-03-04T09:10:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-09', 'lesson-16', 'user-student', NULL, 'Khi sắp xếp bằng `std::sort`, làm sao để viết hàm so sánh (Comparator) giảm dần gọn nhất ạ?', '2026-03-05T16:20:00');
INSERT OR REPLACE INTO comments (id, lesson_id, user_id, parent_id, content, created_at) VALUES ('cm-10', 'lesson-16', 'user-admin', 'cm-09', 'Em có thể dùng Lambda biểu thức hiện đại: `sort(a.begin(), a.end(), [](int x, int y){ return x > y; });` hoặc dùng `greater<int>()` trong `<functional>` nhé!', '2026-03-05T16:30:00');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `activity_logs` (15 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('10eb7fac-0ded-4445-9070-23a75f2d7e05', 'user-admin', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-01-easy, Score: 95, Passed: True', '2026-10-05T22:03:39.123962');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('1022ebf3-bba9-4bc0-9b6f-b1f590f2df29', 'user-admin', 'claim_certificate', '127.0.0.1', 'CertCode: CERT-CPP-2026-57D55A, Score: 95', '2026-10-05T22:03:41.189453');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('95535902-2e0d-449f-990f-6ec8cefe4953', 'user-admin', 'post_comment', '127.0.0.1', 'Lesson: lesson-01, CommentId: cmt-95f70a75', '2026-10-05T22:03:45.334694');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('f61796c5-49e1-4ab8-bb3e-016a8d3c1d94', 'user-admin', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 45, Passed: False', '2026-10-05T22:06:17.212864');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('9a21d0ff-6950-49bd-bdca-991da4c2913d', 'user-admin', 'post_comment', '127.0.0.1', 'Lesson: lesson-01, CommentId: cmt-2a411671', '2026-10-05T22:06:23.420455');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('8081ff25-9c41-4b85-9ae2-7c0fb56fd72b', 'user-admin', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 100, Passed: True', '2026-10-05T22:09:17.210553');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('700b323a-6983-4487-8074-7011e2369319', 'user-admin', 'post_comment', '127.0.0.1', 'Lesson: lesson-01, CommentId: cmt-7f345c9f', '2026-10-05T22:09:23.435363');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('648db533-1397-41f9-ac4f-5a8123aeae84', 'user-student', 'claim_certificate', '127.0.0.1', 'CertCode: CERT-CPP-2026-D80E65, Score: 100', '2026-10-05T22:12:25.901858');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('2d6af8da-c189-44a3-b2d3-4bca8e56b0f7', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-2, Score: 46, Passed: False', '2026-10-05T23:21:29.804578');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('9f8ce04f-0173-4892-afeb-1c4ddc6aab57', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-2, Score: 25, Passed: False', '2026-10-05T23:23:35.338480');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('da732c2a-9809-42f8-8102-553aa78bbfc4', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 25, Passed: False', '2026-10-06T22:52:45.404279');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('d4fddf18-8693-4147-b647-c0769f2b4ee1', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 25, Passed: False', '2026-10-06T22:53:03.510438');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('b405c0e6-5f7f-4437-b9d0-c011316de8ce', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 25, Passed: False', '2026-10-06T22:53:12.314828');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('0a04b0ad-fbe3-4ba2-8406-df6d0577e04f', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 100, Passed: True', '2026-10-06T22:55:30.682358');
INSERT OR REPLACE INTO activity_logs (id, user_id, action, ip_address, details, created_at) VALUES ('3308ec82-9fbf-4b36-9981-32d800eda999', 'user-student', 'submit_exercise', '127.0.0.1', 'Lesson: lesson-01, Ex: ex-1, Score: 25, Passed: False', '2026-10-06T23:02:26.339444');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `ai_chat_messages` (4 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at) VALUES ('msg-01', 'user-student', 'user', 'Chào AI Mentor, em là học viên mới bắt đầu học C++. Em nên đi theo lộ trình như thế nào để vững nền tảng nhất?', 'tutor', '', 'lesson-01', '2026-03-01T08:00:00');
INSERT OR REPLACE INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at) VALUES ('msg-02', 'user-student', 'assistant', 'Chào Trung Hậu! Rất vui được đồng hành cùng bạn trên chặng đường chinh phục C++. Lộ trình tối ưu tại CodeLearn C++ Academy gồm 4 chặng:
1. Nền tảng cú pháp và luồng điều khiển (Bài 1-6)
2. Mảng, Con trỏ và Chuỗi ký tự (Bài 7-10)
3. Cấu trúc dữ liệu và Hàm đệ quy (Bài 11-15)
4. Thư viện STL và Lập trình hướng đối tượng OOP (Bài 16-20).
Hãy bắt đầu thực hành ngay từ Bài 1 và làm trọn vẹn 3 bài tập mỗi chuyên đề nhé!', 'tutor', '', 'lesson-01', '2026-03-01T08:00:05');
INSERT OR REPLACE INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at) VALUES ('msg-03', 'user-student', 'user', 'Cho em xin ví dụ về cách viết hàm hoán vị (swap) 2 số bằng con trỏ và tham chiếu trong C++ được không ạ?', 'tutor', '', 'lesson-07', '2026-03-03T14:05:00');
INSERT OR REPLACE INTO ai_chat_messages (id, user_id, role, content, persona, code_snippet, lesson_id, created_at) VALUES ('msg-04', 'user-student', 'assistant', 'Tuyệt vời! Dưới đây là 2 cách triển khai kinh điển trong C++:

1. Dùng con trỏ (Pointer):
```cpp
void swapPointer(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}
```

2. Dùng tham chiếu (Reference - Chuẩn C++ hiện đại):
```cpp
void swapRef(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}
```
Cách dùng tham chiếu được khuyến khích vì cú pháp trong sáng và an toàn, không lo lỗi con trỏ NULL!', 'tutor', '#include <iostream>
using namespace std;

void swapRef(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}

int main() {
    int x = 5, y = 10;
    swapRef(x, y);
    cout << x << " " << y << endl;
    return 0;
}', 'lesson-07', '2026-03-03T14:05:10');

-- ------------------------------------------------------------------------------
-- Dữ liệu bảng `vnoi_real_knowledge` (19 bản ghi)
-- ------------------------------------------------------------------------------
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_cpp_pointers', 'Con trỏ trong C/C++', 'languages', '[Phạm Văn Hạnh](https://github.com/skyvn97/resume/blob/master/PhamVanHanh.pdf) (*skyvn97, prof.PVH, I_love_tigersugar*)', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/languages/cpp/pointers.md', '["con trỏ", "pointer", "địa chỉ", "dereference", "con trỏ hàm", "cấp phát động"]', 'Con trỏ là một trong những tính năng quan trọng của mỗi ngôn ngữ lập trình. Thực tế, để được gọi là sử dụng thành thạo một ngôn ngữ lập trình như C/C++, lập trình viên cần biết cách sử dụng con trỏ. Tuy nhiên, do ít được sử dụng trong các bài toán lập trình ở các kỳ thi học sinh giỏi, nhiều bạn học sinh chuyên tin cấp ba không nắm chắc cách dùng con trỏ, hoặc thậm chỉ bỏ qua phần kiến thức này. Vì', '# Con trỏ trong C/C++

**Tác giả**: [Phạm Văn Hạnh](https://github.com/skyvn97/resume/blob/master/PhamVanHanh.pdf) (*skyvn97, prof.PVH, I_love_tigersugar*)

Con trỏ là một trong những tính năng quan trọng của mỗi ngôn ngữ lập trình. Thực tế, để được gọi là sử dụng thành thạo một ngôn ngữ lập trình như C/C++, lập trình viên cần biết cách sử dụng con trỏ. Tuy nhiên, do ít được sử dụng trong các bài toán lập trình ở các kỳ thi học sinh giỏi, nhiều bạn học sinh chuyên tin cấp ba không nắm chắc cách dùng con trỏ, hoặc thậm chỉ bỏ qua phần kiến thức này. Vì vậy, bài viết này giúp các bạn hiểu qua cách sử dụng con trỏ và các ý nghĩa của nó.

Cần nói thêm rằng, để có cái nhìn toàn diện về con trỏ trong các ngôn ngữ lập trình, bạn cần có các kiến thức về kiến trúc máy tính, hệ điều hành, cách lưu trữ biến trong bộ nhớ máy tính. Bài viết dưới đây bỏ qua các khía cạnh này, chủ yếu nhắc đến cách sử dụng con trỏ, các lỗi hay mắc, lợi ích của con trỏ trong các bài toán lập trình thi đấu.

Bởi thế, bạn có thể yên tâm rằng bài viết dưới đây không khiến các bạn hại não, chỉ cần uống chút **sữa tươi chân trâu đường hổ** rồi bắt đầu đọc thôi :)

# 1. Con trỏ là gì?
## a. Biến "thông thường"
Chúng ta đã quá quen thuộc với các biến (*variables*) trong C++. Một biến có thể mang một giá trị, ví dụ như biến dạng `bool`, `int` hay `double`. Mỗi biến thuộc các kiểu này dùng để lưu một **giá trị** nào đó. Các biến còn có thể là một đối tượng phức tạp hơn, ví dụ như các cấu trúc dữ liệu `vector<int>`, `queue<string>` hay `map<int, string>`. Các biến thuộc loại này có thể chứa một tập hợp nhiều giá trị nào đó. Dù đơn giản hay phức tạp, các biến thuộc một trong các dạng kể trên luôn giúp chúng ta lưu trữ dữ liệu. Tác giả tạm gọi những kiểu biến này là biến "thông thường".

Như vậy, các biến "thông thường" là các biến **có thể lưu trữ dữ liệu**. Chúng có hai tính chất cơ bản sau:
- Dữ liệu của các biến này **hoàn toàn độc lập** với nhau: Giá trị của biến `a` không phụ thuộc vào giá trị của biến `b` và **ngược lại**.
- Mỗi khi ta khai báo một biến "thông thường" `int x; string s; vector<double> v;...` ta có thêm một biến mới, và biến đó cho ta **thêm không gian lưu trữ dữ liệu**.

## b. Biến tham chiếu (*reference*)
Giờ chúng ta sang tới một loại biến khác, có tên chính thức là *biếu tham chiến* (*reference*). Có thể các bạn đã biết, đã sử dụng nhưng không để ý, hoặc chưa từng sử dụng biến tham chiếu. Đầu tiên, ta hãy cùng chạy thử một đoạn code đơn giản sau:

```cpp
int a = 1;
int &b = a;
b = 2;
cout << a << endl; // it prints 2, not 1 (!)
a = 3;
cout << b << endl; // it prints 3, not 2 (!)
```

Trong đoạn code này, biến `b` được gọi là *biến tham chiếu* kiểu `int`. Nó được khai báo bằng việc thêm một dấu `&` vào sau tên kiểu `int`. Chú ý rằng hai cách khai báo `int& a = b` và `int &a = b` đều hợp lệ và có ý nghĩa như nhau. Qua thí nghiệm này, ta thấy rằng lệnh gán biến `a` cũng làm thay đổi giá trị của `b` và lệnh gán biến `b` cũng lam thay đổi giá trị của `a`. Thực tế, hai biến `a` và `b` này chỉ là một biến, nghĩa là `a` và `b` **luôn mang cùng một giá trị**, và mọi lệnh làm thay đổi giá trị của `a` **cũng làm thay đổi giá trị của** `b` và **ngược lại**.

Ta xét thêm một ví dụ nữa - một trường hợp điển hình cho việc sử dụng biến tham chiếu trong lập trình thi đấu: Quy hoạch động đệ quy có nhớ.

```cpp
int cacheDPResults[2207][1997] = {-1};
int dp(int i, int j) {
    int &result = cacheDPResults[i][j];
    if (result >= 0)
        return result;

    if (i == 0)
        return result = 0;
    result = dp(i - 1, j);
    if (j >= weight[i])
        result = max(result, dp(i - 1, j - weight[i]) + value[i]);

    return result;
}
```

Chắc các bạn lờ mờ đoán ra đoạn code trên mô phỏng công thức quy hoạch động của bài toán cái túi (*knapsack*). Tất nhiên không ai cài bài toán cái túi bằng đệ quy có nhớ cả :)

Giờ ta để ý dòng code thứ 3 trong đoạn ví dụ trên: `int &result = cacheDPResults[i][j]`. Dù dòng code này dùng để khai báo biến `result`, nhưng do có ký tự `&` ở trước, kết quả của biến `result` này được "đồng bộ" với biến `cacheDPResult[i][j]`. Biến `result` và `cacheDPResult[i][j]` **luôn mang cùng giá trị**, và khi giá trị một biến thay đổi, **biến kia cũng thay đổi theo**.

Như vậy, biến `result` này (và biến `b` ở ví dụ trước) có hai điểm khác với các biến "thông thường" được đề cập ở phần 1a:
- Giá trị của biến `result` **không độc lập** với giá trị của biến `cacheDPResult[i][j]`: Hai giá trị này luôn bằng nhau.
- Khi khai báo biến `result`, ta **không có thêm không gian lưu trữ dữ liệu**.

Do đó, nếu giữ định nghĩa về biến "thông thường" như ở phần 1a, ta không coi `result` là biến, mà nó chỉ như một tên gọi khác của biến `cacheDPResults[i][j]`. Thực tế, cách đặt biến `result` chỉ giúp cho đoạn code của bạn trong sáng hơn. Nếu bạn thay lệnh khai báo `int &result = cacheDPResults[i][j]` bằng lệnh `#define result cacheDPResults[i][j]`, hiệu ứng của đoạn code không đổi. Thậm chí, bạn có thể không sử dụng biến result và tạo ra đoạn code tuy không được trong sáng, nhưng có kết quả hoàn toàn giống đoạn code phía trên:

```cpp
int cacheDPResults[2207][1997] = {-1};
int dp(int i, int j) {
    if (cacheDPResults[i][j] >= 0)
        return cacheDPResults[i][j];
    if (i == 0)
        return 0;
    cacheDPResults[i][j] = dp(i - 1, j);
    if (j >= weight[i])
        cacheDPResults[i][j] = max(cacheDPResults[i][j], dp(i - 1, j - weight[i]) + value[i]);
    return cacheDPResults[i][j];
}
```

Biếu tham chiến này cho ta ý tưởng về một dạng biến đặc biệt trong ngôn ngữ lập trình, ở đó dù biến được tạo ra nhưng bản chất chỉ là "đặt một tên khác" cho một biến đã có sẵn từ trước. Tuy nhiên, biến tham chiếu này có hai nhược điểm: Biến tham chiếu **luôn tham chiếu vào một biến cố định** và đối tượng được tham chiếu **phải được xác định ngay lúc khai báo**. Có nghĩa là, nếu bạn có hai biến "thông thường" `int a, b` và một biến tham chiếu `int &c = a`, bạn không thể nào làm cho `b` và `c` đồng bộ nhau được. Đồng thời, nếu bạn chỉ khai bảo `int &c` mà không có vế phải, trình biên dịch sẽ báo lỗi.

Những thông tin trên cho chúng ta ý tưởng về **con trỏ**.

## c. Con trỏ (*pointer*)
Con trỏ sử dụng ý tưởng của biến tham chiếu: Biến con trỏ được tạo ra *thường* không để có thêm không gian lưu trữ dữ liệu, mà là để tạo ra "tên khác" hoặc "nhãn mác mới" cho một biến đã có từ trước. Điều này giải thích tên gọi "con trỏ": "trỏ" trong từ "chỉ trỏ" có nghĩa là chỉ vào, hướng vào một cái gì đó. Nhưng khác với biến tham chiếu, một con trỏ ở những thời điểm khác nhau có thể *trỏ vào* (hay "là tên biến khác" hoặc "đại diện cho") các biến khác nhau. Biến con trỏ có thể không trỏ vào cái gì (gọi là con trỏ rỗng - *NULL* mà ta sẽ nghiên cứu ở phần sau) và không cần thiết phải được khởi tạo lúc khai báo.

Tóm lại, sau phần này, bạn cần nắm được sự khác biệt của con trỏ với những loại biến mà các bạn hay sử dụng: Các biến "thông thường" dùng để **lưu trữ thông tin** và **có tính độc lập**. Các biến tham chiếu và con trỏ dùng để "đặt lại tên" hoặc "tạo một tên mới" cho các biến đã có từ trước.

*Ghi chú: Ý tưởng phân tích ở phần này có thể KHÔNG phải là ý tưởng để người sáng lập ngôn ngữ lập trình C/C++ đưa con trỏ vào ngôn ngữ; nhưng theo quan điểm của tác giả, góc nhìn này giúp các bạn học lập trình ở phổ thông hiểu được khái niệm của con trỏ.*

# 2. Cách sử dụng con trỏ
## a. Các cú pháp cơ bản
Phần này chủ yếu giới thiệu cho các bạn các cú pháp cơ bản để sử dụng con trỏ một cách chính xác. Bạn có thể coi những đoạn code dưới đây như là cú pháp, chỉ học thuộc lòng mà không cần quan tâm quá nhiều về ý nghĩa.

### Khai báo con trỏ
Dù con trỏ có thể *trỏ vào* (đại diện cho/là một tên khác của) **nhiều biến khác nhau** trong những thời điểm khác nhau, các đối tượng được trỏ vào phải có **cùng một kiểu dữ liệu**. Kiểu dữ liệu chung này cần được xác định khi khai báo.

Để khai báo một con trỏ *trỏ vào* các biến có kiểu dữ liệu `int`, ta khai báo `int *p` hoặc `int* p` (hai cách này như nhau về mặt cú pháp). Tương tự, nếu bạn muốn con trỏ của bạn trỏ vào các biến có kiểu `string` hoặc `queue<char>`, ta khai báo `string *s` hoặc `queue<char> *q`.

Tổng quát, nếu `T` là một kiểu dữ liệu nào đó (có thể là kiểu *nguyên thủy* như `int`, `char`, `double` hoặc các struct, class như `vector<string>`, `queue<pair<int, int>>`) thì `T*` là một **con trỏ trỏ vào các biến thuộc kiểu T**. Do con trỏ cũng là một kiểu dữ liệu, con trỏ cũng có thể trỏ vào một con trỏ khác. Ví dụ, `int **p` là một *con trỏ trỏ vào một con trỏ trỏ vào một biến kiểu `int`* hay `char *******just_to_troll` là một con trỏ trỏ vào một con trỏ trỏ vào một con trỏ trỏ vào một con trỏ trỏ vào một con trỏ trỏ vào một con trỏ trỏ vào một con trỏ trỏ vào một biến kiểu `char`.

Theo kinh nghiệm của mình, *con trỏ trỏ vào một con trỏ* là thứ rất ít khi sử dụng trong lập trình thi đấu. Vì vậy, để đơn giản, trong phần lớn thời lượng còn lại của bài viết, mình chỉ xét trường hợp con trỏ trỏ vào một biến "thông thường".

### Thay đổi (gán) biến được con trỏ trỏ vào
Bạn có thể cho một con trỏ trỏ vào một biến "thông thường" hoặc trỏ vào nơi mà *một con trỏ khác đang trỏ tới*. Ví dụ

```cpp
int normal;
int *first;
int *second;
first = &normal;
second = first;
```
Trong ví dụ trên, ta có `normal` là một biến "thông thường" kiểu `int`. `first` và `second` là các con trỏ mà đối tượng (biến) được trỏ tới có kiểu `int`. Dòng số 4 `first = &normal` giúp con trỏ first trỏ vào biến normal. Dòng số 5 `second = first` mang ý nghĩa rằng *con trỏ `second` trỏ vào nơi mà `first` đang trỏ vào, nghĩa là biến `normal`*.

Chú ý rằng nếu bạn muốn trỏ vào một biến "thông thường", trước tên biến phải có dấu `&`. Còn nếu muốn một con trỏ trỏ vào đối tượng của một con trỏ khác, vế phải không cần có dấu `&`. Đồng thời, các con trỏ trỏ vào các đối tượng khác kiểu nhau không thể bị gán ghép với nhau. Do đó, các dòng code dưới đây đều gặp lỗi khi biên dịch:

```cpp
int normal;
int *pointer_1, *pointer_2;
string *pointer_string;

pointer_1 = normal;        // ERROR!!! should be pointer_1 = &normal
pointer_2 = &pointer_1;    // ERROR!!! should be pointer_2 = pointer_1;
pointer_2 = pointer_string // ERROR!!! type mismatches: string* vs int*
```

Tới đây các bạn sẽ thắc mắc: Dấu `&` xuất hiện trong `&normal` có mối quan hệ biện chứng nào với dấu `&` ở phần biến tham chiếu hay không. Câu trả lời là có, nhưng nó hơi phức tạp với các bạn. Nhắc lại lần nữa, mình khuyên các bạn coi các đoạn code ở phần này là những **cú pháp cố định** và **phải học thuộc lòng** thay vì cố phân tích các quy tắc.

### Truy cập vào biến được con trỏ trỏ tới
Như đã nói ở trên, ngoại trừ trường hợp con trỏ trỏ vào một con trỏ, các con trỏ được dùng để "đặt tên khác" cho một biến "thông thường" nào đó. Để truy cập vào một biến được con trỏ `p` trỏ tới, bạn dùng `*p`. Các bạn hãy coi `*p` ở đây **như một biến "thông thường"**, nghĩa là nếu các biến "thông thường" cùng kiểu có thể xuất hiện thế nào, `*p` có thể sử dụng hoàn toàn tương tự như vậy:

```cpp
int *p_int = ...;       // something which does not matter
string *p_string = ...; // something which does not matter

*p_int = 5;
(*p_int)++;
cout << *p_int << endl;
if (!(*p_string).empty())
    for (int i = 0; i < (*p_string).size(); i++)
        printf("%c", (*p_string)[i]);
```

Việc một con trỏ *là một tên khác* của một biến "thông thường" được thể hiện dưới đây:

```cpp
int normal_1, normal_2;
int *pointer;

normal_1 = normal_2 = 100;
pointer = &normal_1;
printf("%d\n", *pointer); // 100
*pointer = 200;
printf("%d\n", normal_1); // 200;

pointer = &normal_2;
*pointer = 300;
printf("%d %d\n", normal_1, normal_2); // 200 300

int *another_pointer = pointer;
normal_2 = 400;
printf("%d\n", *another_pointer); // 400
```

Trong ví dụ trên:
- Đầu tiên con trỏ `pointer` trỏ vào biến "thông thường" `normal_1`. Do đó, `normal_1` và `*pointer` lúc này **cùng là một biến**: Khi một lệnh làm thay đổi giá trị `normal_1`, giá trị của `*pointer` cũng thay đổi theo và ngược lại.
- Sau lệnh gán `pointer = &normal_2`, `pointer` lúc này trỏ vào `normal_2` và **không còn trỏ vào** `normal_1` nữa. Vì vậy, lện gán `*pointer_2 = 300` **làm thay đổi** `normal_2` nhưng **không làm thay đổi** `normal_1`.
- Cuối cùng, con trỏ `another_pointer` được cho trỏ vào *nơi `pointer` đang trỏ vào*, tức là biến "thông thường" `normal_2`. Do đó lệnh gán `normal_2` làm thay đổi `*another_pointer`.

**Chú ý**: Các lệnh gán các biến "thông thường" `normal_1` và `normal_2` ở trên kia làm thay đổi `*pointer`, **nhưng không thay đổi** `pointer`. Các bạn cần **phân biệt rất cẩn thận** hai lệnh `*another_pointer = *pointer` và `another_pointer = pointer`. Lệnh thứ nhất chỉ là phép gán giá trị giữa hai biến "thông thường", trong khi lệnh thứ hai làm thay đổi đối tượng mà `another_pointer` đại diện cho.

### Con trỏ *NULL* - con trỏ không trỏ vào một đối tượng nào.
**Chú thích: Nếu bạn dùng C++11 hoặc các phiên bản mới hơn, bạn được khuyến khích sử dụng từ khóa** ***nullptr*** **thay cho từ** ***NULL*** **được nêu ở đây. Tuy việc dùng từ** ***NULL*** **là tương đối an toàn,** ***nullptr*** **vẫn thích hợp hơn trong trường hợp này. Chi tiết các bạn có thể xem tại [đây](https://embeddedartistry.com/blog/2017/03/08/migrating-from-c-to-c-null-vs-nullptr). Phần còn lại vẫn sẽ sử dụng** ***NULL*** **bởi chỉ từ khóa này tương thích với C và các bản C++ trước 11.**

Một con trỏ có thể không trỏ vào một đối tượng nào, khi đó con trỏ mang một giá trị mặc định *NULL*. Khi bạn cố gắng truy cập vào đối tượng của một con trỏ mang gía trị *NULL*, chương trình bạn **bị crash ngay lập tức** (bị *crash* chứ không bị *crush*) và bạn sẽ gặp phải lỗi *run-time error* (hoặc *non-zero exit code*, *segmentation fault*):

```cpp
int *p = NULL;
cout << *p << endl; // ERROR!!!
```

Do đó, kinh nghiệm ở đây là luôn kiểm tra một con trỏ có phải *NULL* hay không trước khi truy cập vào. Khi biết chương trình của bạn chạy sinh lỗi (khi chạy thử test đề hoặc nộp lên hệ thống bị run-time error), bạn nên rà soát lại toàn bộ code, và xem các con trỏ đã được kiểm tra *NULL* trước khi truy cập hay chưa:

```cpp
int *p...;
printf("%d\n", *p);                 // DANGEROUS!!! p might be NULL
printf("%d\n", p != NULL ? *p : 0); // SAFE :)
```

### Lệnh *new* tạo biến "thông thường":
Dù một con trỏ thường được dùng để trỏ vào ("tạo tên biến khác") cho một biến đã có trước đó, có những trường hợp chúng ta muốn con trỏ trỏ vào một biến hoàn toàn mới. Khi đó lệnh `new` (từ khóa của C/C++) giúp chúng tạo ra một biến mới:

```cpp
int normal_1 = 100, normal_2 = 200, normal_3 = 300;
int *pointer = new int;
*pointer = 400;
printf("%d %d %d %d\n", normal_1, normal_2, normal_3, *pointer); // 100 200 300
```

Ở đây, rõ ràng biến `*pointer` là một biến "thông thường" kiểu `int`. Nhưng biến này không trùng với bất kỳ biến "thông thường" kiểu `int` nào đã khai báo trước đó. Do đó lệnh `*pointer = 400` không ảnh hưởng tới `normal_1`, `normal_2` hay `normal_3`.

Nếu các bạn đã quen với *constructor* của struct/class hay các thư viện STL (một cách truyền tham só để khởi tạo các đối tượng), bạn có thể truyền các tham số một cách hoàn toàn tương tự để khởi tạo các đối tượng của lệnh `new`. Dưới đây, ta có một biến thông thường `vec` là một `vector<int>` có 10 số 1, và một con trỏ `vec_pointer` trỏ vào một `vector<int>` có 10 số 1. Tuy nhiên, hai vector này **không liên quan đến nhau**.

```cpp
vector<int> vec(10, 1);
vector<int> *vec_pointer = new vector<int>(10, 1);
cerr << (*vec_pointer).size() << " " << (*vec_pointer)[0] << endl; // 10 1
```

### Truy cập các trường của một con trỏ trỏ vào đối tượng.
Nếu một con trỏ trỏ vào một đối tượng (struct/class) hoặc các biến có kiểu là các kiểu dữ liệu trong STL, ta có thể dùng mũi tên `->` để truy cập vào các trường và hàm của chúng. Về mặt ý nghĩa, `(*p).x` và `p->x` **hoàn toàn giống nhau**, nhưng cách viết sau ngắn gọn và dễ nhìn hơn.

```cpp
vector<int> *p = new vector<int>(); // an empty vector
p->push_back(2);
cerr << p->size() << " " << p->front() << "\n"; // 1 2
```

## b. Các cú pháp nâng cao
Phần này nói về các kiến thức nâng cao hơn về con trỏ, dù khó hiểu hơn nhưng vẫn nói đến cú pháp là chính. Đây là các tình huống sử dụng con trỏ ít khi gặp trong lập trình thi đấu. Nếu các bạn cảm thấy phần trên khó hiểu với bạn, có thể cân nhắc bỏ qua phần này. Thành thật xin lỗi các bạn :(

### Lấy con trỏ làm tham số của hàm
Trước tiên, ta nhắc lại 3 loại tham số đối với các biến "thông thường": *tham trị*, *tham biến* và *hằng tham biến*:

<table>
<tr>
<th>Kiểm tham số</th>
<th>Cú pháp</th>
<th>Giá trị truyền vào</th>
<th>Chi phí truyền tham số</th>
<th>Thay đổi giá trị tham số</th>
</tr>
<tr>
<td>Tham trị</td>
<td>`int a`</td>
<td>Biến, biểu thức hoặc hằng số</td>
<td>Chi phí lớn nếu kiểu dữ liệu truyền vào là vector, set... do phải copy giá trị của biến</td>
<td>Có thể gán lại trong hàm, nhưng giá trị ngoài hàm của biến không đổi</td>
</tr>
<tr>
<td>Tham biến</td>
<td>`int &a`</td>
<td>Chỉ có thể là biến</td>
<td>Chi phí rất nhỏ do không phải copy giá trị của biến</td>
<td>Lệnh gán trong hàm làm thay đổi giá trị của biến ở ngoài hàm</td>
</tr>
<tr>
<td>Hằng tham biến</td>
<td>`const int &a`</td>
<td>Biến, biểu thức hoặc hằng số</td>
<td>Chi phí lớn nếu đối tượng truyền vào là biểu thức, chi phí nhỏ nếu đối tượng truyền vào là biến</td>
<td>Không thể làm thay đổi giá trị của biến trong hàm</td>
</tr>
</table>

Ví dụ:
```cpp
void update(int a, int &b, const int &c) {
    a = 10; // OK but has no effect
    b = 20; // OK and has effect
    c = 30; // COMPILATION ERROR
}

int main(void) {
    int a = 1, b = 2, c = 3;
    update(a, b, c);
    cout << a << " " << b << " " << c << endl; // 1 20 3

    update(1 + 1, b, c); // OK
    update(a, 1 + 1, c); // COMPILATION ERROR
    update(a, b, 1 + 1); // OK
}
```

Trong đoạn code trên, lệnh `c = 30` gặp lỗi vì hằng tham biến không thể bị gán lại trong hàm. Nếu xóa dòng `c = 30` này đi, hàm update chỉ làm thay đổi giá trị biến `b` vì `a` là tham trị còn `b` là tham biến. Do đó khi in ra, biến `a` vẫn có giá trị là `1`, còn biến `b` bị gán lại thành `20`, biến `c` không thay đổi giá trị do được truyền vào là hằng tham biến và không thể gán lại.

Nếu ta thử truyền một biểu thức (ví dụ, `1 + 1` như ở trên), tham số thứ nhất và thứ ba của hàm `update` (tham trị và hằng tham biến) cho phép làm điều này, còn tham số thứ hai (tham biến) chỉ chấp nhận truyền vào một biến.

**Với con trỏ**, bạn có thể truyền vào ba loại tham số tương tự. Tuy nhiên, do kích thước của một biến con trỏ là rất nhỏ (4 bytes (bằng một biến `int`) với các máy tính dùng HĐH 32-bit, hoặc 8 bytes (bằng một biến `long long`) với các máy tính dùng HĐH 64-bit); mình thấy việc dùng hằng tham biến với con trỏ là **không cần thiết** (Hằng tham biến chỉ được sử dụng khi bạn truyền các tham số có kích thước lớn như vector, map, set...). Với con trỏ được truyền theo kiểu tham trị hoặc tham biến, có các điểm cần chú ý sau đây:
- Chi phí truyền vào **luôn rất nhỏ**, bất kể là tham trị hay tham biến, bất kể đối tượng được trỏ vào là `int` hay `vector`.
- Giá trị của con trỏ (biến "thông thường" được con trỏ trỏ vào) **không đổi** với tham trị, và **có thể thay đổi** với tham biến.
- Giá trị của biến được đối tượng trỏ vào **luôn bị thay đổi** nếu có các lệnh gán hoặc gọi hàm làm thay đổi giá trị của chúng.

Ví dụ:
```cpp
#include <bits/stdc++.h>
using namespace std;

int normal_1, normal_2;
void update(int *pointer) {
    *pointer = 10;
    pointer = &normal_2;
    *pointer = 20;
}

int main(void) {
    normal_1 = 1;
    normal_2 = 2;
    int *pointer = &normal_1;
    update(pointer);
    cout << normal_1 << " " << normal_2 << " " << *pointer << endl; // 10 20 10;
}
```
Trong ví dụ trên:
- Khi hàm `update` được gọi, tham số `pointer` đang trỏ vào biến `normal_1`. Do đó, lệnh `*pointer = 10` mang ý nghĩa `normal_1 = 10`;
- Sau hai lệnh `pointer = &normal_2` và `*pointer = 20`, biến `pointer` này trỏ vào biến `normal_2` và gán biến này thành `20`.
- Kết quả in ra cho thấy `*pointer = 10`, tức là `pointer` trỏ vào `normal_1`. Tức là đối tượng bị `pointer` trỏ vào **không đổi** sau khi gọi hàm update.

```cpp
#include <bits/stdc++.h>
using namespace std;

int normal_1, normal_2;
void update(int *&pointer) {
    *pointer = 10;
    pointer = &normal_2;
    *pointer = 20;
}

int main(void) {
    normal_1 = 1;
    normal_2 = 2;
    int *pointer = &normal_1;
    update(pointer);
    cout << normal_1 << " " << normal_2 << " " << *pointer << endl; // 10 20 20;
}
```
Đoạn code này chỉ khác ở đoạn code trên ở chỗ tham số `pointer` của hàm `update` là **tham biến** thay vì **tham trị**.  Gía trị của hai biến `normal_1` và `normal_2` giống hệt đoạn code trên, nhưng `pointer` lúc này trỏ vào `normal_2`. Sở dĩ có điều này là vì trong hàm `update`, `pointer` bị gán lại thành `&normal_2`, và vì `pointer` là tham biến, lệnh gán này giữ nguyên giá trị khi ra khỏi hàm.

### Tạo mảng động
Các bạn đã biết, trong một số trường hợp bạn không thể khai báo mảng tĩnh vì như vậy kích thước mảng cần thiết sẽ quá lớn, vượt quá giới hạn bộ nhớ cho phép và thực tế không cần thiết tới vậy.

Ví dụ, khi bạn cần nhập vào một bảng hai chiều kích thước $m \cdot n$ với $1 \leq m \cdot n \leq 10^{5}$, ta biết rằng cả $m$ và $n$ đều có thể lên tới $10^{5}$. Tuy nhiên, khai báo mảng tĩnh `int a[1e5][1e5]` là không khả thi vì kích thước mảng $10^{10}$ là quá to.

Một trường hợp khác khá quen thuộc với các bạn: Các bạn cần lưu mảng danh sách kề của một đồ thị có $10^{5}$ đỉnh và $10^{5}$ cạnh. Ta biết rằng một đỉnh có thể kề với tối đa $10^{5}-1$ đỉnh khác, do đó nếu dùng mảng tĩnh ta phải khai báo `int adj[1e5][1e5]`, nhưng điều này một lần nữa không khả thi. Nhưng chúng ta biết rằng, thực tế chỉ có $10^{5}$ cạnh, tức là tổng kích thước của danh sách kề ứng với các đỉnh là không quá $2 \cdot 10^{5}$, đó là lý do chúng ta sử dụng `vector<int> adj[1e5]`.

Theo quan điểm của mình, việc tạo mảng động bằng con trỏ không cần thiết, do `vector` của C++ cũng khá tiện lợi. Hơn nữa, việc khai báo vector **có kích thước cố định** không khiến vector chậm hơn hoặc dùng nhiều bộ nhớ hơn mảng (chỉ việc `push_back` quá nhiền lần với những vector có kích thước nhỏ mới khiến vector bị chậm). Vì vậy, nếu bạn không thạo con trỏ, lời khuyên là hãy dùng vector.

Để hiểu cách tạo mảng bằng con trỏ, bạn cần hiểu về nguyên lý hoạt động của mảng, và vì sao truy cập phần tử thứ $k$ của mảng lại mất độ phức tạp $\mathcal{O}(1)$. Điều này nói chi tiết ra sẽ khá dài dòng và cũng hơi khó hiểu, vì vậy mình sẽ bỏ qua (các bạn khi lên đại học sẽ được học thêm về phần này, và mình cảnh báo trước, đây là phần rất rất khó. Bản thân mình ko đạt điểm tối đa bài kiểm tra môn lập trình cơ bản phần con trỏ).

Nói vắn tắt, một mảng các số nguyên kiểu `int` có bản chất giống như một **con trỏ** trỏ vào **phần tử đầu tiên** của mảng. Tức là, nếu ta khai báo `int a[100]` thì biến  `a` có kiểu `int*` (dù `a[0]`, `a[1]`,... có kiểu là `int`). Do `a` là con trỏ kiểu `int*`, `*a` là một biến "thông thường" kiểu `int`, và vì `a` trỏ vào phần tử đầu tiên `a[0]`, `*a` và `a[0]` **là cùng một biến** (gán `*a = 4` và `a[0] = 4` là như nhau).

Tương tự, do mảng hai chiều là **mảng các mảng một chiều**, mảng hai chiều giống như **con trỏ trỏ vào một con trỏ. Nếu ta khai báo `int b[100][100]`, biến `b` có kiểu `int**`.

Để tạo ra mảng một chiều có $100$ phần tử `int`, ta khai báo như sau:
```cpp
int *a = new int[100];
```

Để tạo ra các mảng nhiều chiều, ý tưởng là ta sẽ tạo ra từng chiều một. Ví dụ dưới đây đọc vào 3 số m, n, p và tạo ra một mảng hai chiều kích thước $m \cdot n$ cùng một mảng ba chiều kích thước $m \cdot n \cdot p$:
```cpp
int **array_2d, ***array_3d;
int m, n, p;
cin >> m >> n >> p;

array_2d = new int *[m];
for (int i = 0; i < m; i++)
    array_2d[i] = new int[n];

array_3d = new int **[m];
for (int i = 0; i < m; i++) {
    array_3d[i] = new int *[n];
    for (int j = 0; j < n; j++)
        array_3d[i][j] = new int[p];
}
```

Việc dùng vector để tạo mảng động được khuyến khích do sự dễ dàng và thuận tiện. Tuy nhiên, có hai ưu điểm của việc dùng mảng động bằng con trỏ: **Tốn ít bộ nhớ** và **code ngắn gọn hơn.**

Ví dụ, nếu ta cần một mảng 4 chiều kích thước $10^{5} \cdot 10^{2} \cdot 2 \cdot 2$, có hai cách khai báo mà mình biết:
```cpp
int m = (int)1e5, n = (int)1e2;

vector<vector<vector<vector<int>>>> dynamic_vector(
    m, vector<vector<vector<int>>>(n, vector<vector<int>>(2, vector<int>(2))));
for (int i = 0; i < m; i++) {
    dynamic_vector[i].resize(n);
    for (int j = 0; j < n; j++) {
        dynamic_vector[i][j].resize(2);
        for (int k = 0; k < 2; k++)
            dynamic_vector[i][j][k].resize(2);
    }
}

/**OR**/
int ****dynamic_array = new int ***[m];
for (int i = 0; i < m; i++) {
    dynamic_array[i] = new int **[n];
    for (int j = 0; j < n; j++) {
        dynamic_array[i][j] = new int *[2];
        for (int k = 0; k < 2; k++) {
            dynamic_array[i][j][k] = new int[2];
        }
    }
}
```

Một vector cần 24 bytes để lưu, còn một con trỏ chỉ cần 8 bytes. Ở mỗi cách, ta cần lưu $m + m \cdot n + m \cdot n \cdot 2 = 30.1 \cdot 10^{6}$ vector/con trỏ và $4 \cdot 10^{7}$ biến `int`. Do đó dùng vector sẽ tốn $882.4 \cdot 10^{6}$ bytes ~ $841.5$MB, nhưng dùng con trỏ chỉ tốn ~400MB.

Sau đây là hai lời khuyên cuối cùng về việc tạo mảng động:
- Bất kể sử dụng vector hay con trỏ để khai báo mảng động, bạn cố gắng **chỉ tạo một chiều động**, còn các chiều còn lại tĩnh.
- Trường hợp bắt buộc phải dùng mảng động nhiều chiều, dùng con trỏ sẽ tốt hơn vector.

Giả sử bạn có một bài quy hoạch động 4 chiều với hàm qhđ $f(i, j, k, l)$ với $0 \leq i \leq m$, $0 \leq j \leq n$ và $k$ và $l$ chỉ là các giá trị $0$ hoặc $1$. Nếu đề bài ràng buộc $1 \leq m \cdot n \leq 10^{5}$, ta biết rằng kích thước của ba chiều $i$, $k$, và $l$ không quá $4 \cdot 10^{5}$. Do đó mình khuyên các bạn nên biểu diễn trạng thái dưới dạng $f(k, l, i, j)$ thay vì $f(i, j, k, l)$ (đảo thứ tự các chiều):
```cpp
#define MAX 100100
int *f[2][2][MAX];

int main(void) {
    int m, n;
    cin >> m >> n;
    ...
    for (int k = 0; k < 2; k++)
        for (int l = 0; l < 2; l++)
            for (int i = 0; i <= m; i++)
                f[k][l][i] = new int[n + 1]; // note that 0 <= j <= n so the array size is n+1.
}
```

### Lệnh *delete* để giải phóng bộ nhớ
`delete` là lệnh trái ngược với `new`. Nếu như `new` là lệnh dùng để "xin" bộ nhớ máy tính cho một biến mới, thì `delete` dùng để trả lại bộ nhớ biến này. Khi bạn gọi lệnh `new`: `int *p = new int` hay `int *arr = new int[100]`, bạn tiêu tốn một phần tài nguyên của máy tính để lưu các biến `int` được tạo thêm này. Đến lúc bạn không cần chúng nữa, bạn không muốn tiêu tốn tài nguyên, bạn gọi lệnh `delete p` hoặc `delete[] arr`. Khi đó, các biến bạn vừa "xin" thêm sẽ biến mất.

Lệnh `delete` này rất thiết thực trong lập trình thực tế, do bạn không muốn sử dụng tài nguyên khi không cần thiết. Nhưng nhìn chung, bạn không cần `delete` trong lập trình thi đấu, do một khi đã `new` được thì nghĩa là bạn không bị quá giới hạn bộ nhớ cho phép.

## c. Các lỗi thường gặp về con trỏ
### Sai cú pháp
Lỗi này bao gồm việc gõ thiếu hoặc thừa các dấu `*` hoặc các dấu `&`. Trong một phép gán hoặc phép tính, nếu bạn chỉ gõ sai ở một trong hai vế, bạn sẽ có một phép gán **không hợp lệ** và trình biên dịch sẽ **báo lỗi**. Khi đó bạn biết mình mắc lỗi và phải sửa, nhưng việc sửa là không dễ dàng do các thông điệp báo lỗi của C++ trong trường hợp này thường khó hiểu. Lời khuyên khi gặp phải trường hợp này đó là bạn hãy nhìn kỹ lại hai vế xem kiểu dữ liệu ở hai vế có tương ứng nhau hay không:
- Nếu `a` là một biến "thông thường" kiểu `int`, `&a` là một con trỏ kiểu `int*` và `*a` là một biểu thức vô nghĩa.
- Nếu `a` là một con trỏ kiểu `int*`, `*a` là một biến "thông thường" kiểu `int` và `&a` là một con trỏ kiểu `int**`.
- Một phép gán chỉ hợp lệ khi kiểu dữ liệu của hai vế **giống nhau** (đều là `int` hay đều là `int*`).

Tuy nhiên, có những trường hợp khó phát hiện hơn do lỗi sai **không gây lỗi biên dịch** (giống như các bệnh nhân nhiễm virus Corona nhưng không triệu chứng), vì vậy bạn phải thật cẩn thận. Giả sử ta có hai con trỏ `int *p` và `int *q`:
- Lệnh `printf("%d\n", p)` dù không gây lỗi biên dịch nhưng **tạo ra cảnh báo**. Để nhận được cảnh báo này, bạn cần **bật chế độ -O2, -Wall và -Wextra** trong Codeblocks/Dev-Cpp.
- `cout << p` thay vì `cout << *p`: Lệnh không gây ra lỗi biên dịch hay cảnh báo.
- `p < q` thay vì `*p < *q`: Lệnh không gây ra lỗi biên dịch hay cảnh báo.
- `p = q` thay vì `*p = *q` hoặc ngược lại: Lệnh không gây ra lỗi biên dịch hay cảnh báo.

### Khai báo sai cách
Để khai báo các biến "thông thường" cùng một kiểu, thay vì bạn khai báo `int a; int b; int c` bạn sẽ gộp lại thành `int a, b, c;`. Với con trỏ, để có 3 con trỏ trỏ vào các biến kiểu `int`, bạn cần khai báo là `int *a, *b, *c` (có dấu `*` trước **mỗi** biến), thay vì `int* a, b, c` hoặc `int *a, b, c`. Nếu bạn chỉ có một dấu `*`, chỉ biến `a` là con trỏ (kiểu `int*`), còn các biến `b` và `c` vẫn là biến "thông thường" kiểu `int`. Tất nhiên, bạn sẽ phát hiện lỗi này dễ dàng do trình biên dịch sẽ báo lỗi. Nhưng trình biên dịch chỉ báo lỗi ở dòng bạn gán/sử dụng con trỏ, còn dòng khai báo là chỗ bạn phải sửa thì trình biên dịch không bao giờ báo lỗi ở đây.

Bởi thế, khi cần khai báo nhiều con trỏ cùng một lúc, bạn phải khai báo là `int *a, *b, *c`. Còn khi chỉ có một con trỏ (lúc khai báo biến hoặc khai báo tham số của hàm), bạn nên viết là `int *a` thay vì `int* a`. Thực lòng thì mình thích cách `int* a` hơn, và khi đi làm ở Google mình nhớ là mọi người cũng viết thế, bởi vì khi xét `int*` là một kiểu dữ liệu thì `int* a` là một cách viết rất trong sáng. Tuy nhiên mình không hiểu sao C++ lại không hiểu `int* a, b, c` là 3 con trỏ, mình thật sự thấy hơi vô lý ở đây.

### Con trỏ trỏ lung tung
Lỗi này có triệu chứng là việc bạn bị *run-time-error*, do bạn truy cập vào vùng nhớ (biến "thông thường" được trỏ tới) của một con trỏ trỏ vào nơi "lung tung", không xác định.

Đây là lỗi hay gặp nhất, có ba lý do chính dẫn đến lỗi này:
- Chưa xét trường hợp con trỏ hiện tại là con trỏ NULL. Lỗi này đã được nói đến ở phần trên. Để khác phục, bạn cần xét cẩn thận từng trường hợp, khi gọi vào `*p` hay `p->`, bạn cần nghĩ xem liệu `p` có thể là `NULL` không. Nếu có, bạn cần thêm các lệnh `if` (ví dụ, `if (p != NULL) p->push_back(1)`) hay phép toán điều kiện (ví dụ, `cout << (p == NULL ? 0 : *p)`).
- Chưa khởi tạo con trỏ trước khi truy cập. Chú ý, các con trỏ nếu được khai báo là **biến cục bộ** (khai báo trong hàm), nó **không tự động khởi tạo là NULL**. Do đó, nếu bạn kiểm tra điều kiện `p == NULL`, nó sai, nhưng khi truy cập vào `*p`, bạn vẫn bị chạy sinh lỗi như khi truy cập vào con trỏ NULL. Lời khuyên đưa ra: Giống như bất kỳ biến cục bộ nào khác, bạn phải khởi tạo trước khi sử dụng.
- Truy cập sau khi `delete`: Khi bạn xóa vùng nhớ của một con trỏ bằng `delete p` hoặc `delete[] arr`, các vùng nhớ tương ứng với các con trỏ bị xóa, nhưng con trỏ **không được gán lại thành NULL**. Khi đó, nếu bạn vô tình truy cập vào `*p` bạn vẫn bị chạy sinh lỗi, và kiểm tra `p == NULL` không giúp bạn tránh được lỗi này.

### *sizeof* không hoạt động với con trỏ và mảng động.
Các bạn đã biết, ta có thể dùng `memset` để khởi tạo một mảng với cú pháp thông thường: `memset(arr, ..., sizeof arr)`. Điều này đúng với mảng tĩnh các bạn hay dùng, nhưng với mảng động được tạo ra bởi thao tác `new`, bạn không thể dùng `sizeof` mà phải tự truyền kích cỡ thực của chúng.

```cpp
int m = 100, n = 10000;
int *int_array;
int_array = new int[m];
long long *ll_array;
ll_array = new long long[n];

// INCORRECT
memset(int_array, 0, sizeof int_array);
memset(ll_array, 0, sizeof ll_array);

// CORRECT
memset(int_array, 0, m * sizeof(int));
memset(ll_array, 0, n * sizeof(long long));
```

Tương tự, nếu một mảng được truyền vào một hàm, kể cả **nếu mảng đó là mảng tĩnh**, bạn không thể khởi tạo theo cách thông thường.

```cpp
#define MAX 100100
int arr[MAX];

// INCORRECT
void do_something_funny(int arr[MAX]) { // "int arr[MAX]", "int arr[]" or "int *arr" are the same here
    memset(arr, 0, sizeof arr);
}

// CORRECT
void do_something_funny(int arr[MAX]) {
    memset(arr, 0, MAX * sizeof(int));
}
```
Dù cách thứ hai trong phần trên là chính xác, mình khuyên các bạn không nên dùng. Tốt nhất là nếu `memset` thì không nên truyền mảng vào hàm

### Các con trỏ trỏ không đúng thứ cần trỏ.
Các bạn thử nghĩ xem hai đoạn code dưới đây khác nhau như thế nào. Sau khi nhận ra được sự khác biệt, bạn sẽ có cách khác phục cho riêng mình.
```cpp
vector<int *> v(10);
for (int i = 0; i < 10; i++)
    v[i] = new int;
```
và
```cpp
vector<int *> v(10, new int);
```

# 3. Một số ứng dụng của con trỏ trong lập trình thi đấu
Phần này điểm qua một số cấu trúc dữ liệu và thuật toán mà việc dùng con trỏ cài đặt sẽ hữu ích. Tất nhiên, các bạn có thể "né tránh" con trỏ bằng nhiều cách cài đặt khác; nhưng bạn sẽ phải trả giá bằng một đoạn code rất xấu và lằng nhằng.

## a. Cây tiền tố (*trie*)
Ứng dụng phổ biến nhất của con trỏ là để biểu diễn các cấu trúc dữ liệu dạng cây. Ý tưởng chung là ta sẽ viết một `struct Node` để mô tả một nút trên cây. Khi ta vẽ một cây lên giấy, ta thường mô tả các quan hệ cha con bằng cách vẽ một đường có mũi tên nối từ cha xuống con. Nói cách khác, mũi tên này chỉ việc chả "trỏ" vào con. Việc biểu diễn các cấu trúc dữ liệu cây bằng con trỏ dựa trên ý tưởng này: Trong `struct Node`, ta có các trường để lưu các con trỏ `Node*` trỏ vào các con.

Giả sử ta chỉ làm việc trên các xâu ký tự gồm các chữ cái latin in thường. Khi đó, trong `struct Node` cần có một mảng gồm $26$ phần tử có kiểu `Node *`, để lưu lại $26$ con trỏ trỏ đến $26$ con của một nút ứng với $26$ ký tự ''a'' - ''z''.

Ta xét bài toán ví dụ đơn giản: *Cho $n$ xâu ký tự $s_1, s_2, \ldots, s_n$, tính tổng độ dài các tiền tố phân biệt của $n$ xâu kí tự này.*

Để làm được bài này, đầu tiên ta sẽ dựng cây tiền tố. Sau đó, với mỗi nút ta sẽ tính hai giá trị:
- Độ cao của nút này
- Tổng độ cao của các nút nằm trong cây con có gốc là nút này.

Đoạn code mẫu:
```cpp
#include <bits/stdc++.h>
using namespace std;
#define REP(i, n) for (int i = 0, _n = (n); i < _n; i++)

struct Node {
    Node *child[26];
    long long high, totHigh;

    Node() {
        high = totHigh = 0;
        REP(i, 26)
        child[i] = NULL;
    }
};
Node *root;

void addString(const string &s) {
    Node *p = root;
    REP(i, s.size()) {
        if (p->child[s[i] - ''a''] == NULL)
            p->child[s[i] - ''a''] = new Node();
        p = p->child[s[i] - ''a''];
        p->high = i + 1;
    }
}

void dfs(Node *p) {
    p->totHigh = p->high;
    REP(i, 26)
    if (p->child[i] != NULL) {
        dfs(p->child[i]);
        p->totHigh += p->child[i]->totHigh;
    }
}

int main(void) {
    int n;
    cin >> n;
    root = new Node();

    REP(love, n) {
        string s;
        cin >> s;
        addString(s);
    }

    dfs(root);
    cout << root->totHigh << endl;
}
```

Đoạn code trên có ba phần chính:
- Phần mô tả `struct Node`: Ở đây, ta thấy trong Node lưu lại một mảng `Node *child[26]` là mảng con trỏ trỏ vào các con như đã nói ở trên. Ngoài ra, ta còn dùng thêm biến `high` để lưu lại độ cao của cây và `totHigh` để lưu lại tổng độ cao của tất cả các nút trong cây con. Đoạn code trong `Node() { ... }` được gọi là *constructor*, giúp ta khởi tạo mảng child bằng NULL.
- Hàm `addString(string s)`: Dùng để thêm một xâu ký tự vào cây trie. Trong hàm này ta có một con trỏ `Node *p`. Ban đầu con trỏ trỏ vào gốc cây. Ta lần lượt duyệt qua các kí tự của xâu $s$, mỗi kí tự duyệt qua ta "đi" xuống một bước trên cây, duy trì sao cho con trỏ `p` luôn trỏ vào nút ứng với tiền tố kết thúc bởi kí tự đang xét. Lệnh `if (p->child[...] == NULL) p->child[...] = new Node()` có nghĩa là *nếu nút cần đi tới chưa tồn tại trên cây, ta phải tạo ra nút đó*. Lệnh `p = p->child[...]` chính là ta đã "nhảy" một bước xuống lớp xâu hơn của cây.
- Hàm `dfs` làm quá trình DFS và tính các giá trị. Hàm này có logic giống hệt DFS trên cây bình thường. Chỉ khác rằng, mọi khi bạn đánh số các nút từ $1$ tới $n$, do đó ta có hàm `void dfs(int u)`. Còn ở đây ta không đánh số mà dùng con trỏ, do đó ta dùng `void dfs(Node *p)`.

Các lỗi hay mắc khi cài đặt trie:
- Thiếu constructor trong `struct Node`: Nếu không có constructor khởi tạo mảng `Node *child[26]` bằng NULL, các con trỏ **không mang giá trị NULL** và do đó bạn **sẽ bị run-time error**.
- Quên khởi tạo gốc cây `root = new Node()` (dòng thứ 2 ở hàm `main`). Nếu thiếu dòng này, bạn **chắc chắn bị run-time error** do cây của bạn chưa có gốc thì chưa thể thêm các nút khác được.
- Viết sai hàm `addString`. Sẽ có nhiều bạn khi mới code sẽ bị sai nhu dưới đây. Các bạn thử đoán xem lỗi sai là gì:

```cpp
void addString(const string &s) {
    Node *p = root;
    REP(i, s.size()) {
        p = p->child[s[i] - ''a''];
        if (p == NULL)
            p = new Node();
        p->high = i + 1;
    }
}
```

Một số bài tập dùng trie cho các bạn luyện tập:
- [Trie Sharding, Google Code Jam 2014 round 2, problem D](https://code.google.com/codejam/contest/3014486/dashboard#s=p3). Xem code tại [đây](https://ideone.com/EwHSOF)
- [Short Code, CF 476 div.2, problem E](https://codeforces.com/contest/965/problem/E). Xem code tại [đây](https://codeforces.com/contest/965/submission/37609430)
- [Lexicographical Disorder, AtCoder - CODE FESTIVAL 2016 round B, problem E](https://atcoder.jp/contests/code-festival-2016-qualb/tasks/codefestival_2016_qualB_e). Xem code tại [đây](https://ideone.com/46ONEE)

## b. Kỹ thuật gộp set trên cây
## c. Persistent Segment Tree
Sử dụng con trỏ để cài đặt Persistent Segment Tree khá phổ biến, do đây là một loại cây nhị phân mà bạn cần cài đặt nhiều "phiên bản" khác nhau. Do việc cài đặt rất phức tạp, mình chỉ cho các bạn xem code chứ không thể phân tích chi tiết được. Khi đọc code của mình, bạn chỉ cần đọc phần `class PersistentSegmentTree`. Các phần còn lại không liên quan trực tiếp đến CTDL, chỉ là để giải bài toán.

Bài tập liên quan:
- [Persistent Bookcase, CF 368 Div.2, problem D](https://codeforces.com/contest/707/problem/D). Xem code tại [đây](https://codeforces.com/contest/707/submission/19992150)
- [Lazy Learner, The 2018 ICPC Hanoi Regional Contest, problem L](https://hanoi18.kattis.com/problems/lazylearner).

## d. Balanced Binary Search Tree (Red-black Tree, AVL, Splay Tree...)
', 'int a = 1;
int &b = a;
b = 2;
cout << a << endl; // it prints 2, not 1 (!)
a = 3;
cout << b << endl; // it prints 3, not 2 (!)', '2026-10-06T10:32:12.805915');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_cpp_string', 'Xâu trong C++', 'languages', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/languages/cpp/string.md', '["xử lý chuỗi", "string", "chuỗi c++", "char*", "getline"]', 'Bài viết sưu tầm trên mạng.', '# Xâu trong C++

Bài viết sưu tầm trên mạng.

# 0. Kiểu chuỗi của C và hạn chế

Khi mới học C, chắc các bạn đều rất bối rối khi làm việc với xâu ký tự, việc sử dụng con trỏ lưu xâu ký tự rất phức tạp, dễ gây lỗi khiến nhiều người cho rằng nó không bằng xâu ký tự trong Pascal.

Các chương trình C++ có thể sử dụng chuỗi theo cách thức cũ của Ngôn ngữ C (trong bài viết này gọi là C-String): mảng các ký tự kết thúc bởi ký tự mã ASCII là 0 (ký tự `\0`) cùng với các hàm thư viện khai báo trong `<string.h>`. Có nhiều bất tiện khi dùng theo cách thức này:

- Người lập trình phải chủ động kiểm soát bộ nhớ cấp phát cho chuỗi ký tự. Nói chung là phải am hiểu và rất thông thạo về kỹ thuật dùng bộ nhớ và con trỏ thì chương trình mới tránh được các lỗi về kỹ thuật;
- Không thể gán giá trị hay sử dụng phép toán `+` (ghép chuỗi) và các phép toán so sánh như: `>` (lớn hơn), `<` (nhỏ hơn),... mà phải gọi các hàm thư viện trong `<string.h>`;
- Nếu dùng kỹ thuật cấp phát động thì phải quản lý việc cấp thêm bộ nhớ khi chuỗi dãn ra (chẳng hạn do ghép chuỗi) và phải hủy bộ nhớ (khi không dùng nữa) để tránh việc cạn kiệt bộ nhớ của máy tính trong trường hợp có nhiều chương trình hoạt động đồng thời.

# 1. Kiểu chuỗi string trong thư viện STL của C++

Thư viện chuẩn STL (Standard Template Library) cung cấp kiểu `string` (xâu ký tự), giúp các bạn tránh khỏi hoàn toàn các phiền phức nêu trên.Các chỉ thị `#include` cần khai báo để sử dụng string:

```cpp
#include <string>
using std::string;
//using namespace std;
```

Nếu bạn muốn tận dụng các hàm của C-String, cần chuyển đổi giữa 2 kiểu dữ liệu này:

- Chuyển từ `string` sang C-String:

  ```cpp
  string s;
  s.c_str();
  ```

- Chuyển từ C-String sang `string`:

  ```cpp
  char *s_old = "ABC";
  string s(s_old);
  ```

# 2. Các phương thức, phép toán tiện ích của kiểu string

Kiểu `string` của STL hỗ trợ các nhóm phương thức và phép toán tiện ích sau đây.

## a) Các phép toán và phương thức cơ bản

- Các toán tử `+`, `+=` dùng để ghép hai chuỗi và cũng để ghép một ký tự vào chuỗi;
- Các phép so sánh theo thứ tự từ điển: `==` (bằng nhau), `!=` (khác nhau), `>` (lớn hơn), `>=` (lớn hơn hay bằng), `<` (nhỏ hơn), `<=` (nhỏ hơn hay bằng);
- Hàm `length()` và phép lấy chỉ số `[]` để duyệt từng ký tự của chuỗi: nếu `s` là biến kiểu `string` thì `s[i]` là ký tự thứ `i` của `s` với $0 \le i < s.length()$;
- Phép gán `=` dùng để gán biến kiểu `string` bằng một chuỗi, hoặc bằng `string` khác, chẳng hạn: `string s="ABCDEF"`; hay `s1=s2`; mà không cần copy xâu.

- Những constructor thường sử dụng nhất:

  ```cpp
  string();
  string(const char *str); // char* là kiểu dữ liệu xâu của C
  string(const string &str);
  ```

- Có thể dùng toán tử `<<` với `cout` để xuất một chuỗi ra màn hình hoặc dùng toán tử `>>` với `cin` để nhập một chuỗi ký tự đến khi gặp một khoảng trống thì dừng.

  ```cpp
  char st[] = "ABCDEF";
  string s;
  s = "XYZ";
  cout << s << endl;
  s = st;
  cout << s.length() << " : " << s << endl;
  ```

- Một vấn đề thường nảy sinh trong các ứng dụng có sử dụng C-string: một C-String chưa khởi tạo cần được gán NULL. Tuy nhiên, rất nhiều hàm thư viện của C-String sẽ gặp sự cố trong thời gian chạy khi gặp đối tượng C-String là NULL. Chẳng hạn, lệnh

  ```cpp
  char *x = NULL;
  cout << strlen(x);
  ```

  được một số trình biên dịch chấp nhận, nhưng với nhiều hiện thực khác của thư viện C-String, thì gặp lỗi trong thời gian chạy. string không gặp vấn đề này, ta hoàn toàn có thể cho 1 xâu là rỗng mà không gặp bất cứ lỗi nào: string s="";

String thực chất là một `vector<char>` có bổ sung thêm một số hàm và thuộc tính, do đó, nó có toàn bộ các tính chất của 1 vector, như hàm `size()`, `push_back()`, toán tử `[]`, ...

- Các hàm từ `vector`:
  - `v.size()`: Số lượng phần tử
  - `v.empty()`: Trả về 1 nếu chuỗi rỗng, 0 nếu ngược lại.
  - `v.max_size()`: Trả về số lượng phần tử tối đa đã được cấp phát
  - `v1 == v2`: Trả về 1 nếu hai chuỗi giống nhau
  - `v1 != v2`: Trả về 1 nếu hai chuỗi khác nhau
  - `v.begin()`: Trả về **iterator** đầu tiên của chuỗi
  - `v.end()`: Trả về iterator cuối cùng của chuỗi (trỏ vào sau kí tự cuối cùng)
  - `v.front()`: Trả về phần tử đầu tiên của chuỗi
  - `v.back()`: Trả về phần tử cuối cùng của chuỗi
  - `v1.swap(v2)`: Hoán đổi 2 chuỗi với nhau (giống việc hoán đổi giá trị của 2 biến)

  ```cpp
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string s = "Hello string";                // Khai báo biến kiểu string
      cout << "Noi dung string: " << s << endl; // In nôi dung string ra màn hình
      cout << "Chieu dai cua string: " << s.size() << endl;
      // Chiều dài
      cout << "Ky tu 0: " << s[0] << endl; // In ký tự đầu tiên của xâu
      cout << "Ky tu 1: " << s[1] << endl; // In ký tự thứ 2
      cout << "Ky tu 2: " << s[2] << endl; // In ký tự thứ 3
      return 0;
  }
  ```

- Nhập một `string` trên 1 dòng (chú ý `cin` sẽ chỉ đọc đến dấu cách hoặc xuống dòng đầu tiên):
  `istream& getline ( istream& in, string& str, char delimiter = ‘\n’);`

  Đọc 1 dòng văn bản từ `istream in` (có thể là file hay đối tượng chuẩn cin) từng ký tự đến khi ký tự delimiter được nhập vào (mặc định là `\n`)

  ```cpp
  // getline with strings
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string str;
      short age;
      cout << "Please enter full name and age" << endl;
      getline(cin, str) >> age;
      cout << "Thank you " << str << "!\n";
      return 0;
  }
  ```

## b) Các phương thức chèn, xóa, lấy chuỗi con:

- Phương thức `substr(int pos, int nchar)` trích ra chuỗi con của một chuỗi cho trước, ví dụ `str.substr(2,4)` trả về chuỗi con gồm 4 ký tự của chuỗi `str` kể từ ký tự ở vị trí thứ 2 (ký tự đầu tiên của chuỗi ở vị trí 0).

  ```cpp
  //get substring
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string s = "ConCho chay qua rao";
      cout << s.substr(2, 4) << endl;
      // cout << new string(str.begin()+2, str.begin()+2+4);
      return 0;
  }
  ```

- Phương thức `insert()` chèn thêm ký tự hay chuỗi vào một vị trí nào đó của chuỗi `str` cho trước. Có nhiều cách dùng phương thức này:
  - `str.insert(int pos, char* s)`; chèn `s` (mảng ký tự kết thúc `\0`) vào vị trí `pos` của `str`;
  - `str.insert(int pos, string s)`; chèn chuỗi `s` (kiểu `string`) vào vị trí `pos` của chuỗi `str`;
  - `str.insert(int pos, int n, int ch)`; chèn `n` lần ký tự `ch` vào vị trí `pos` của chuỗi `str`;

  ```cpp
  // inserting into a string
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string str = "day la .. xau thu";
      string istr = "them";
      str.insert(8, istr);
      cout << str << endl;
      return 0;
  }
  ```

- Phương thức `str.erase(int pos, int n)` xóa `n` ký tự của chuỗi `str` kể từ vị trí `pos`; nếu không quy định giá trị `n` thì tất cả các ký tự của `str` từ vị trí `pos` trở đi sẽ bị xóa

  ```cpp
  // erase from a string
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string str = "day cung la xau thu";
      str.erase(0, 3); // " cung la xau thu"
      cout << str << endl;
      str.erase(6, 2);
      cout << str << endl; // " cung xau thu"
      return 0;
  }
  ```

## c) So sánh

Bạn có thể đơn giản là sử dụng những toán tử quan hệ (`==`, `!=`, `<`, `<=`, `>=`) được định nghĩa sẵn. Tuy nhiên, nếu muốn so sánh một phần của một chuỗi thì sẽ cần sử dụng phương thức `compare()`:

```cpp
int compare(const string &str) const;
int compare(const char *s) const;
int compare(size_t pos1, size_t n1, const string &str) const;
int compare(size_t pos1, size_t n1, const char *s) const;
int compare(size_t pos1, size_t n1, const string &str, size_t pos2, size_t n2) const;
int compare(size_t pos1, size_t n1, const char *s, size_t n2) const;
```

Hàm trả về 0 khi hai chuỗi bằng nhau và lớn hơn hoặc nhỏ hơn 0 cho trường hợp khác
Ví dụ:

```cpp
// comparing apples with apples
#include <iostream>
#include <string>
using namespace std;
int main() {
    string str1("green apple");
    string str2("red apple");
    if (str1.compare(str2) != 0)
        cout << str1 << " is not " << str2 << "\n";
    if (str1.compare(6, 5, "apple") == 0)
        cout << "still, " << str1 << " is an apple\n";
    if (str2.compare(str2.size() - 5, 5, "apple") == 0)
        cout << "and " << str2 << " is also an apple\n";
    if (str1.compare(6, 5, str2, 4, 5) == 0)
        cout << "therefore, both are apples\n";
    return 0;
}
```

## d) Các phương thức tìm kiếm và thay thế

- Phương thức `find()` tìm kiếm xem một ký tự hay một chuỗi nào đó có xuất hiện trong một chuỗi `str` cho trước hay không. Có nhiều cách dùng phương thức này:

  ```cpp
  str.find(int ch, int pos = 0); tìm ký tự ch kể từ vị trí pos đến cuối chuỗi str
  str.find(char *s, int pos = 0); tìm s (mảng ký tự kết thúc ‘\0’) kể từ vị trí pos đến cuối
  str.find(string& s, int pos = 0); tìm chuỗi s kể từ vị trí pos đến cuối chuỗi.
  ```

  Nếu không quy định giá trị pos thì hiểu mặc nhiên là 0; nếu tìm có thì phương thức trả về vị trí xuất hiện đầu tiên, ngược lại trả về giá trị -1.

  ```cpp
  //find substring
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string str = "ConCho chay qua rao";
      cout << str.find("chay") << endl;      // 7
      cout << (int)str.find("Chay") << endl; // -1
      return 0;
  }
  ```

- Hàm tìm kiếm ngược (`rfind`)

  ```cpp
  //find from back
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      string str = "ConCho chay qua chay qua rao";
      cout << str.find("chay") << endl;       // 7
      cout << (int)str.rfind("chay") << endl; // 16
      return 0;
  }
  ```

- Phương thức `replace()` thay thế một đoạn con trong chuỗi `str` cho trước (đoạn con kể từ một vị trí `pos` và đếm tới `nchar` ký tự ký tự về phía cuối chuỗi) bởi một chuỗi `s` nào đó, hoặc bởi `n` ký tự `ch` nào đó. Có nhiều cách dùng, thứ tự tham số như sau:

  ```cpp
  str.replace(int pos, int nchar, char *s);
  str.replace(int pos, int nchar, string s);
  str.replace(int pos, int nchar, int n, int ch);

  string str = "con cho la con cho con. Con meo ko phai la con cho";
  str.replace(4, 3, "CHO"); // "con CHO la con cho con. Con meo ko phai la con cho";
  cout << str << endl;
  getchar();
  ```

## e) Tách xâu

Trong việc xử lý xâu ký tự, không thể thiếu được các thao tác tách xâu ký tự thành nhiều xâu ký tự con thông qua các ký tự ngăn cách. Các hàm này có sẵn trong các ngôn ngữ khác như Visual Basic, Java, hay thậm chí là trong `<string.h>`. Với STL, các bạn có thể dễ dàng làm điều này với `stringstream`:

```cpp
#include <sstream>
string S = "Xin chao tat ca cac ban"; // Khởi tạo giá trị của xâu
stringstream ss(S);                   // Khởi tạo stringstream từ xâu S

string token;

while (ss >> token) { // Đọc lần lượt các phần của xâu. Các phần tách nhau bởi dấu cách hoặc xuống dòng.
    cout << token << endl;
}
```

Output:

```
Xin
chao
tat
ca
cac
ban
```

Chú ý rằng, cách này cũng có thể dễ áp dụng nếu bạn muốn chuyển số thành xâu (hoặc ngược lại), tách 1 xâu thành nhiều số.

Nếu không muốn sử dụng `stringstream`, các bạn cũng có thể tự xây dựng hàm tách xâu như sau:

```cpp
string S = "Xin chao tat ca cac ban"; // Khởi tạo giá trị của xâu
string::iterator t, t2;               // Các biến lặp
vector<string> split;                 // Mảng các xâu (lưu kết quả tách)

for (t = S.begin(); t < S.end();) {
    // Lặp từ vị trí bắt đầu
    t2 = find(t, S.end(), '' ''); // TÌm ký tự space '' '' đầu tiên
    // kể từ vị trí t
    if (t != t2)
        split.push_back(string(t, t2)); // Lấy xâu ký tự giữa 2 vị trí
    t = t2 + 1;                         // Chuyển sang vị trí sau
}
for (int i = 0; i < split.size(); i++)
    cout << split[i] << endl; // In mảng các xâu ký tự
getchar();
```

Output:

```text
Xin
chao
tat
ca
cac
ban
```

Đoạn chương tr.nh sử dụng các kỹ thuật sau

- Phương thức `find(vị_trí_đầu, vị_trí_cuối, ký_tự_tìm)` dùng để tìm vị trí đầu tiên của `ký_tự_tìm` bắt đầu từ `vị_trí_đầu`. Hàm này trả về vị trí của ký tự tìm được (nếu tìm thấy) hoặc `vị_trí_cuối` (nếu không tìm thấy)
- `string` có thể khởi tạo từ một đoạn ký tự con của một xâu ký tự khác với cú pháp `string(vị_trí_đầu, vị_trí_cuối)`
- Đoạn chương trình thực hiện tách các xâu ký tự kể cả trong trường hợp có nhiều ký tự `space` nằm liên tiếp nhau. Một cách đơn giản hơn là bạn có thể gọi hàm `strtok()` trong `string.h` để làm việc này, nhưng không may là hàm này thao tác trên `char*` chứ không phải `string`. Hàm thành viên `c_str()` sẽ giúp bạn chuyển từ `string` thành dạng `const charT* c_str () const`;

Hàm này cũng tự động sinh ra ký tự null chèn vào cuối xâu.

Từ prototype ta cũng thấy được hàm trả về một hằng chuỗi, điều này đồng nghĩa với việc ta không thể thay đổi chuỗi trả về.
Gọi phương thức c_str();

```cpp
string s = "some_string";
cout << s.c_str() << endl;
cout << strlen(s.c_str()) << endl;
```

Sau đây là ví dụ bên trên được viết lại dùng hàm thành viên `c_str()` và các hàm trong `<string.h>`

```cpp
// strings vs c-strings
#include <iostream>
#include <string.h>
#include <string>
using std::cout;
using std::endl;
using std::string;
int main() {
    char *cstr;
    char *p;
    string str("Xin chao tat ca cac ban");
    cstr = new char[str.size() + 1];
    strcpy(cstr, str.c_str());
    // cstr là 1 bản sao c-string của str
    p = strtok(cstr, " ");
    while (p != NULL) {
        cout << p << endl;
        p = strtok(NULL, " ");
    }
    delete[] cstr;
    return 0;
}
```

Output:

```
Xin
chao
tat
ca
cac
ban
```

## f) Chuyển đổi hàng loạt với transform

```cpp
OutputIterator transform(InputIterator first,
                         InputIterator last,
                         OutputIterator result,
                         UnaryOperation unary_op);

#include <algorithm> //for transform
#include <cctype>    // for toupper
#include <iostream>
#include <string>
using namespace std;
char alphabet(char c) {
    static char ch = ''a'';
    return ch++;
}
int main() {
    string s("this is a lower case string");
    transform(s.begin(), s.end(), s.begin(), (int (*)(int))toupper);
    cout << s << endl;
    transform(s.begin(), s.end(), s.begin(), alphabet);
    cout << s;
    return 0;
}
```

## g) Một số phương thức khác

Còn nhiều phương thức tiện ích khác như: `append()`, `rfind()`, `find_first_not_of()`, `find_last_not_of()`, `swap()`. Cách dùng các hàm này đều được trình bày trong hệ thống hướng dẫn (help) của các môi trường có hỗ trợ STL (trong VC++ là MSDN). Ngoài ra các phương thức như `find_first_of()` tương tự như `find()`, `find_last_of()` tương tự như `rfind()`
', '#include <string>
using std::string;
//using namespace std;', '2026-10-06T10:32:13.262681');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_binary_search', 'Thuật toán tìm kiếm nhị phân', 'basic', '- Nguyễn Nhật Minh Khôi - VNU University of Science. Biên soạn lại từ bản dịch của Vũ Thị Thiên Anh', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/basic/binary-search.md', '["tìm kiếm nhị phân", "binary search", "chặt nhị phân", "lower_bound", "upper_bound"]', 'Tìm kiếm nhị phân (hay còn gọi là chặt nhị phân) là một trong số các thuật toán cơ bản của khoa học máy tính. Trong bài viết này, chúng ta sẽ xây dựng một nền tảng lý thuyết, sau đó đưa ra cách cài đặt thuật toán này một cách chuẩn xác.', '# Thuật toán tìm kiếm nhị phân

**Nguồn**: [Topcoder](https://www.topcoder.com/thrive/articles/Binary%20Search)

**Người dịch**:
- Nguyễn Nhật Minh Khôi - VNU University of Science. Biên soạn lại từ bản dịch của Vũ Thị Thiên Anh

**Reviewer**: Hoàng Xuân Nhật, Trần Quang Lộc

Tìm kiếm nhị phân (hay còn gọi là chặt nhị phân) là một trong số các thuật toán cơ bản của khoa học máy tính. Trong bài viết này, chúng ta sẽ xây dựng một nền tảng lý thuyết, sau đó đưa ra cách cài đặt thuật toán này một cách chuẩn xác.

## Bài toán mở đầu: Tìm giá trị cho trước trong một dãy đã sắp xếp

Mở đầu, ta sẽ đến với bài toán sử dụng tìm kiếm nhị phân đơn giản nhất. Đề bài như sau:
> Cho trước một dãy $A$ *được sắp tăng dần*, trả về vị trí của phần tử có giá trị $x$ trong $A$. Lưu ý: để đơn giản, ta giả sử các phần tử trong mảng $A$ có giá trị phân biệt.

### Ví dụ
Đầu tiên, ta sẽ xét một ví dụ để thấy được tư tưởng của thuật toán.
Cho $A = [0, 5, 13, 19, 2, 41, 55, 68, 72, 81, 98]$ và $x = 55$, thuật toán sẽ diễn ra như hình dưới:
![](/uploads/algo/basic/binary-search/binary_search_first_example.png)

Ở lượt tìm đầu tiên, không gian tìm kiếm là tập hợp $S = \{1,\ldots, 11\}$ gồm tất cả các chỉ số của mảng. Bắt đầu với việc chọn [phần tử trung vị](https://vi.wikipedia.org/wiki/S%E1%BB%91_trung_v%E1%BB%8B) của không gian tìm kiếm hiện tại (chính là $6$), ta nhận xét $A[6]=41 < 55 = x$. Do theo đề bài mảng $A$ được sắp xếp tăng dần, ta biết được tất cả các phần tử có chỉ số $1,\ldots, 6$ đều nhỏ hơn giá trị cần tìm $x$. Do đó, chúng *chắc chắn không thể là kết quả*, khi đó không gian tìm kiếm có thể thu hẹp lại $S = \{7,\ldots, 11\}$, tức *giảm đi một nửa.*

Tương tự, ở lượt tìm thứ hai, ta xét phần tử trung vị của không gian tìm kiếm hiện tại (chính là $9$), nhận thấy $A[9]=72 > 55 = x$. Cũng do mảng $A$ được sắp xếp tăng dần, ta biết được tất cả các phần tử có vị trí từ $9,\ldots, 11$ đều lớn hơn giá trị cần tìm $x$. Do đó, chúng chắc chắn không thể là kết quả, khi đó không gian tìm kiếm sẽ lại giảm đi một nửa $S = \{7,\ldots, 8\}$.

Ở lượt tìm cuối cùng, ta cũng xét phần tử trung vị của không gian tìm kiếm hiện tại ở vị trí $7$ (ở đây số lượng phần tử của không gian tìm kiếm là chẵn, do đó có hai phần tử trung vị, ta có thể chọn một trong hai đều được, ở ví dụ này ta chọn phần tử trung vị đầu tiên), Nhận thấy $A[7] = 55 = x$, ta kết luận $5$ chính là vị trí của phần tử cần tìm và dừng thuật toán.

### Tổng quát hóa bài toán

Từ ví dụ trên, ta có thể dễ dàng hiểu được ý tưởng của thuật toán tìm kiếm nhị phân. Đúng như tên gọi, thuật toán sẽ liên tục chia không gian tìm kiếm thành hai nửa và loại một nửa đi. Thuật toán có thể trình bày như sau:
1. Ta duy trì một không gian tìm kiếm $S$ là một dãy con các giá trị có thể là kết quả (ở đây là chỉ số các phần tử trong $A$). Ban đầu, không gian tìm kiếm là toàn bộ các chỉ số của mảng $S=\{1,\ldots, n\}$ với $n$ là chỉ số phần tử cuối cùng của $A$.
2. Ở mỗi bước, thuật toán so sánh giá trị cần tìm với phần tử có chỉ số là trung vị trong không gian tìm kiếm. Dựa trên sự so sánh đó, cộng thêm việc ta biết dãy $A$ có thứ tự, ta có thể loại một nửa số phần tử của $S$. Lặp đi lặp lại quá trình này, cuối cùng ta sẽ được một không gian tìm kiếm bao gồm một phần tử duy nhất.
3. Khi đó, nếu phần tử duy nhất đó bằng với giá trị cần tìm $x$ thì đó là nghiệm của bài toán, nếu không thì bài toán vô nghiệm.

Ở đây có hai lưu ý khi cài đặt thuật toán:
- Do không gian tìm kiếm luôn là một đoạn liên tục các giá trị nguyên, ta không cần lưu tất cả phần tử của không gian khi tìm kiếm mà chỉ cần duy trì hai biến `low` và `high` tượng trưng cho phần tử *đầu* và *cuối* của đoạn.
- Ta có thể tối ưu thuật toán hơn bằng việc *dừng sớm* nếu trong quá trình so sánh gặp một phần tử trung vị thỏa yêu cầu đề bài chứ không cần đợi đến khi không gian tìm kiếm chỉ còn một phần tử.

Dưới đây là code minh họa viết bằng ngôn ngữ C++. Trong trường hợp giá trị cần tìm không tồn tại trong khoảng tìm kiếm thì thuật toán sẽ trả về $-1$

```cpp
int binary_search(int A[], int sizeA, int target) {
    int lo = 1, hi = sizeA;
    while (lo <= hi) {
        int mid = lo + (hi - lo) / 2;
        if (A[mid] == target)
            return mid;
        else if (A[mid] < target)
            lo = mid + 1;
        else
            hi = mid - 1;
    }
    // không tìm thấy giá trị target trong mảng A
    return -1;
}
```
### Độ phức tạp thuật toán
Ở mỗi bước, kích thước không gian tìm kiếm bị giảm đi một nửa. Ta dễ thấy rằng độ phức tạp của thuật toán là $\mathcal{O}(\log(N))$ với $N$ là số phần tử ban đầu của không gian tìm kiếm.

Hàm $\log$ là một hàm tăng rất chậm. Ví dụ như nếu phải tìm kiếm giá trị trong 1 triệu phần tử, với tìm kiếm nhị phân chỉ cần tối đa là 21 bước.

### Tìm kiếm nhị phân trong thư viện chuẩn STL
C++ Standard Template Library đã cài đặt sẵn tìm kiếm nhị phân bằng các hàm [lower_bound](https://www.cplusplus.com/reference/algorithm/lower_bound/), [upper_bound](https://www.cplusplus.com/reference/algorithm/upper_bound/), [binary_search](https://www.cplusplus.com/reference/algorithm/binary_search/), [equal_range](https://www.cplusplus.com/reference/algorithm/equal_range/), bạn đọc có thể tham khảo tùy thuộc vào mục đích sử dụng.

## Tìm kiếm nhị phân tổng quát
Ở phần trước, ta đã xét dạng đơn giản nhất của tìm kiếm nhị phân. Trong phần này, chúng ta sẽ tổng quát hóa thuật tìm kiếm nhị phân cho một lớp bài toán rộng hơn. Ta sẽ thấy tìm kiếm nhị phân có thể mở rộng để áp dụng cho **bất kỳ loại [hàm số đơn điệu](https://vi.wikipedia.org/wiki/H%C3%A0m_s%E1%BB%91_%C4%91%C6%A1n_%C4%91i%E1%BB%87u) nào nhận tham số đầu vào là số nguyên**. Nói một cách đơn giản, một hàm số đơn điệu là *một hàm tăng hoặc một hàm giảm*. Trong ví dụ đầu bài, hiển nhiên mảng sắp xếp tăng có thể xem như một "hàm tăng".

### Cơ sở lý thuyết: Định lý chính của tìm kiếm nhị phân

Khi gặp một bài toán mà ta đoán được có thể dùng tìm kiếm nhị phân để giải, thì ta phải chứng minh tính đúng đắn suy luận của chúng ta. Do đó, xây dựng một cơ sở lý thuyết vững chắc là vô cùng cần thiết. Sau đây, tôi sẽ trình bày một lớp tổng quát hóa nữa cho các bài toán có thể áp dụng tìm kiếm nhị phân, song song đó là ví dụ thực tế với bài toán mở đầu.

Cho không gian tìm kiếm $S$ bao gồm các ứng cử viên cho kết quả của bài toán. Ta định nghĩa môt hàm kiểm tra $P: S \rightarrow \{\texttt{true}, \texttt{false}\}$ là hàm nhận một ứng cử viên $x \in S$ và trả về giá trị $\texttt{true}/\texttt{false}$ cho biết $x$ có hợp lệ hay không (tùy vào bài toán mà định nghĩa hợp lệ sẽ khác nhau). Hiểu đơn giản, hàm $P$ là hàm "kiểm tra" một tính chất nào đó, xem một ứng cử viên cho kết quả của bài toán có thỏa tính chất đó không.
> Với ví dụ ở đầu bài, thay vì tìm chỉ số của phần tử có giá trị $55$, ta có thể viết lại đề bài thành "tìm chỉ số nhỏ nhất sao cho phần tử ở chỉ số đó lớn hơn hoặc bằng $55$". Khi đó, không gian tìm kiếm ban đầu $S = \{1,\ldots, 11\}$ (ban đầu mọi chỉ số của mảng đều có thể là kết quả) và $P(x) = \texttt{boolean}(a[x] \geq 55)$ trả về $\texttt{true}$ nếu $a[x] \geq 55$ và $\texttt{false}$ nếu $a[x] < 55$.

**Định lý chính** (Main Theorem) cho biết rằng: một bài toán chỉ có thể áp dụng tìm kiếm nhị phân nếu và chỉ nếu hàm kiểm tra $P$ của bài toán thỏa mãn
$$
\forall x, y \in S, y > x \wedge P(x) = \texttt{true} \Rightarrow P(y) = \texttt{true} \tag{*}
$$
Lưu ý rằng tính chất trên của hàm kiểm tra $P$ cũng tương đương với tính chất sau:

$$
\forall x, y \in S, y < x \wedge P(x) = \texttt{false} \Rightarrow P(y) = \texttt{false} \tag{**}
$$

Sự tương đương ở đây có thể chứng minh bằng [phương pháp phản chứng](https://hoctoan24h.net/chung-minh-dinh-ly-bang-phuong-phap-phan-chung/), để tránh bài viết quá dài dòng, phần chứng minh để lại cho bạn đọc.

Định lý chính mang cho chúng ta một thông tin rất quan trọng, đó là **điều kiện cần và đủ để một bài toán có thể giải bằng tìm kiếm nhị phân**. Để hiểu được tại sao, chúng ta hãy phân tích kĩ hơn ý nghĩa tính chất của hàm $P$ mà định lý yêu cầu

- Tính chất $(*)$ có thể giải thích như sau: **nếu $x$ hợp lệ thì mọi phần tử $y > x$ đều hợp lệ**. Tính chất này giúp chúng ta loại đi nửa sau của không gian tìm kiếm do đã biết chắc $x$ là phần tử nhỏ nhất trong nửa sau hợp lệ, ta ghi nhận $x$ là kết quả tạm thời và tiếp tục tìm xem có phần tử nào ở nửa đầu (nhỏ hơn $x$) hợp lệ hay không.
- Tương tự, tính chất $(**)$ có thể giải thích như sau: **nếu $x$ không hợp lệ thì mọi phần tử $y < x$ đều không hợp lệ**. Tính chất này giúp chúng ta loại đi nửa trước của không gian tìm kiếm do đã biết chắc chúng không hợp lệ, ta chỉ quan tâm những phần tử ở nửa sau (lớn hơn $x$) mà ta chưa biết thông tin chúng có hợp lệ hay không.

Nếu ta tính giá trị $P(x)$ cho từng phần tử trong $S$ ban đầu, ta sẽ được một dãy liên tiếp các giá trị $\texttt{false}$ liền kề một dãy liên tiếp các giá trị $\texttt{true}$ (từ nay gọi là dãy $P(S)$). Dễ thấy ta có thể áp dụng tìm kiếm nhị phân trên dãy $P(S)$ mới này để tìm giá trị $x$ *nhỏ nhất* thỏa mãn $P(x) = \texttt{true}$ (hoặc cũng có thể làm cách tìm giá trị $x$ *lớn nhất* mà $P(x) = \texttt{false}$, tuy nhiên ở đây ta không chọn cách này).
> Với ví dụ đầu bài, như đã nói $P(x) = \texttt{boolean}(A[x] \geq 55)$. Dễ thấy $P$ thỏa mãn tính chất đầu tiên, do $A$ được sắp tăng dần nên nếu $A[x] \geq 55$ thì chắc chắn các phần tử $y$ sau $x$ đều thỏa $A[y] \geq A[x] \geq 55$. Tương tự ta cũng suy ra được, nếu $A[x] < 55$ thì chắc chắn các phần tử $y$ trước $x$ đều thỏa $A[y] \leq A[x] < 55$.
Áp dụng hàm $P(x) = \texttt{boolean}(A[x] \geq 55)$ cho từng phần tử của $S=\{1,\ldots, 11\}$ ta có hình sau
> ![](/uploads/algo/basic/binary-search/binary_search_apply_P_to_A.png)

Chú ý rằng ta thấy có thể dễ dàng xây dựng định lý chính dựa trên một hàm kiểm tra $P$ ngược lại, tức $P(S)$ sẽ là một dãy $\texttt{true}$ liên tiếp theo sau bởi $\texttt{false}$ liên tiếp. Tuy nhiên, ở đây ta sẽ chỉ xét một trường hợp để bài viết ngắn gọn hơn, trường hợp còn lại có thể làm tương tự.

Từ định lý trên, ta rút ra được mấu chốt để giải một bài toán dùng tìm kiếm nhị phân là ta cần **thiết kế được hàm $P$ hợp lý sao cho thỏa mãn điều kiện trong định lý chính**.

Cuối cùng, tại sao ta phải tốn công tổng quát hóa thuật toán này thay vì dùng cách làm đơn giản ở ví dụ đầu? Đó là vì nhiều bài toán không thể ở dưới dạng tìm kiếm một giá trị cụ thể, nhưng ta lại có thể định nghĩa một hàm kiểm tra thỏa yêu cầu định lý chính để có thể áp dụng tìm kiếm nhị phân. Bằng cách đó, ta có thể mở rộng lớp bài toán có thể giải bằng tìm kiếm nhị phân.

Ví dụ điển hình cho việc áp dụng định lý là với bài toán *Tìm căn bậc hai*, thay vì hỏi *"Số $x$ nào bình phương lên thì bằng $a$?"* và tìm kiếm tuần tự tất cả các trường hợp, ta có thể định nghĩa hàm $P(x)$ trả lời cho câu hỏi *"$x^{2}$ có lớn hơn hoặc bằng $a$ hay không?"* sau đó dùng tìm kiếm nhị phân để tìm $x$ nhỏ nhất thỏa mãn. Với cách làm này ta có thể đơn giản hóa bài toán thành một bài toán yes/no, hơn thế còn giảm độ phức tạp của bài toán từ $\mathcal{O}(n)$ xuống chỉ còn $\mathcal{O}(\log(n))$.

### Cài đặt thuật toán tổng quát

Trước khi cài đặt thuật toán, ta phải trả lời những câu hỏi sau:
1. Dãy $P(S)$ của bạn có dạng $\texttt{false}-\texttt{true}$ ($\texttt{false}$ liên tiếp rồi $\texttt{true}$ liên tiếp) hay $\texttt{true}-\texttt{false}$ (ngược lại)? Ở cài đặt phía dưới sẽ **mặc định dãy $P(S)$ có dạng $\texttt{false}-\texttt{true}$**, vì vậy nếu dãy $P(S)$ của bạn có dạng $\texttt{true}-\texttt{false}$, hãy đảo hàm $P(x)$ của bạn ngược lại.
2. Bài của bạn có luôn có nghiệm không? Nếu không hãy kiểm tra trước khi tìm kiếm nhị phân để tiết kiệm chi phí tính toán.
3. Mục tiêu của bạn là tìm phần tử $\texttt{false}$ lớn nhất hay tìm phần tử $\texttt{true}$ nhỏ nhất? Ở đây sẽ trình bày cả hai cách.
4. Nếu bài toán có nghiệm, hãy đảm bảo giá trị chặn dưới và chặn trên của khoảng tìm kiếm (biến `lo` và `hi`) là bắt đầu và kết thúc của một *khoảng đóng mà chắc chắn chứa kết quả cần tìm* (phần tử $x$ đầu tiên mà $P(x) = \texttt{true}$). Hãy đảm bảo điều kiện này trong lúc thu hẹp không gian tìm kiếm để tránh xảy ra lỗi.
5. Phạm vi tìm kiếm đã đủ rộng chưa? Sẽ có nhiều lúc chấm xong bạn nhận ra là mình thiếu vài trường hợp biên. Vì thời gian chạy chỉ tăng theo hàm logarit $\mathcal{O}(\log(N))$, bạn hoàn toàn có thể nâng rộng khoảng tìm kiếm ra mà ít khi lo bị quá thời gian. Tuy nhiên, phải để ý các lỗi như tràn mảng, tràn số,...
6. Luôn kiểm tra trường hợp $P(S) = [\texttt{false},\texttt{true}]$. Để hiểu lý do tại sao hãy đọc *Trường hợp 2* của cài đặt.

**TH1**: tìm $x$ nhỏ nhất mà $P(x) = \texttt{true}$. Dưới đây là đoạn code mẫu viết bằng C++.
```cpp
bool P(int x) {
    // Logic của hàm P ở đây
    return true; // thay giá trị này bằng giá trị đúng logic.
}

int binary_search(int lo, int hi) {
    while (lo < hi) {
        int mid = lo + (hi - lo) / 2;
        if (P(mid) == true)
            hi = mid;
        else
            lo = mid + 1;
    }

    if (P(lo) == false)
        return -1; // P(x) = false với mọi x thuộc S, bài toán vô nghiệm.

    return lo; // lo là giá trị x nhỏ nhất mà P(x) = true
}
```
Hai dòng quan trọng là $hi = mid$ và $lo = mid+1$, chúng giúp ta thu hẹp không gian tìm kiếm dần.

Khi $P(mid) = \texttt{true}$, ta có thể bỏ nửa sau của không gian tìm kiếm vì đã biết phần tử trong đó luôn hợp lệ. Tuy nhiên ta vẫn phải giữ $mid$ trong không gian tìm kiếm mới vì nó có thể là phần tử đầu tiên mà $P = \texttt{true}$. Do đó không gian tìm kiếm mới sẽ là $S=\{lo, mid\}$, ta gán $hi = mid$.

Tương tự, khi $P(mid) = \texttt{false}$, ta có thể bỏ nửa đầu (bao gồm cả phần tử $mid$) vì tất cả các phần tử này đều không hợp lệ. Lúc này không gian tìm kiếm mới sẽ là $S=\{mid + 1, hi\}$, ta gán $lo = mid+1$.

**TH2**: tìm $x$ lớn nhất mà $P(x) = \texttt{false}$, suy luận tương tự như trên, ta có đoạn code như sau:

```cpp
bool P(int x) {
    // Logic của hàm P ở đây
    return true; // thay giá trị này bằng giá trị đúng logic.
}

int binary_search(int lo, int hi) {
    while (lo < hi) {
        int mid = lo + (hi - lo + 1) / 2;
        if (P(mid) == true)
            hi = mid - 1;
        else
            lo = mid;
    }

    if (P(lo) == true)
        return -1; // P(x) = true với mọi x thuộc S, bài toán vô nghiệm.

    return lo; // lo là giá trị x lớn nhất mà P(x) = false
}
```

Bạn sẽ thắc mắc rằng tại sao cách tính $mid$ lại có một tí khác biệt so với thuật toán đầu tiên. Để hiểu được tại sao ta phải làm thế, ta sẽ xét trường hợp sau:  trong quá trình tìm kiếm, nếu tại một thời diểm nào đó mà dãy $P(S)$ tạo ra bởi các phần tử của không gian tìm kiếm có dạng như sau
<table>
<td>false</td> <td>true</td>
</table>

Nếu ta tính $mid = lo + \frac{hi-lo}{2}$, đoạn code sẽ lặp vô hạn. Nó sẽ luôn chọn phần tử trung vị là $mid = lo$, nhưng cận dưới $lo$ sẽ không di chuyển vì nó muốn giữ lại phần tử có $p = \texttt{false}$ thỏa yêu cầu tìm kiếm đó. Do đó, ta thay đổi công thức tính $mid$ thành $mid = lo + \frac{hi-lo+1}{2}$, làm như vậy sẽ khiến cận dưới sẽ được làm tròn lên thay vì làm tròn xuống, khi đó nó có thể loại bỏ phần tử $\texttt{true}$ trước khi xét phần tử $\texttt{false}$. Có nhiều cách làm khác để thực hiện điều này, tuy nhiên, đây là cách dễ hiểu nhất. Do vậy, *hãy luôn luôn kiểm tra thử trường hợp $P(S) = [\texttt{false}, \texttt{true}]$*.

Một điều có thể bạn đang thắc mắc nữa là tại sao để tìm trung vị ta tính $mid = lo + \frac{hi-lo}{2}$ chứ không phải $mid = \frac{hi+lo}{2}$. Sở dĩ phải làm như vậy là để tránh khả năng xảy ra lỗi làm tròn số nguyên, ta muốn phép chia được làm tròn xuống, về gần với cận dưới, tuy nhiên phép chia làm tròn khác khi có số âm, nên nếu $(lo+hi)$ là số âm thì kết quả sẽ bị làm tròn lên. Code như trong mẫu kia giúp quá trình tính toán đều được làm tròn đúng theo logic. Đối với các bài toán mà chỉ cần xử lý giá trị dương thì lỗi này không xảy ra.

### Cài đặt thuật toán với nửa khoảng
Cài đặt với đoạn đóng $[lo, hi]$ như trên có ưu điểm là dễ hiểu. Tuy nhiên, quay lại một chút với cơ sở lý thuyết: với dãy $P(S)$ có dạng $\texttt{false}-\texttt{true}$, thực tế ta nên chọn giá trị $lo$ và $hi$ mà $P(lo) = \texttt{false}$ và $P(hi) = \texttt{true}$ để đảm bảo luôn tìm được nghiệm. Do đó sẽ không ổn nếu như dãy $P(S)$ của ta đều toàn giá trị $\texttt{false}$ (tức vô nghiệm). Trong trường hợp này, cài đặt với đoạn đóng có thêm đoạn kiểm tra để `return - 1`.

Giải pháp cho trường hợp này chính là **cài đặt với nửa khoảng**. Để ý rằng trong trường hợp vô nghiệm, cách cài đặt với khoảng đóng sẽ *trả về cận trên $hi$ của đoạn tìm kiếm ban đầu* (do chỉ có cận dưới $lo$ liên tục dịch chuyển lên và chạm tới $hi$). Hơn nữa, *thuật toán của ta không bao giờ gọi $P(hi)$* vì để có $mid = hi$, ta đã phải có $lo = hi$, nhưng lúc đó thuật toán chắc chắn đã dừng do điều kiện `while (lo < hi)` trong cài đặt.

Điều này cho ta một ý tưởng: tạo một giá trị $hi'' = hi + 1$ ảo và mặc định coi $P(hi'') = \texttt{true}$. Ta sẽ tìm kiếm nhị phân trên đoạn $[lo, hi'']$ mới và nếu bài toán vô nghiệm thì kết quả trả về sẽ là $hi''$, ta **không cần phải kiểm tra để `return -1`**. Sở dĩ gọi là cài đặt với nửa khoảng vì khi truyền tham số cho hàm là $lo$ và $hi$, thực ra ta chỉ muốn kết quả trong nửa khoảng $[lo, hi)$, còn $hi$ chỉ là giá trị ảo cho biết trường hợp vô nghiệm.

Cài đặt cũng tương tự với đoạn đóng, ngoại trừ việc ta loại bỏ đi đoạn code kiểm tra vô nghiệm:
```cpp
bool P(int x) {
    // Logic của hàm P ở đây
    return true; // thay giá trị này bằng giá trị đúng logic.
}

// nhớ rằng ta phải truyền hi lớn hơn một đơn vị
// so với đoạn tìm kiếm thực sự
int binary_search(int lo, int hi) {
    while (lo < hi) {
        int mid = lo + (hi - lo) / 2;
        if (P(mid) == true)
            hi = mid;
        else
            lo = mid + 1;
    }

    return lo; // lo là giá trị x nhỏ nhất mà P(x) = true
}
```
Cách cài đặt này còn có một ưu điểm khác, đó là trong C++ và rất nhiều ngôn ngữ lập trình khác thì mảng bắt đầu từ $0$, vì vậy nếu cần tìm một phần tử nào đó trong mảng thì với cài đặt bằng nửa khoảng tham số truyền vào sẽ rất đẹp, đó là `binary_search(0, N)` với $N$ là số phần tử của mảng. Toàn bộ thư viện STL, `lower_bound`, `upper_bound` đều nhận nửa khoảng, và thực tế nguyên lý của các hàm đó cũng như trên: không tìm ra đáp án thì trả về `iterator end`.

**Lưu ý**: Với trường hợp ta muốn tìm vị trí phần tử $\texttt{false}$ cuối cùng thì nửa khoảng cần tìm sẽ là `(lo, hi]` và hàm sẽ tự động trả về `lo` nếu mọi giá trị trong khoảng là $\texttt{true}$.

## Ví dụ
Đến đây ta sẽ áp dụng những điều vừa học vào một bài cụ thể [Leetcode 1011](https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/).

Trong bài này, một băng chuyền phải vận chuyển các gói hàng theo thứ tự cho trước trong $days$ ngày. Gói hàng thứ $i$ có trọng lượng $weights[i]$. Biết mỗi ngày băng chuyền chỉ có thể vận chuyển tổng khối lượng tối đa là $MAX$. Đề bài yêu cầu tìm $MAX$ nhỏ nhất để băng chuyền có thể hoàn thành nhiệm vụ được giao.

Để ý thấy rằng, với một số $MAX$, ta có thể tính toán được số ngày để chuyển hết các gói hàng sao cho mỗi ngày tổng khối lượng vận chuyển không quá $MAX$. Ban đầu, giao gói hàng $1$ để ngày $1$ chuyển. Nếu vận chuyển gói hàng $2$ trong ngày $1$ không làm tổng khối lượng trong ngày vượt $MAX$, thì ta sẽ chuyển luôn gói đó trong ngày $1$. Nếu không, ta sẽ chuyển gói đó trong ngày $2$. Làm lần lượt như thế tới khi mọi gói hàng đều được chuyển, ta sẽ có được số ngày tối thiểu cần để chuyển hết gói hàng với tổng khối lượng mỗi ngày không quá $MAX$.

Quay lại đề bài, ta thấy rằng thực ra vấn đề của bài toán là *tìm số $MAX$ nhỏ nhất sao cho số ngày tối thiểu để chuyển hết gói hàng không quá $days$ ngày*. Như vậy, ta có thể dùng tìm kiếm nhị phân với hàm kiểm tra $P$ được xây dựng bằng thuật toán tham lam được trình bày ở trên để kiểm tra các giá trị $MAX$. Để ý tính chất đơn điệu ở đây thể hiện ở chỗ nếu $MAX$ tăng lên thì số lượng ngày cần dùng *chỉ có thể giữ nguyên hoặc giảm đi* nên hàm $P$ thỏa định lý chính và có thể áp dụng tìm kiếm nhị phân.

Sau đây là đoạn code mẫu bằng C++:

```cpp
// hàm kiểm tra P
bool check(int capacity, const vector<int> &weights, int days) {
    int current_weight = 0;
    --days;
    for (int i = 0; i < weights.size(); ++i) {
        if (current_weight + weights[i] <= capacity)
            current_weight += weights[i];
        else {
            --days;
            current_weight = weights[i];
        }
    }
    return days >= 0;
}

// hàm tìm kiếm nhị phân
int shipWithinDays(const vector<int> &weights, int days) {
    int lo = 0, hi = 0;
    for (int i = 0; i < weights.size(); ++i) {
        lo = max(lo, weights[i]);
        hi += weights[i];
    }

    while (lo < hi) {
        int mid = lo + (hi - lo) / 2;
        if (check(mid, weights, days))
            hi = mid;
        else
            lo = mid + 1;
    }

    return lo;
}
```

Hàm tìm kiếm nhị phân chính là hàm `shipWithinDays` và hàm kiểm tra là hàm `check`.
Có một lưu ý về việc chọn cận dưới và cận trên. Cận trên có thể là bất cứ số nguyên nào đủ lớn, ở đây chọn là tổng của tất cả các gói hàng (cho trường hợp tệ nhất cần vận chuyển trong đúng một ngày). Tuy nhiên cận dưới phải bằng ít nhất là khối lượng của gói hàng nặng nhất để tránh trường hợp gói hàng quá lớn để chuyển trong một ngày.

Để kiểm tra thuật toán không bị lặp vô hạn với trường hợp $[\texttt{false}, \texttt{true}]$, ta thử một test như sau: $weights = [1,1], days = 1$ và thấy thuật toán hoạt động tốt.

Độ phức tạp thuật toán là $\mathcal{O}(n \cdot \log(SIZE))$ với $SIZE = hi -lo + 1$ là kích thước của không gian tìm kiếm và $n$ là số lượng gói hàng, do đó thuật toán chạy rất nhanh.

## Tìm kiếm nhị phân trên số thực

Tìm kiếm nhị phân cũng có thể được áp dụng khi không gian tìm kiếm là một đoạn số thực. Thường thì việc xử lý sẽ đơn giản hơn với số nguyên do ta không phải bận tâm về việc dịch chuyển cận:
```cpp
bool P(double x) {
    // Logic của hàm P ở đây
    return true; // thay giá trị này bằng giá trị đúng logic.
}

bool isTerminated(double lo, double hi) {
    // trả về kết quả của việc kiểm tra
    // lo và hi có thỏa điều kiện dừng chưa
}

double binary_search(double lo, double hi) {
    while (isTerminated(lo, hi) == false) {
        double mid = lo + (hi - lo) / 2;
        if (P(mid) == true)
            hi = mid;
        else
            lo = mid;
    }
    // trung bình cộng lo và hi xấp xỉ
    // ranh giới giữa false và true
    return lo + (hi - lo) / 2;
}
```
Ta thường không tìm được giá trị mục tiêu một cách chính xác mà chỉ có thể xấp xỉ kết quả, đó là lý do có hàm điều kiện dừng `isTerminated`. Thông thường có 2 cách quyết định khi nào dừng vòng lặp:
1. **Dừng sau một số vòng lặp cố định (fixed)**: thông thường khi làm bài tập trên TopCoder, chỉ cần lặp khoảng 100 lần là đủ (nhiều khi là thừa) để đạt được độ chính xác mong muốn cho những bài dạng thế này.
2. **Sai số tuyệt đối (absolute error)**: dừng khi $hi - lo \leq \epsilon$ ($\epsilon$ thường rất nhỏ, khoảng $10^{-8}$). Cách này được sử dụng nếu thời gian chặt và bạn phải tiết kiệm số lần lặp.


## Một số bài toán về tìm kiếm nhị phân

### Đơn giản
- [Power](https://oj.vnoi.info/problem/power)
- [Sushi for Two](https://codeforces.com/problemset/problem/1138/A)

### Nâng cao
- [ACOW - USACO21 Open Silver](https://oj.vnoi.info/problem/usaco21os_acow)
- [Wooden Sticks](https://oj.vnoi.info/problem/mstick)
- [c11cave](https://oj.vnoi.info/problem/c11cave)
- [Increase and Copy](https://codeforces.com/problemset/problem/1426/C)
- [Prime Matrix](https://codeforces.com/problemset/problem/271/B)
', 'int binary_search(int A[], int sizeA, int target) {
    int lo = 1, hi = sizeA;
    while (lo <= hi) {
        int mid = lo + (hi - lo) / 2;
        if (A[mid] == target)
            return mid;
        else if (A[mid] < target)
            lo = mid + 1;
        else
            hi = mid - 1;
    }
    // không tìm thấy giá trị target trong mảng A
    return -1;
}', '2026-10-06T10:32:13.622043');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_bitwise_operators', 'Phép toán bit', 'basic', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/basic/bitwise-operators.md', '["phép toán bit", "bitwise", "thao tác bit", "bật tắt bit", "xor", "and", "or"]', '---
title: Phép toán bit
description: 
published: true
date: 2024-10-24T14:28:27.758Z
tags: 
editor: markdown
dateCreated: 2023-12-25T10:59:55.638Z
---', '---
title: Phép toán bit
description: 
published: true
date: 2024-10-24T14:28:27.758Z
tags: 
editor: markdown
dateCreated: 2023-12-25T10:59:55.638Z
---

# Phép toán bit

Người viết: Nguyễn Minh Nhật - HUS High School for Gifted Students

Reviewer:
- Hồ Ngọc Vĩnh Phát - VNUHCM - University of Science
- Nguyễn Đức Kiên - VNU - University of Engineering and Technology
- Lê Minh Hoàng - VNUHCM - University of Science

# Giới thiệu

Các phép toán với bit (Bitwise Operators) là một tập hợp các toán tử và hàm dành riêng cho việc thực hiện các thao tác biến đổi và tính toán trên các bit của một số nguyên (ví dụ như ```int``` hay ```long long``` trong C++).

# Lưu ý trước khi đọc bài viết

Trước khi đọc bài viết này, bạn cần trang bị kiến thức về các chủ đề sau:

- Biểu diễn nhị phân của số nguyên.
- Cách sử dụng AND (&&) và OR (\|\|) đối với các toán hạng bool trong C++.

Các khái niệm sau được sử dụng xuyên suốt bài viết:

- **Bảng chân trị (Truth Table)** của một toán tử bit có thể hiểu nôm na là tất cả các trường hợp đầu vào/đầu ra của phép toán đó.

- **Biểu diễn dạng nhị phân của một số** được đánh dấu bằng tiền tố ```0b```. Chẳng hạn, với số ```12``` có biểu diễn nhị phân là ```1100```, ta viết ```12 = 0b1100```. Đây cũng là cách viết được chấp nhận trong code C++.

- **Bitmask** là một chuỗi các chữ số $0$, $1$, hay các bit. Trong đó, việc bit thứ $i$ được bật tương ứng với việc một phần tử/đại lượng thứ $i$ nào đó được sử dụng.

    Ví dụ đơn giản nhất của bitmask là biểu diễn một tập con của một tập hợp $A$ cho trước. Chẳng hạn, $A = \{5, 1, 2, 3, 0, 4\}$, bitmask ```0b110010``` biểu diễn cho tập con $\{1, 0, 4\}$ của $A$.

    Chú ý: Trong bài viết này, thứ tự các bit của bitmask được đánh số từ phải sang trái, bắt đầu từ $0$. Điều này tương tự như chữ số hàng đơn vị, hàng chục, hàng trăm, hàng nghìn trong số thập phân lần lượt được viết từ trái sang phải, từ thấp đến cao.

    Trên thực tế, ta sẽ thường biểu diễn bitmask bằng các kiểu số nguyên (ví dụ như các kiểu ```int``` hay ```long long``` trong C++).

- Trong một bitmask, **bit thứ $i$ bật** có nghĩa là bit thứ $i$ của bitmask này có giá trị bằng $1$. Tương tự, **bit thứ $i$ tắt** có nghĩa là bit thứ $i$ của bitmask này có giá trị bằng $0$.

- **Undefined Behaviour (UB)** được dùng để chỉ một đoạn code không có hành vi cố định. Nói cách khác, ta không biết đoạn code đó sẽ làm gì. Một đoạn code UB có thể trả về kết quả sai, làm chương trình gặp lỗi, hay trả về các kết quả khác nhau với hai lần chạy khác nhau, hoặc thậm chí là với compiler khác nhau.

- **Ký hiệu $L$** được dùng để chỉ số lượng Bit của kiểu số hiện tại đang sử dụng ($32$ với ```int``` và $64$ với ```long long```).

# Các toán tử thao tác bit (Bitwise Operators) cơ bản

## Toán tử Bitwise AND (&), OR (|) và XOR (^)

Các toán tử này thuộc loại "Toán tử Bit Logic". Việc sử dụng các toán tử loại này có thể được hiểu nôm na là thực hiện các thao tác tương ứng trên từng bit của các toán hạng (operands). Nói cách khác, nếu ký hiệu $a_i$ là bit thứ $i$ của bitmask $a$, việc thực hiện phép toán $c := a \oplus b$ trong đó $a, b, c$ là các bitmask và $\oplus$ là một phép toán nào đó sẽ tương đương với việc thực hiện $c_i := a_i \oplus b_i \forall 0 \leq i$.

Định nghĩa của các phép toán này như sau:

1. **AND** trả về True khi và chỉ khi cả hai toán hạng là True.

    Ví dụ, ta có:

    ```text
      0b11100010
    & 0b10101111
    = 0b10100010
    ```

2. **OR** trả về True khi và chỉ khi ít nhất một toán hạng là True.

    Ví dụ, ta có:

    ```text
      0b11100010
    | 0b10101111
    = 0b11101111
    ```

3. **XOR** trả về True khi và chỉ khi hai toán hạng có giá trị khác nhau. Một cách hiểu khác cho **XOR** là phép cộng theo modulo 2.

    Ví dụ, ta có:

    ```text
      0b11100010
    ^ 0b10101111
    = 0b01001101
    ```

Sau đây là bảng chân trị của các toán tử này

|a  |b  |AND|OR |XOR|
|---|---|---|---|---|
|1  |1  |1  |1  |0  |
|1  |0  |0  |1  |1  |
|0  |1  |0  |1  |1  |
|0  |0  |0  |0  |0  |

## Toán tử Bitwise NOT (~)

Toán tử Bitwise NOT có lẽ là toán tử đơn giản nhất. Toán tử này nhận vào một toán hạng $A$ và trả về phần bù của toán hạng này. Nói cách khác, định nghĩa của NOT là trả về False khi và chỉ khi toán hạng là True.

Ví dụ, ta có:

```text
 ~0b10100100
= 0b01011011
```

Chú ý rằng biểu thức trên chỉ đúng trong trường hợp đầu vào là kiểu số có 8 bit. Cụ thể hơn, cần chú ý:

Khi sử dụng phép NOT, những bit không sử dụng ở bên trái cũng sẽ được bật lên. Chẳng hạn, khi thực hiện phép ```0b10``` với kiểu số ```char``` (8 bit), ta nhận được ```0b11111101``` thay vì ```0b01```. Trong đa số trường hợp, ta sẽ cần phải tắt các bit được bật thừa này đi.

## Toán tử BITSHIFT LEFT (<<)

Định nghĩa của toán tử Bitshift Left là dịch tất cả các bit trong một số nguyên sang trái một lượng nào đó. Nói cách khác, trong phép toán ```a << b```, các bit của ```a``` được dịch sang trái ```b``` lần.

Ví dụ, xét số ```5 = 0b101```, nếu thực hiện phép toán ```0b101<<2```, ta nhận được ```0b10100 = 20```.

Nếu quan sát kỹ, bạn sẽ nhận thấy một tính chất thú vị sau của phép toán Bitshift Left: ```a << b``` $= a \times 2^{b}$. Ta có tính chất này do phép toán Bitshift Left ```a << b``` có thể hiểu là thêm ```b``` chữ số $0$ vào cuối biểu diễn nhị phân của số ```a```. Điều này tương tự như việc thêm một chữ số $0$ vào cuối biểu diễn thập phân của một số sẽ nhân số đó thêm 10 lần.

### Chú ý

Với C++, không nên để phép toán ```a << b``` của bạn bị tràn số (bit $1$ được left shift đến quá giới hạn của kiểu số đang sử dụng) vì sẽ có trường hợp code của bạn bị UB. Để biết cụ thể về các trường hợp này, bạn có thể tham khảo phần [Phép Left Shift tràn số](#điều-gì-xảy-ra-nếu-phép-left-shift-tràn-số).

Ngoài ra, nếu $b < 0$ hoặc $b \geq L$, kết quả trả về của phép toán là không xác định.

## Toán tử BITSHIFT RIGHT (>>)

Nếu như Left Shift là thêm chữ số $0$ vào bên phải của một số nguyên ở dạng nhị phân, ta có thể hiểu Right Shift là xóa các chữ số ở bên phải.

Ví dụ, xét số ```13 = 0b1101```, ta có ```0b1101 >> 2 = 0b11```.

Tương tự với Bitshift Left, ta cũng có tính chất ```a >> b``` $= \lfloor \frac{a}{2^{b}} \rfloor$ với $a$ nguyên không âm. Nếu $b < 0$ hoặc $b \geq L$, kết quả trả về của phép toán là không xác định. Dù trên thực tế không sử dụng nhiều, nhưng nếu bạn đọc cảm thấy tò mò về trường hợp $a < 0$ thì có thể tham khảo phần [Phân biệt LRS và ARS](#phân-biệt-logical-right-shift-và-arithmetic-right-shift).

# Các hàm thao tác Bit

Compiler GCC (là Compiler đi kèm với Codeforces, Dev-C++, và được sử dụng trên các OJ phổ biến) hiện nay hỗ trợ một số các hàm liên quan tới xử lý bit giúp ta thực hiện một số các phép tính thông dụng với độ phức tạp thời gian $\mathcal{O}(1)$.

Nếu bạn tới đây để đọc lại tên hàm, đây là bảng TL;DR:

|Tên thao tác           |Tên hàm                            |Giá trị trả về                 |Trường hợp UB  |
|----                   |----                               |----                           |----           |
|Population Count       |```__builtin_popcountll(x)``` |Số Bit bật                     |               |
|Parity                 |```__builtin_parityll(x)```   |Số Bit bật modulo $2$          |               |
|Count Leading Zeroes   |```__builtin_clzll(x)```      |Số Bit $0$ ở đầu               |```x == 0```   |
|Log2                   |```std::__lg(x)```                 |$\lfloor\log_2(x)\rfloor$      |               |
|Count Trailing Zeroes  |```__builtin_ctzll(x)```      |Số Bit $0$ ở cuối              |```x == 0```   |
|Find First Set         |```__builtin_ffsll(x)```      |Số thứ tự của Bit $1$ đầu tiên |               |

Chú ý: Đối với các hàm có dạng ```__builtin```, thêm đuôi ```ll``` sẽ gọi hàm đó với kiểu đầu vào là ```unsigned long long```. Để thuận tiện, người viết sẽ bỏ qua đuôi này trong phần tiếp theo.

## Hàm Population Count và Parity

GCC cung cấp hàm ```__builtin_popcount(x)``` (population count) trả về số lượng bit bật trong bitmask $x$. Chẳng hạn, ```__builtin_popcount(0b100101) = 3```.

Ngoài ra, cũng có hàm ```__builtin_parity(x)``` trả về ```__builtin_popcount(x) % 2```. Hàm này thường được sử dụng trong các bài toán liên quan tới bao hàm loại trừ.

## Hàm Count Leading Zeroes và Log2

GCC cung cấp hàm ```__builtin_clz(x)```Trả về số lượng bit $0$ ở bên trái bit $1$ cao nhất của biến đầu vào. Chú ý, hàm này trả về kết quả không xác định đối với ```x == 0```.

Chẳng hạn, ```__builtin_clz(0b10) == 30```. Kết quả này là do kiểu ```int``` có 32 bit. Cụ thể, số ```0b10``` khi lưu dưới dạng ```int``` sẽ có thể được biểu diễn là:

`0b 0000 0000 0000 0000 0000 0000 0000 0010`

Ngoài ra cũng có hàm ```std::__lg(x) == 31 - __builtin_clz(x) == 63 - __builtin_clzll(x)```. Hàm này trả về $\lfloor \log_2(x) \rfloor$, thường được sử dụng trong cài đặt của Bảng thưa (Sparse Table).

## Hàm Count Trailing Zeroes và Find First Set

GCC cung cấp hàm ```__builtin_ctz(x)``` trả về số lượng bit $0$ ở bên phải bit $1$ thấp nhất của biến đầu vào. Chú ý, hàm này cũng trả về kết quả không xác định đối với ```x == 0```. Chẳng hạn, ```__builtin_ctz(0b100100) = 2```.

GCC cũng cung cấp một hàm khác là ```__builtin_ffs(x) == __builtin_ctz(x) + 1```. Trong trường hợp ```x == 0```, hàm này trả về $0$.

# Ứng dụng

## Truy cập Bit

Một ứng dụng thường thấy của các phép toán bit là đọc và sửa từng bit trong một bitmask.

Chẳng hạn, để truy cập bit thứ $i$ trong bitmask $A$, ta có thể sử dụng phép toán ```A & (1LL<<i)```. Trước khi đọc giải thích của phép toán này, hãy tự mình chạy thử một số ví dụ.

Xét ```A = 0b1010010```. Để truy cập bit thứ $4$, ta thực hiện phép toán ```0b1010010 & (1<<4)``` như sau:

```text
  0b1010010
& 0b0010000
= 0b0010000
```

Xét phần thứ hai của phép toán, ```1<<i```, ta nhận thấy phần này thực hiện thao tác tạo ra một bitmask chỉ có bit thứ $i$ bật. Bitmask này khi được AND với bitmask ban đầu sẽ loại bỏ thông tin của tất cả mọi bit ngoại trừ bit thứ $i$.

Ngoài ra cũng có một số các cách khác để truy cập bit, ví dụ như ```(A >> i) % 2``` hay ```(A >> i) & 1```.

Chú ý: Một lỗi rất hay gặp phải khi sử dụng bitshift để truy cập và chỉnh sửa bit là tràn số. Chẳng hạn, xét dòng code sau đây:

```cpp
bool get_bit(unsigned long long mask, int pos) {
    return mask & (1 << pos);
}
```

Trong trường hợp $pos \geq 32$, biểu thức ```1<<pos``` sẽ bị tràn số do cả ```1``` và ```pos``` đều có kiểu ```int```. Để tránh bị tràn số, ta đổi đoạn code trên thành như sau:

```cpp
bool get_bit(unsigned long long mask, int pos) {
    return mask & (1ULL << pos);
}
```

Hậu tố ```ULL``` đánh dấu cho compiler biết rằng ```1ULL``` cần được coi là một số ```unsigned long long```. Như vậy, phép ```1ULL << pos``` sẽ không còn bị tràn số. Một số các hậu tố thường dùng bao gồm: ```ULL``` cho ```unsigned long long```, ```LL``` cho ```long long```, ```L``` cho ```long```,...

## Chỉnh sửa Bit

Sử dụng phương pháp tương tự như phần trên, ta có một số phép sửa bit như sau:

1. Gán một bit bằng $0$ với ```A & ~(1<<i)```.
2. Gán một bit bằng $1$ với ```A | (1<<i)```.
3. Lật (flip) một bit (từ $0$ sang $1$ hoặc từ $1$ sang $0$) với ```A ^ (1<<i)```.

## Tắt các bit cao nhất của một bitmask

Phép toán ```((1<<i) - 1)``` tạo ra bitmask mà trong đó chỉ các bit từ $0$ tới $i-1$ được bật lên.

Như vậy, để tắt tất cả các bit từ vị trí $i$ trở đi, ta có thể sử dụng ```A & ((1<<i)-1)```. Đây là cách ta loại bỏ các bit thừa sau khi thực hiện phép bitwise NOT.

## Biểu diễn tập hợp

Ứng dụng cơ bản nhất của bitmask là biểu diễn một tập con của một tập $A$ cho trước nào đó. Từ ứng dụng này, ta có một dạng bài tên là quy hoạch động trạng thái (dp bitmask).

Từ các phần [Truy cập Bit](#truy-cập-bit), [Chỉnh sửa Bit](#chỉnh-sửa-bit) và [Tắt các Bit cao nhất](#tắt-các-bit-cao-nhất-của-một-bitmask), ta có một số phép toán cơ bản trên tập hợp như sau:

|Hàm                        |Ký hiệu toán    |Code                |
|---                        |---             |---                 |
|Giao                       |$A\cap B$       |```A & B```         |
|Hợp                        |$A\cup B$       |```A | B```        |
|Hiệu                       |$A\backslash B$ |```(A ^ B) & A```   |
|Hiệu đối xứng              |$A\Delta B$     |```A ^ B```         |
|Phần bù                    |$A^{C}$ hay $A''$  |```~A & (1<<n)-1``` |
|Kiểm tra tập con           |$A \subseteq B$ |```(A & B) == A```    |
|Tập hợp chỉ có phần tử $i$ |$\{i\}$         |```1 << i```        |

<!-- 1. Lấy giao của tập $A$ và tập $B$ với ```A & B```.
2. Lấy hợp của của tập $A$ và $B$ với ```A | B```.
3. Lấy hiệu đối xứng của tập $A$ và $B$ với ```A ^ B```.
4. Lấy phần bù của tập $A$ với ```~A```.
5. Kiểm tra $A$ là tập con của $B$ bằng ```A & B == A```.
6. Tạo tập hợp $A$ chỉ có phần tử thứ $i$ bằng ```1 << i```.
7. Hiệu của hai tập hợp $A$ và $B$ bằng ```(A ^ B) & A```.
8. Phần bù của tập hợp $B$ trong $A$ bằng ```A & ~B```. -->

## Lặp qua mọi tập con của tập cho trước

Để lặp qua mọi tập con $A$ của một tập $S$ cho trước, ta viết vòng ```for``` như sau:

```cpp
void loop_subset(const vector<int> &s) {
    for (int mask = 0; mask < (1 << s.size()); mask++) {
        vector<int> a;
        for (int i = 0; i < s.size(); i++) {
            if (mask & (1 << i))
                a.push_back(s[i]);
        }
        // Thực hiện thao tác gì đó với tập con A
    }
}
```

## Cài đặt cấu trúc dữ liệu Fenwick Tree

Cách cài đặt [Fenwick Tree](/algo/data-structures/fenwick.md) tối ưu cũng là một trong những ứng dụng thú vị của các toán tử Bit.

## Giải các bài toán bao hàm loại trừ

### Đề bài

Cho một tập $S$ gồm các số nguyên tố phân biệt. Gọi $a$ là tích các số trong tập $S$. Trong các số thuộc khoảng $[0, n]$, đếm số số nguyên tố cùng nhau với $a$.

### Thuật toán

Ta lặp qua mọi tập con $T$ của $S$. Gọi $b$ là tích các số trong tập $T$, và $x$ là số số trong khoảng $[0, n]$ chia hết cho $b$. Nếu $T$ có chẵn phần tử, ta cộng $x$ vào đáp án. Ngược lại, ta trừ $x$ vào đáp án.

Phần chứng minh cho bài toán này bạn đọc có thể tham khảo ở bài viết về [bao hàm loại trừ](/translate/he/Number-Theory-7.md).

### Cài đặt

```cpp
unsigned long long solve(const vector<unsigned long long> &a, unsigned long long n) {
    unsigned long long result = 0;
    for (int i = 0; i < 1 << a.size(); i++) {
        unsigned long long b = 1;
        for (int j = 0; j < a.size(); j++) {
            if (i & 1 << j)
                b *= a[j];
        }
        unsigned long long x = n / b + 1;
        if (__builtin_parity(i))
            result -= x;
        else
            result += x;
    }
    return result;
}
```

Chú ý: Đoạn code này chỉ mang tính chất minh họa, do trên thực tế kết quả có thể tràn ```unsigned long long```. Tuy nhiên, kết quả của các thao tác tính toán tràn số trên các kiểu ```unsigned``` được xác định, nên nếu tích các số trong tập $A$ không tràn số, code này sẽ trả về kết quả theo mod $2^{64}$.

# Tổng hợp một số điều cần chú ý trong C++

Các thao tác bit trong C++ là một bộ công cụ rất mạnh và có hiệu suất cực đỉnh. Tất nhiên, "with great power comes great responsibility". Khi sử dụng bộ công cụ này, rất nhiều những bug thú vị đang chờ đợi bạn.

## Thứ tự tính toán (Operator Precendence)

Thứ tự tính toán có thể được hiểu là thứ tự mà C++ sẽ tính toán các biểu thức của bạn, ví dụ như nhân chia trước, cộng trừ sau. Trang cppreference.com có dành hẳn một [bài viết](https://en.cppreference.com/w/cpp/language/operator_precedence) để nói về thứ tự này.

Một số điểm cần chú ý trong thứ tự tính toán của C++ bao gồm:

- Các phép bitshift ```<<, >>``` đứng sau phép ```+, -```.
- Phép ```&, ^, |``` đứng sau phép ```==``` và các phép ```+, -, *, /, <<, >>```.

Trong mọi trường hợp, kể cả khi đã nhớ kỹ thứ tự tính toán của các toán tử, bạn vẫn nên sử dụng dấu ```()``` khi làm việc với các toán tử bit để giúp code dễ đọc hơn và hạn chế bug.

## Toán tử Bitshift

Trong phép Bitshift Left, nếu toán tử đầu tiên của bạn là một số âm, hoặc kết quả tính toán của bạn tràn số, thì code của bạn sẽ bị UB.

Đối với tất cả mọi phép bitshift, nếu toán tử thứ hai của bạn là một số âm, hoặc có giá trị lớn hơn hoặc bằng số lượng bit có trong kiểu số của kết quả, thì code của bạn bị UB. Trong gần như hầu hết trường hợp, chỉ có $5$ hoặc $6$ bit cuối cùng (lần lượt với hai trường hợp ```int``` và ```long long```) trong toán tử thứ hai được sử dụng, nên chúng ta có thể đoán trước được code sẽ làm gì. Tuy nhiên, không nên dựa vào tính chất này để viết code.

## Tràn số khi truy cập bit

Một lỗi thường gặp của những bạn mới làm quen với các toán tử bit là tràn số khi thực hiện phép ```1 << pos``` để truy cập bit. Bạn đọc có thể xem phần [Truy cập bit](#truy-cập-bit) để rõ hơn.

# Mở rộng

## Lặp qua mọi tập con của một bitmask

Để lặp qua mọi tập con của $S$, ta viết vòng lặp ```for``` như sau:

```cpp
void loop_mask_subset(int S) {
    for (int mask = S; true; mask = (mask - 1) & S) {
        // Thực hiện thao tác nào đó với tập con mask của S
        if (mask == 0)
            break;
    }
}
```

Độ phức tạp của vòng lặp trên là $2^{\|S\|}$ với $\|S\|$ là số lượng bit bật của $S$, chính là số tập con của $S$.

Như vậy, ta có cách để lặp mọi tập $S$ từ $0$ tới $2^{n}$, sau đó lặp mọi tập con $T$ của $S$ một cách hiệu quả.

```cpp
void loop_subset_of_all_masks(int n) {
    for (int S = 0; S < 1 << n; S++) {
        // Thực hiện thao tác nào đó với tập con S
        for (int T = S; true; T = (T - 1) & S) {
            // Thực hiện thao tác nào đó với tập con T của S
            if (T == 0)
                break;
        }
    }
}
```

Cách cài đặt trên có độ phức tạp thời gian tối ưu do tất cả các lần lặp đều tạo ra một bộ $(S, T)$ thỏa mãn, và đôi một phân biệt. Ta sẽ chứng minh tổng độ phức tạp thời gian của hai vòng lặp này là $\mathcal{O}(3^{n})$, thay vì $\mathcal{O}(4^{n})$.

Dễ dàng nhận thấy, số bước lặp của hai vòng lặp trên có thể viết là:
$$
\begin{aligned}
\sum_{S \subseteq 2^{n}} \sum_{T \subseteq S} 1 &= \sum_{S \subseteq 2^{n}} 2^{|S|} \\
&= \sum_{k = 0}^{n} \sum_{S \subseteq 2^{n}, |S| = k} 2^{k} \\
&= \sum_{k = 0}^{n} \binom{n}{k} 2^{k} \\
&= 3^{n}
\end{aligned}
$$

Nếu bạn thấy chứng minh trên khó hiểu, hãy xem chứng minh của Ứng dụng tiếp theo.

## Lặp qua mọi bộ $x$ tập con phân biệt

### Bài toán

Cho một tập $S$ độ dài $n$ và một số $x$. Hãy in ra tất cả các cách chia các phần tử trong $S$ vào $x$ tập hợp không giao nhau, sao cho mỗi phần tử nằm trong đúng một tập hợp.

### Nhận xét

Rõ ràng, có $\mathcal{O}(x^{n})$ tập hợp thỏa mãn. Như vậy, độ phức tạp tốt nhất của bài toán này là $\mathcal{O}(x^{n})$.

### Trường hợp $x = 2$

Rõ ràng, trong trường hợp này, ta chỉ cần lặp qua mọi tập con $S$ của $A$. Với mỗi lần lặp này, ta nhận được cặp tập hợp $(S, A \backslash S)$.

### Trường hợp $x = 3$

Ta sẽ cố gắng mở rộng từ trường hợp $x = 2$ để có được thuật toán cho trường hợp này.

Bước đầu tiên, ta sẽ lặp như trường hợp $x = 2$ để có được cặp tập hợp $(A, B)$.

Bước thứ hai, ta sẽ lặp mọi tập con $C$ của tập $A$ để nhận được hai tập $(C, A \backslash C)$. Như vậy, bộ tập hợp thỏa mãn đề bài mà ta nhận được sẽ là $(B, A \backslash C, C)$. Chú ý, ở bước này, ta sử dụng kỹ thuật ở [Ứng dụng trước](#lặp-qua-mọi-tập-con-của-một-bitmask).

Cài đặt cho trường hợp này như sau:

```cpp
void loop_triplets(int n) {
    int S = (1 << n) - 1;
    for (int A = S; true; A = (A - 1) & S) {
        int B = S ^ A;
        for (int C = A; true; C = (C - 1) & A) {
            // In ra B, A^C, C
            if (C == 0)
                break;
        }
        if (A == 0)
            break;
    }
}
```

Để ý rằng vòng lặp đầu tiên tương đương với việc lặp $A$ trong khoảng $[0, 2^{n})$. Nếu thực hiện thay đổi này, ta sẽ nhận được cài đặt tương đương với hàm ```void loop_subset_of_all_masks(int n)``` ở trên. Đây cũng là một cách hiểu cho độ phức tạp $\mathcal{O}(3^{n})$ của hàm này.

### Trường hợp tổng quát $x \in Z^{+}$

```cpp
void generate_partitions(vector<int> &sets, int mask, int x) {
    if (x == 1) {
        sets.push_back(mask);
        // Hàm thực hiện thao tác gì đó đối với sets
        solve_for_sets(sets);
        sets.pop_back();
        return;
    }
    for (int s = mask; true; s = (s - 1) & mask) {
        sets.push_back(s);
        generate_partitions(sets, mask ^ s, x - 1);
        sets.pop_back();
        if (s == 0)
            break;
    }
}
int main() {
    int n = 10, parts = 5;
    vector<int> sets;
    generate_partitions(sets, (1 << n) - 1, parts);
}
```

## Tăng tốc cho code

Nếu sử dụng kiểu dữ liệu ```unsigned long long```, ta có thể thực hiện 64 phép AND, OR, XOR, hoặc NOT trong một thao tác. Trên thực tế, khi dịch, một số các compiler có thể giúp bạn thực hiện $256$ hay thậm chí $512$ phép toán như vậy cùng một lúc. Như vậy, một số bài toán với giới hạn như $n \leq 5 \times 10^{4}$ hay thậm chí $n \leq 10^{5}$ có thể chạy qua được với độ phức tạp $\mathcal{O}(n^{2})$. Tuy nhiên, do giới hạn của bài viết, chủ đề này sẽ không được bàn đến ở đây.

## Phân biệt Logical Right Shift và Arithmetic Right Shift

Riêng đối với Right Shift, hầu hết các cấu trúc máy tính cung cấp hai loại phép toán khác nhau là Logical Right Shift và Arithmetic Right Shift.

Khác biệt duy nhất giữa hai loại phép toán này là Logical Right Shift điền các bit bên trái mới được thêm bằng $0$, trong khi Arithmetic Right Shift điền các bit này là giá trị của bit trái cùng trong số ban đầu (bit thứ $31$ đối với kiểu ```int```, và bit thứ $63$ đối với kiểu ```long long```).

Chẳng hạn, ta sử dụng kiểu số ```char``` có 8 bit, và thực hiện phép toán ```0b```**```101```**```01101 >> 5```. Logical Right Shift sẽ trả về kết quả ```0b00000```**```101```**, nhưng Arithmetic Right Shift sẽ trả về ```0b11111```**```101```**.

Chắc chắn khi đọc đến đây, các bạn sẽ tự hỏi về ý nghĩa của phép Arithmetic Right Shift. Trong trường hợp toán hạng ```a``` là số không âm, hai phép toán hoạt động tương đương. Tuy nhiên, trong trường hợp ```a``` âm, phép Logical Right Shift không có ý nghĩa về mặt toán học, mà đơn giản chỉ là đẩy các bit sang phải. Trong khi đó, phép Arithmetic Right Shift sẽ vẫn đảm bảo tính chất ```a >> b``` $= \lfloor \frac{a}{2^{b}} \rfloor$. Chú ý rằng kết quả của phép toán sẽ được làm tròn xuống, chẳng hạn như ```-7 >> 2``` $= \frac{-7}{2^{2}} = -1.75$ được làm tròn xuống $-2$.

Lý do phép toán trên hoạt động là vì các số nguyên âm được biểu diễn dưới dạng two''s complement. Do giới hạn của bài viết, người viết sẽ không đi sâu hơn vào loại biểu diễn này.

Trong C++, phép Logical Right Shift sẽ được sử dụng nếu toán tử đầu tiên là một số thuộc loại ```unsigned```, còn nếu không thì phép Arithmetic Right Shift sẽ được sử dụng.

## Sử dụng Pragma

Đối với gần như tất cả ($>99\%$) những máy tính mà bạn sẽ gặp trong đời, các hàm phía trên có thể được thực hiện với chỉ $1$ instruction, hay nói cách khác là trong $\mathcal{O}(1)$. Tuy nhiên, để hỗ trợ những máy tính rất cũ hoặc rất low-end, compiler GCC mặc định cài đặt các hàm trên bằng toán tử bit, chạy trong $\mathcal{O}(\log_2 \log_2 n)$, với $n$ là số lượng bit trong kiểu số của bạn.

Để mở khóa các instruction mới, các bạn cần phải sử dụng định hướng biên dịch ```#pragma GCC target```.

Hầu hết mỗi hàm đều có một "flag" riêng biệt mà khi bật lên sẽ mở khóa instruction cho hàm đó. Tuy nhiên, nếu bạn mở khóa thừa thì code bạn vẫn chạy. Vì vậy, để code chạy nhanh hơn, bạn chỉ cần paste dòng sau vào đầu code (trước dòng ```#include```):

```cpp
#pragma GCC target("popcnt,lzcnt,bmi,bmi2,abm")
```

## Điều gì xảy ra nếu phép Left Shift tràn số?

Với C++, nếu phép toán ```a << b``` của bạn bị tràn số (bit $1$ được left shift đến quá giới hạn của kiểu số đang sử dụng), sẽ có 2 trường hợp xảy ra:

1. Nếu kiểu số của kết quả là một số ```unsigned```, các bit bị tràn sẽ được coi như là $0$, và biến mất. Nói cách khác, gọi số bit của kiểu số kết quả là $c$ ($c$ là $32$ với ```unsigned int```, và $64$ với ```unsigned long long```), kết quả trả về sẽ được tính theo modulo ```2^c```.
2. Nếu kiểu số của kết quả là một số ```signed```, chương trình của bạn sẽ bị UB. Tuy nhiên, trong hầu hết trường hợp, code của bạn sẽ không bị lỗi, mà chỉ trả về một kết quả không xác định nào đó. Điều tương tự xảy ra nếu toán hạng ```a``` của bạn là một số âm.

## Thư viện `<bit>` của `C++20`

**Chú ý:** Tại thời điểm viết bài, hầu hết các kỳ thi chính thức chưa cho phép sử dụng chuẩn `C++20`. Nếu không chắc chắn, các bạn vui lòng chỉ sử dụng những biến thể không thuộc `C++20` của các hàm này.

Một trong những điểm mới của phiên bản `C++20` là thư viện `<bit>`. Thư viện này chứa các hàm tương tự như [Các hàm thao tác Bit](#các-hàm-thao-tác-bit). Điểm lợi của các hàm trong thư viện `<bit>` là có khả năng chạy trên tất cả các Compiler C++ khác nhau, nhưng điểm trừ là chỉ chạy được với chuẩn `C++20` trở lên.
', '2. **OR** trả về True khi và chỉ khi ít nhất một toán hạng là True.

    Ví dụ, ta có:', '2026-10-06T10:32:14.152066');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_computational_complexity', 'Độ phức tạp thời gian', 'basic', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/basic/computational-complexity.md', '["độ phức tạp", "o(n)", "big o", "thời gian chạy", "không gian bộ nhớ"]', '---
title: Độ phức tạp thời gian
description: 
published: true
date: 2026-08-21T04:03:28.709Z
tags: 
editor: markdown
dateCreated: 2023-12-25T10:59:59.368Z
---', '---
title: Độ phức tạp thời gian
description: 
published: true
date: 2026-08-21T04:03:28.709Z
tags: 
editor: markdown
dateCreated: 2023-12-25T10:59:59.368Z
---

# Độ phức tạp thời gian

**Người viết:**
- Nguyễn Minh Hiển - Trường Đại học Công nghệ, ĐHQGHN

**Reviewer:**
- Nguyễn Đức Kiên - Trường Đại học Công nghệ, ĐHQGHN
- Phạm Hoàng Hiệp - University of Georgia
- Ngô Nhật Quang - The University of Texas at Dallas

# **Giới thiệu**
Thông thường khi viết một thuật toán, ta thường quan tâm nó chạy nhanh hay chậm, tốn nhiều bộ nhớ hay không.

Để ước lượng thời gian chạy của một thuật toán dựa  trên *kích thước đầu vào*, chúng ta sử dụng khái niệm: **Độ phức tạp thời gian của thuật toán**.

# **Khái niệm độ phức tạp thời gian (ĐPT)**
>**Độ phức tạp thời gian** là một hàm $f$ đo *số thao tác cơ bản* mà một thuật toán thực thi, với tham biến $n$ là kích thước đầu vào: $y = f(n)$

Trên thực tế, đa phần các thuật toán sẽ được đánh giá theo *trường hợp xấu nhất (worst case)* vì sự đơn giản và thực tế của nó.

Một số khác vẫn được đánh theo *trường hợp trung bình (average case)*. Ví dụ như khi:
- *Trường hợp xấu nhất* ít xảy ra. Ví dụ với thuật toán Quick Sort.
Trong *trường hợp xấu nhất* là khi ta luôn chọn phải phần tử chốt là phần tử lớn nhất hay nhỏ nhất của dãy, và ĐPT sẽ là $\mathcal{O}(n^{2})$, nhưng xác suất trường hợp này xảy ra rất nhỏ. Còn trong phần lớn các trường hợp khác, ĐPT là $\mathcal{O}(n \log n)$.
- Thuật toán có yếu tố ngẫu nhiên. Ví dụ như việc sử dụng sinh số ngẫu nhiên.

Trong từng trường hợp khác nhau của dữ liệu vào, việc tính toán chính xác hàm $f(n)$ (với $x$ tổng quát) thường rất khó. Và ở đây, chúng ta sử dụng *độ phức tạp BigO hay O-lớn* thay thế.

# **Độ phức tạp BigO**
Xét 2 hàm số dương $f(n)$ và $g(n)$
Ta ký hiệu: $f(n) = \mathcal{O}(g(n))$
>Theo định nghĩa giải tích, ký hiệu trên tương đương với:
$$
\lim\limits_{n \rightarrow \infty} \sup\frac{f(n)}{g(n)} < \infty
$$
  
>Gọi là "hàm $f$ không tăng (tiệm cận) nhanh hơn $g$".

**Nói một cách dễ hiểu:** $f(n) = \mathcal{O}(g(n))$ thì tồn tại hằng số $c > 0$ để khi $n$ đủ to $($với mọi $n \ge n_0$ nào đó$)$ thì $f(n) \le c\times g(n)$.

Ví dụ:
* $f(n) = 2n + 10$ là $\mathcal{O}(n)$ vì khi chọn $c = 3$, chỉ cần $n \ge 10$ thì $f(n) = 2n + 10 \le 3n = c \times n$
* $2n^{2} + 10$ thì không phải là $\mathcal{O}(n)$ nữa, mà sẽ là $\mathcal{O}(n^{2})$ (chọn $c = 3$ và $n \ge 4$)

# **Một số quy tắc tính toán ĐPT**
## Các quy tắc cơ bản
- Các phép sau được tính là lệnh đơn: phép đọc, viết, gán và các toán tử cơ bản *(toán tử số học, quan hệ, logic, bit, gán, hỗn hợp)*
 Các phép này có ĐPT $\mathcal{O}(1)$
- Xét các lệnh `S1, S2, ..., Sm` và ĐPT tương ứng của chúng là $\mathcal{O}(f_1), \mathcal{O}(f_2), \ldots, \mathcal{O}(f_m)$ với $f_i$ là các hàm của dữ liệu đầu vào.
$E$ là một biểu thức logic.
    - Chuỗi các lệnh liên tiếp: `S1; S2; ...; Sm;` có ĐPT $\mathcal{O}(f_1+f_2+ \ldots+f_m)$
    - Khối lệnh rẽ nhánh `if E then S1 else S2` có ĐPT $\mathcal{O}\left(\max(f_1,f_2)\right)$
    - Các khối lặp:
    `while E do S1`
    `do S1 while E`
    `for i := E1 to E2 do S1`
    Tính ĐPT sẽ tương tự chuỗi các lệnh liên tiếp. Giả sử $S_1$ được lặp lại $g$ lần thì ĐPT sẽ là $\mathcal{O}(g \times f_1)$ với $g$ cũng là hàm của dữ liệu đầu vào.

## Một số chú ý quan trọng
- Tất cả các bài toán có ĐPT đa thức bậc $k$ thì có ĐPT là $\mathcal{O}(n^{k})$. Các hằng số, hệ số đa thức thường (không phải luôn luôn) được bỏ qua.
>Trong một số tài liệu, ký hiệu $\log n$ là logarit của $n$ theo cơ số $2, e$ hoặc $10$ tùy theo quy ước của tài liệu đó. Và cơ số đó chính xác là bao nhiêu không thật sự quan trọng bởi:
>- Ta có phép chuyển đổi cơ số: $\log_{a} b = \frac{\log b}{\log a}$
>- Với $a=2, e, 10$ thì $\frac{1}{\log a}$ đều là một hằng số nhỏ không đáng để quan tâm.
- Coi $\log n \sim n^{\alpha}$ với $0 < \alpha < 1$
- Dựa vào định nghĩa *BigO*, khi gặp một thuật toán có ĐPT là $\mathcal{O}(n)$, thì nói "thuật toán đó có ĐPT $\mathcal{O}(n^{2})$" không hề sai. Hay tổng quát hơn là một thuật toán có ĐPT là $\mathcal{O}(n^{k})$ mà ta bảo "nó có ĐPT $\mathcal{O}(n^{k + \alpha})$" cũng không hề sai $(\alpha > 0$ tùy ý$)$.
Tuy nhiên, khi tính toán ĐPT, ta nên chọn $k$ nhỏ nhất sao cho thuật toán có ĐPT $\mathcal{O}(n^{k})$. Điều này sẽ giúp ta có cái nhìn chính xác hơn để đánh giá thuật toán.
- Khi gặp các hàm nhiều biến, ta vẫn tính toán như thường.
Ví dụ: $n\log^{2} n + n^{2} + m\log n + 1 +q^{2} = \mathcal{O}(n^{2}+m\log n +q^{2})$
- Một số độ phức tạp thường gặp trong lập trình thi đấu và các dữ liệu phù hợp để thuật toán chạy trong khoảng $1s$ (khoảng $10^{8}$ lệnh):


| ĐPT      | Tên gọi  | n        |
| -------- | -------- | -------- |
| $\mathcal{O}(1)$   | Hằng số (Constant)  | Tùy yêu cầu bài toán     |
| $\mathcal{O}\left(\sqrt{n}\right)$   |   | $10^{12}$     |
| $\mathcal{O}(n)$   | Tuyến tính (Linear)  | $10^{8}$     |
| $\mathcal{O}(n\log n)$   | Linearithmic  | $10^{6}$     |
| $\mathcal{O}\left(n\sqrt{n}\right)$   |   | $2 \times 10^{5}$     |
| $\mathcal{O}(n^{2})$   | Bậc 2 (Quadratic)  | $10^{4}$     |
| $\mathcal{O}(n^{3})$   | Bậc 3 (Cubic)  | $500$     |
| $\mathcal{O}(n^{4})$   | Bậc 4 (Quartic)  | $100$     |
| $\mathcal{O}(2^{n})$   | Exponential   | $20$     |
| $\mathcal{O}(n!)$   | Giai thừa (factorial)  | $11$     |

Tuy nhiên, việc có ĐPT đáp ứng bộ dữ liệu như trong bảng trên, không có nghĩa thuật toán sẽ chạy nhanh (trong khoảng $1s$). Bạn đọc có thể xem chi tiết trong phần **Mở rộng. Hằng số ĐPT**

---
# Ví dụ
## Vòng lặp
Dựa vào các quy tắc, ta rút ra được một số `mẹo` khi tính ĐPT các vòng lặp:
:::success
**1.** Tính số lần lặp tối đa của một vòng lặp
**2.** Nếu các vòng lặp nối tiếp nhau thì cộng các cận đó với nhau
**3.** Nếu các vòng lặp lồng nhau thì nhân các cận với nhau
:::

**Ví dụ 1:**
```cpp
int sum = 0;
for (int i = 0; i < n; i++)
    sum += i;
for (int j = 0; j < n; j++)
    sum += j;
```
Hai vòng có tổng cộng $n \times 2$ phép cộng, nên ĐPT sẽ là $\boldsymbol{\mathcal{O}(n)}$

**Ví dụ 2:**
```cpp
int sum = 0;
for (int i = 0; i < n; i++) {
    int j = 0;
    while (j < n) {
        sum += j;
        j++;
    }
}
```
Hai vòng lặp lồng nhau, mỗi vòng lặp có ĐPT $\mathcal{O}(n)$ nên ĐPT sẽ là $\boldsymbol{\mathcal{O}(n^{2})}$

**Ví dụ 3:**
```cpp
int sum = 0;
for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++) {
        sum += j;
    }
}
```
Vòng `i` lặp `n` lần, vòng `j` lặp tổng cộng $1 + 2 + \ldots + n = \frac{n \times (n + 1)}{2}$ lần, nên ĐPT chung vẫn sẽ là $\boldsymbol{\mathcal{O}(n^{2})}$ dù số phép tính đã được giảm đi khá nhiều.

## Hai con trỏ
Cho một mảng `a[]` đã được sắp xếp. Xác định xem liệu có tồn tại $2$ phần tử trong mảng mà cách nhau $d$ đơn vị hay không.
Xét lời giải sau:
```cpp
int j = 0;
for (int i = 0; i < n; i++) {
    while ((j < n - 1) && (a[i] - a[j] > d))
        j++;
    if (a[i] - a[j] == d) {
        cout << "Ton tai!";
        return 0;
    }
}
cout << "Khong ton tai";
```

Thoạt nhìn, nó khá giống với vòng lặp lồng ở **Ví dụ i.2.** và cho ra ĐPT $\mathcal{O}(n^{2})$ nhưng thực chất, ĐPT nhỏ hơn vậy.
**Phân tích:** Ta xét trường hợp xấu nhất là khi `"Khong ton tai"`:
- Trong **Ví dụ i.2.** biến `j` nhận giá trị từ `1` đến `n`, mỗi giá trị `n` lần, và ĐPT chung sẽ là $\mathcal{O}(n^{2})$.
- Tuy nhiên trong *Lời giải* trên thì biến `i` chạy từ `1` đến `n`, mỗi giá trị xét $1$ lần. Còn biến `j` chạy từ `1` đến `n`, mỗi giá trị xét tối đa $1$ lần. Nên ĐPT trong trường hợp xấu nhất là $\mathcal{O}(2n)$ hay $\boldsymbol{\mathcal{O}(n)}$.

**Nhận xét:**
- Thuật toán trên sở dĩ gọi là $2$ con trỏ bởi $2$ biến $i$ và $j$ độc lập, dù cho vòng lặp $j$ nằm trong vòng lặp $i$.
- Khi gặp vòng lặp lồng, ta cần chú ý hơn, hoặc để chính xác thì nên cộng từng vòng lặp con bên trong. Sau này ta sẽ gặp các thuật toán tối ưu khá ảo như `Knuth''s Optimization` hay `Knapsack on tree`, thì ta phải dùng cách này để tính ĐPT một cách chính xác hơn.

## Tìm kiếm nhị phân
Cho một dãy được sắp xếp tăng dần, kiểm tra xem dãy có tồn tại giá trị `target` không.
Xét lời giải bằng tìm kiếm nhị phân như sau:
```cpp
int binary_search(int a[], int sizeA, int target) {
    int lo = 1, hi = sizeA;
    while (lo <= hi) {
        int mid = lo + (hi - lo) / 2;
        if (a[mid] == target)
            return mid;
        else if (a[mid] < target)
            lo = mid + 1;
        else
            hi = mid - 1;
    }
    // không tìm thấy giá trị target trong mảng A
    return -1;
}
```

Ở mỗi bước, kích thước của mảng cần tìm kiếm bị giảm đi một nửa. Sau $\lceil \log_2 n \rceil$ bước, thì số phần tử của mảng là $1$ và dừng tìm kiếm.
Từ đó ĐPT của thuật toán là $\boldsymbol{\mathcal{O}(\log n)}$ với $n$ là số phần tử ban đầu của không gian tìm kiếm.

## Đệ quy
### **Thuật toán quay lui sinh cấu hình tổ hợp**

Đây là một đoạn code sinh tất cả các hoán vị từ $1$ đến $n$ với $(n \le 10)$
```cpp
#include <bits/stdc++.h>
using namespace std;
const int N = 10;

int n, a[N + 5];
bool used[N + 5];

void print() {
    for (int i = 1; i <= n; i++)
        cout << a[i];
    cout << ''\n'';
}

void backtrack(int i) {
    if (i == n + 1) {
        print();
        return;
    }
    for (int j = 1; j <= n; j++)
        if (used[j] == false) {
            a[i] = j;
            used[j] = true;
            backtrack(i + 1);
            used[j] = 0;
        }
}

int main() {
    cin >> n;
    backtrack(1);
}
```

**Phân tích:**
    Ta gọi hàm `backtrack(1)` nên `i` sẽ bắt đầu từ `1`.
    Tại vòng lặp `j` đầu tiên, ta xét tất cả các giá trị có thể gán cho `a[1]` (số hạng thứ `1`) và đánh dấu đã sử dụng giá trị đó.
    Và ta sẽ gán lần lượt `a[2], ..., a[n]`.
    Đến `i = n + 1`, chúng ta sẽ in ra kết quả và xét đến cấu hình tiếp. Việc in kết quả sẽ tốn 1 vòng $\mathcal{O}(n)$
    Vì thế ta có tổng cộng $n \times (n - 1) \times \ldots \times 1 \times n = n \times n!$ phép toán. Hay ĐPT bài toán là $\boldsymbol{\mathcal{O}(n \times n!)}$.


---
### **Chia để trị**
Đôi khi ĐPT của một thuật toán đệ quy không quá lớn như $\mathcal{O}(n!)$.
Bạn đọc có thể thấy rõ với thuật toán sắp xếp *Merge Sort (Sắp xếp trộn)* sau đây:

```cpp=
    MergeSort(mảng S) {
        if (số phần tử của S <= 1)
            return S;
        Chia đôi S thành hai mảng con S1 và S2 với số phần tử gần bằng nhau;
        MergeSort(S1);
        MergeSort(S2);
        Trộn S1 và S2 đã sắp xếp để thu được S mới đã sắp xếp;
        return S mới;
    }
```

<center>
		<img src="/uploads/algo/basic/computational-complexity/time-complexity.png" width="50%">
    <figcaption>Minh họa về cách thuật toán Merge Sort hoạt động</figcaption>
</center>

**Phân tích:**
Gọi $f(n)$ là ĐPT của hàm `MergeSort(S)` với $n = |S|$
Dễ thấy:
- Bước $1, 2, 6$ đều mất $\mathcal{O}(1)$
- Bước $5$ sẽ mất $n$ bước với hai con trỏ
- Bước $3, 4$ sẽ mất $f\left(\left\lfloor\frac{n}{2}\right\rfloor\right)$ và $f\left(\left\lceil\frac{n}{2}\right\rceil\right)$

*Trong đó:*
*$\lfloor x \rfloor$ là số nguyên lớn nhất $\le x$ (phần nguyên dưới).*
*$\lceil x \rceil$ là số nguyên nhỏ nhất $\ge x$ (phần nguyên trên).*

Từ đó, ta có : 
$$
\begin{cases}
f(1) = 1\\
f(n)=
f\left(\left\lfloor\frac{n}{2}\right\rfloor\right) + f\left(\left\lceil\frac{n}{2}\right\rceil\right)+ \alpha n \, (\alpha \ge 1)
\end{cases}
$$

ĐPT thuật toán này là $f(n) = \boldsymbol{\mathcal{O}(n\log n)}$ trong cả *worst case* và *average case*.

Để có được kết luận trên, ta đi chứng minh phát biểu sau:
>Tồn tại hằng số $c > 1$ nào đó mà với $\forall n \le T$ ta có $f(n)\le n\log_{2} n + c\times n$
>
Bằng quy nạp, ta có:
- Với $n = 1$, rõ ràng luôn tồn tại $c''''>1$ để $f(1)<c'''' \times 1$
- Giả sử điều này đúng đến $n = k - 1$ $(k \ge 2)$, ta cần chứng minh đúng với $n = k$:
- Thật vậy,
$$\begin{aligned}
f(k) &= f\left(\left\lfloor\frac{k}{2}\right\rfloor\right)+f\left(\left\lceil\frac{k}{2}\right\rceil\right) + \alpha k\\
\Rightarrow f(k) &\le 2f\left(\left\lceil\frac{k}{2}\right\rceil\right) + \alpha k\\
&\le \left( 2 \left\lceil\frac{k}{2}\right\rceil \times \log_2\left(\left\lceil\frac{k}{2}\right\rceil\right) + c'' k \right) + \alpha k\\
&\le \left( 2 \times\frac{k}{2}\times \log_2\left(\frac{k}{2}\right) + \beta k \right) + (c''+\alpha) k\\
&= k \log_2 k - k + (c'' + \alpha + \beta)\times k\\
&= k \log_2 k + c''''\times k\\
\end{aligned}$$

Chọn $c = \max\limits_{n \le T}(c'''')$, ta được đpcm.

> Bạn đọc có thể tham khảo dạng tổng quát của bài toán: [Master theorem (Định lý thợ)](https://en.wikipedia.org/wiki/Master_theorem_(analysis_of_algorithms))

## ĐPT và chuỗi nghịch đảo
### **Ví dụ 1**
Tính độ phức tạp thời gian của đoạn code sau:
```cpp
int cnt = 0;
for (int i = 1; i <= n; i++) {
    for (int j = i; j <= n; j += i) {
        cnt++;
    }
}
```
 **Giải:**
Rõ ràng, với mỗi biến $i$, vòng lặp $j$ sẽ chạy $\left\lfloor\frac{n}{i}\right\rfloor$ lần.
Vì thế độ phức tạp sẽ là $\mathcal{O}\left( n \times \left(\frac{1}{1} + \frac{1}{2} +\ldots+\frac{1}{n} \right) \right) = \mathcal{O}\left(n \times \sum\limits_{i = 1}^{n} \frac{1}{i}\right)$.
Và đến đây rút gọn thế nào nhỉ?

* $x > \log(1 + x)$ với mọi $x > 0$ nên
$$
\frac{1}{1} + \frac{1}{2} +\ldots+\frac{1}{n} \ge \log\frac{2}{1} + \log\frac{3}{2} +\ldots+ \log\frac{n+1}{n} = \log(n+1)
$$

* Lại có:
$$\underbrace{\frac{1}{1}}_{=1} + \underbrace{\frac{1}{2} + \frac{1}{3}}_{< 2 \times \frac{1}{2} = 1} +
\underbrace{\frac{1}{4} + \ldots + \frac{1}{7}}_{< 4 \times \frac{1}{4} = 1} + \ldots +
\underbrace{\frac{1}{2^{\lfloor \log_{2} n \rfloor}} + \ldots + \frac{1}{n}}_{<1}
< \lfloor\log_{2} n\rfloor + 1$$
* Chặn được thế này thì ta được kết quả là $\mathcal{O}\left(n \times \sum\limits_{i = 1}^{n} \frac{1}{i}\right) = \boldsymbol{\mathcal{O}(n\log n)}$

**Nhận xét:**
Rõ ràng, $\left\lfloor \frac{n}{i} \right\rfloor$ là số số $\le n$ và chia hết cho $i$. Vì thế với $\tau(n)$ là số ước dương của $n$ thì bản chất độ phức tạp của bài toán trên là:
$$
f(n) = \tau(1) + \tau(2) + \ldots + \tau(n) = \sum\limits_{i = 1}^{n} \left\lfloor \frac{n}{i} \right\rfloor \sim n\log n
$$
$f(n)$ cũng chính là số cặp số nguyên dương $(i, j)$ thỏa mãn: $i \cdot j \le n$.

---

### **Ví dụ 2**
Tính độ phức tạp thời gian của giải thuật sàng nguyên tố Erathosenes:
```cpp
for (int i = 2; i * i <= n; i++)
    is_prime[i] = true;
for (int i = 2; i <= n; i++)
    if (is_prime[i]) {
        for (int j = i * 2; j <= n; j += i) {
            is_prime[j] = false;
        }
    }
```
**Giải:**
Tương tự bài trên, nhưng chỉ khi biến $i$ là số nguyên tố thì biến $j$ sẽ chạy $\frac{n}{i}$ lần, ngược lại biến $j$ không phải chạy 1 vòng nào.
Vì thế độ phức tạp thời gian là $\mathcal{O}\left( n \times \left(\frac{1}{2} + \frac{1}{3} +\ldots+\frac{1}{p} \right) \right)$ với $p$ là số nguyên tố $\le n$.
Đến đây việc tính toán độ phức tạp sẽ phải dùng đến kiến thức *Lý thuyết số giải tích*. Bạn đọc có thể tham khảo thêm [Định lý Merten 2](https://en.wikipedia.org/wiki/Mertens%27_theorems#Proof).
$$
\mathcal{O}\left( n \times \left(\frac{1}{2} + \frac{1}{3} +\ldots+\frac{1}{p} \right) \right) = \mathcal{O}\left(n \times \sum\limits_{\substack{p \text{ nguyên tố} \\ p \le n}} \frac{1}{p}\right) = \boldsymbol{\mathcal{O}(n \log (\log n))}
$$


# Mở rộng
## Họ hàm $\mathcal{O}(n)$
$\mathcal{O}(n)$ thuộc một họ [hàm Bachmann–Landau](https://en.wikipedia.org/wiki/Big_O_notation#Family_of_Bachmann%E2%80%93Landau_notations). Và trong họ hàm này, có một số hàm cũng được dùng để đánh giá ĐPT là $\Omega(n)$ (Omega lớn) và $\Theta(n)$ (Theta lớn).
<!--    - Nếu như $\mathcal{O}(n)$ đánh giá cận trên,
    - Thì $\Omega(n)$ sẽ đánh giá cận dưới: $f(n) = \Omega(g(n))$ thì $\lim_{n \rightarrow \infty} \inf \frac{f(n)}{g(n)} > 0$
    - Và $\Theta(n)$ sẽ là kết hợp cả 2: $f(n) = \Theta(g(n)) \Leftrightarrow \begin{align} f(n) = \mathcal{O}(g(n))\\ f(n) = \Omega(g(n))\end{align}$ -->
Tuy $\Theta(n)$ đánh giá cận chính xác (không phải cận trên như $\mathcal{O}(n)$), nhưng ta vẫn sử dụng $\mathcal{O}(n)$ vì sự phổ biến và dễ viết của nó.

## Hằng số ĐPT
- Với hầu hết các thuật toán thường gặp trong thực tế, **giá trị hằng số của $\mathcal{O}$ (hoặc $\Theta$) thường là khá nhỏ. Nếu một thuật toán là $\mathcal{O}(n^{2})$, ĐPT chính xác là vào khoảng $10n^{2}$ chứ không phải $10^{3} n^{2}$**.
Nói cách khác: nếu hằng số quá lớn thì thường là các hằng số đó có liên quan tới các đại lượng có sẵn trong đề bài. Khi đó, ta cần gán một tên gọi cho hằng số đó và thêm nó vào đánh giá ĐPT, thay vì bỏ qua.
    - *Ví dụ:* thay vì để $\mathcal{O}(1000 \times n)$ rồi suy ra ĐPT là $\mathcal{O}(n)$ thì nên viết thành $\mathcal{O}(q\times n)$ với $q = 1000$
    - Trong toán học, $\mathcal{O}(10^{9})$ vẫn là $\mathcal{O}(1)$. Tuy nhiên điều này chỉ đúng khi $n$ cực lớn $(\infty)$.
    - Còn trong lập trình thi đấu, ta hay gặp bộ dữ liệu $n \le 10^{8}$, nên rõ ràng $\mathcal{O}(10^{9})$ sẽ chạy lâu hơn $\mathcal{O}(n)$. Vì thế trong *Ví dụ*, việc đặt $q = 1000$ là hoàn toàn phù hợp.

- Cũng như vừa đề cập, hằng số của thuật toán trong ĐPT cũng có ảnh hưởng đến thời gian thực thi.
    - **Hai thuật toán có ĐPT ngang nhau không có nghĩa là chúng chạy nhanh như nhau.**
        - Ví dụ khi xét việc sắp xếp $n$ số nguyên, `std::sort`, `std::priority_queue`, `std::set`/`std::map` đều có ĐPT $\mathcal{O}(n\log n)$.
        - Tuy nhiên khi so sánh về thời gian chạy thì `std::sort` $<$ `std::priority_queue` $<$ `std::set`/`std::map`

    - **Thuật toán có ĐPT bậc cao hơn không có nghĩa là chúng chạy chậm hơn trong mọi bộ dữ liệu.**
        - Ví dụ điển hình là hàm `std::sort` của C++. Thuật toán chính được sử dụng là **Intro Sort**, bắt đầu với **Quick Sort**. Để tối ưu, khi kích thước mảng nhỏ, hàm sẽ sử dụng **Insertion Sort**. Trong trường hợp độ sâu đệ quy vượt quá ngưỡng nhất định (khi chọn phần tử chốt của Quick-sort không hiệu quả), hàm sẽ chuyển sang **Heap Sort** để duy trì độ phức tạp $\mathcal{O}(n \log n)$ trong trường hợp xấu nhất.
- Vì thế, trong từng trường hợp, ta nên chú ý chọn thuật toán cho phù hợp nhất để tối ưu thời gian chạy chương trình.
Và đặc biệt khi sử dụng các hàm trong thư viện sẵn có hay các code sẵn có thì nên hiểu cơ bản cách hoạt động và tốc độ của nó.

# Lời kết
Với lập trình viên, *độ phức tạp thời gian* là một công cụ hữu ích để ước chừng thời gian thực thi của một thuật toán, hay so sánh giữa các thuật toán với nhau.
Trong các kỳ thi lập trình, kích cỡ của tập dữ liệu thường được cho trước trong đề bài. Dựa vào điều đó, thí sinh có thể ước chừng *độ phức tạp* rồi tìm ra thuật toán phù hợp. Hoặc là khi đã nghĩ ra một vài thuật toán thì liệu thuật toán nào đáng để cài đặt? Nên chọn những thuật toán nào để cài đặt?
ĐPT BigO - phân tích dựa trên tiệm cận là một công cụ mạnh mẽ. Nhưng Big O bỏ qua các hằng số, và đôi khi các hằng số lại quan trọng. Vì thế phải sử dụng nó một cách khôn khéo nhất để đạt hiệu quả cao trong lập trình.
', 'int sum = 0;
for (int i = 0; i < n; i++)
    sum += i;
for (int j = 0; j < n; j++)
    sum += j;', '2026-10-06T10:32:14.666542');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_backtracking', 'Đệ quy và Thuật toán quay lui', 'basic', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/basic/backtracking.md', '["quay lui", "backtracking", "thử và sai", "n quân hậu", "sinh hoán vị"]', '---
title: Đệ quy và Thuật toán quay lui
description: 
published: true
date: 2024-08-26T09:35:00.358Z
tags: 
editor: markdown
dateCreated: 2023-12-25T10:59:48.774Z
---', '---
title: Đệ quy và Thuật toán quay lui
description: 
published: true
date: 2024-08-26T09:35:00.358Z
tags: 
editor: markdown
dateCreated: 2023-12-25T10:59:48.774Z
---

# Đệ quy và Thuật toán quay lui

**Người viết**:
- Nguyễn Đức Kiên, Trường Đại học Công nghệ, ĐHQGHN.

**Reviewer**:
- Nguyễn Minh Nhật, Trường THPT chuyên KHTN - ĐHKHTN - ĐHQGHN.
- Cao Thanh Hậu, Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM.
- Nguyễn Hoàng Vũ, Trường Đại học Công nghệ, ĐHQGHN.

# Mở đầu

![](/uploads/algo/basic/backtracking/BkRIUcdV2.jpg)
*Búp bê Matryoshka (ảnh trên Google Images)*

Trong cuộc sống, chúng ta đôi khi bắt gặp những hình ảnh về một vật mà chứa bên trong nó là một vật khác giống hệt nó, như búp bê Matryoska, cửa sổ OBS khi bạn cố dùng nó để quay màn hình của chính nó, sách giáo khoa Toán lớp 3 cũ, hoặc [link này](/algo/basic/backtracking), ... Tương tự như vậy, trong khoa học máy tính và lập trình, chúng ta xây dựng khái niệm về đệ quy.

# Đệ quy và giải thuật đệ quy
## Khái niệm
>Ta gọi một đối tượng là **đệ quy** (recursion) nếu nó được định nghĩa qua chính nó hoặc một đối tượng cùng dạng với chính nó bằng quy nạp.

*Ví dụ*:
- Với $n!$ thì ta có $n! = (n - 1)! \times n$
- Gọi $\gcd(a, b)$ là ước chung lớn nhất của $a$ và $b$ ($a \geq b$) thì ta có $\gcd(a, b) = \gcd(b, a \bmod b)$ với $\bmod$ là phép lấy phần dư

Nếu một bài toán $P$ có lời giải được thực hiện bằng một bài toán con $P''$ có dạng giống $P$ thì đó là một giải thuật đệ quy. Ở đây, $P''$ cần là một bài toán đơn giản hơn $P$ (có kích cỡ dữ liệu nhỏ hơn, hoặc độ phức tạp nhỏ hơn, ...), và đương nhiên không cần đến $P$ để giải nó.

Về cơ bản thì ta có thể gọi một hàm là đệ quy nếu hàm đó tự gọi chính nó, với các biến đầu vào có thể khác.

Một bài toán đệ quy có lời giải gồm 2 phần:
- **Phần neo/trường hợp cơ sở (anchor/base case)**: Đây là phần có thể giải trực tiếp mà không cần phải dựa vào một bài toán con nào, và cũng chính là điểm dừng của lời giải đệ quy. Phần này thường là các trường hợp cụ thể, như `x == 0`, `x == n`, ...
- **Phần đệ quy**: Đây chính là phần mà bạn phải gọi ra bài toán con và giải nó, cũng chính là gọi hàm đệ quy. Phần này sẽ được thực hiện đến khi nào bài toán đưa được về trường hợp cơ sở.

Nếu ta đem so sánh với con Matryoska, thì trường hợp cơ sở là con bé nhất ở trong cùng, còn đệ quy chính là thực hiện việc mở một con to liên tục đến lúc nào không thể mở được nữa.

Lý thuyết suông thì quá khó hiểu, hãy cùng xem một số ví dụ:

## Tính giai thừa
**Bài toán:** Cho số tự nhiên $n$ ($n \leq 15$). Tính $n!$

**Phân tích:**
Ở phần trên, chúng ta đã tìm được công thức đệ quy của bài toán này: $n! = (n - 1)! \times n$. Khi lập trình đệ quy, cơ bản thuật toán sẽ hoạt động như sau với $n = 2$: để tính $2!$, chúng ta phải tính nó qua $1!$; để tính $1!$ chúng ta phải tính $0!$. Lúc này, ta có hai lựa chọn:
- Tiếp tục với $0! = (-1)! \times 0$
- Thay $0! = 1$ vào và tính tiếp

Lựa chọn thứ nhất có vẻ không khả thi, phần vì $(-1)!$ không xác định, mặt khác nếu thay tiếp thì chúng ta cũng chẳng biết dừng ở đâu cả. Với $0! = 1$, ta có thể thay vào để tính $1!$ rồi. Có $1!$ ta lại thay nó vào tiếp để tính $2!$, và chúng ta có thứ chúng ta cần.

![Mô hình tính giai thừa đệ quy](/uploads/algo/basic/backtracking/OMVG6I2.png)

Phân tích thì dài dòng vậy thôi, còn cài đặt thì rất đơn giản:
```cpp
int factorial(int n) {
    if (n == 0)
        return 1;                //trường hợp cơ sở
    return factorial(n - 1) * n; //phần đệ quy
}
```

Nếu bạn chưa quen với cú pháp đệ quy như vậy thì có thể hiểu hàm trên tương đương với hàm `factorial_2()` trong đoạn code sau với $n = 2$:
```cpp
//n = 0
int factorial_0() {
    return 1;
}

//n = 1
int factorial_1() {
    return factorial_0() * 1;
}

//n = 2
int factorial_2() {
    return factorial_1() * 2;
}
```

## Tính số Fibonacci
Dãy Fibonacci là dãy số được định nghĩa theo công thức truy hồi sau:
$$
f_n =
\begin{cases}
0 & \text{với } n = 0\\
1 & \text{với } n = 1\\
f_{n - 2} + f_{n - 1} & \text{với } n > 1
\end{cases}
$$
Văn vẻ hơn thì trong dãy này, mỗi số hạng bằng tổng của hai số hạng liền trước nó. Các giá trị $f_0$, $f_1$ có thể khác một chút tuỳ tài liệu.

**Bài toán:** Tìm số Fibonacci thứ $n$ ($n \leq 20$).

Dựa vào công thức truy hồi đã cho và lập luận kiểu "để tính $f$ này thì ta cần có $f$ kia" như trên, chúng ta có thể cài đặt như sau:

```cpp
int fibo(int n) {
    if (n == 0)
        return 0; //trường hợp cơ sở
    if (n == 1)
        return 1;                     //trường hợp cơ sở
    return fibo(n - 2) + fibo(n - 1); //phần đệ quy
}
```

Cần chú ý rằng ở chương trình này cần có tới 2 trường hợp cơ sở, vì đó cũng là hai trường hợp không thể áp dụng công thức truy hồi.

**Mở rộng:** Hãy thử sử dụng phương pháp này để cài đặt một chương trình đệ quy tính ƯCLN dựa vào công thức ở ví dụ phía trên.

Đương nhiên, không phải bài toán đệ quy nào cũng để chúng ta nhìn thấy một công thức đệ quy đơn giản như vậy. Thậm chí, đôi khi chúng ta còn chẳng có một công thức cụ thể, mà chỉ đơn thuần là công việc được thực hiện sau đó có điểm tương đồng với phần trước thôi. Lúc này, ta cần giải đáp những câu hỏi:
- Bài toán có thể được giải qua những bài toán con nào tương tự không? Nếu được, đó là gì?
- Tới trạng thái nào, chúng ta sẽ dừng lại?

# Thuật toán quay lui
## Khái niệm
>Thuật toán **quay lui** (backtracking) dùng để giải bài toán liệt kê các cấu hình. Mỗi cấu hình được xây dựng bằng cách xây dựng từng phần tử, mỗi phần tử được chọn bằng cách thử tất cả các khả năng.

Tóm gọn lại, chúng ta đang xây dựng một danh sách gồm tất cả các tập hợp (hay dãy, ...), mà mỗi phần tử được xét tất cả các trường hợp có thể của nó. Phương pháp này cũng gọi là **duyệt vét cạn**.

Để cho khỏi "lú", trong bài viết này chúng ta thống nhất sẽ dùng cụm từ **danh sách các tập hợp/dãy/xâu**.

*Ví dụ*: khi tìm danh sách các dãy nhị phân (các dãy gồm toàn các ký tự $0$, $1$ như dãy $0001011$) độ dài $3$, ta sẽ:
- Xét mọi trường hợp ký tự thứ nhất. Ta được `0` hoặc `1`.
- Với mỗi trường hợp của ký tự thứ nhất, xét tiếp mọi trường hợp ký tự thứ hai. Ta được `00`, `01` từ `0` ở bước trước và `10`, `11` từ `1` ở bước trước.
- Tương tự, với mỗi trường hợp của ký tự thứ hai, ta xét nốt mọi trường hợp ở ký tự thứ ba. Các dãy nhận được là `000`, `001`, `010`, `011`, `100`, `101`, `110`, `111`
Nếu bạn vẫn chưa hiểu các dãy này được tạo dựng theo thứ tự như thế nào, hãy xem sơ đồ ở phần dưới.

Trên phương diện quy nạp, nếu cần dựng danh sách các tập hợp mà mỗi tập có dạng $\{x_1, x_2, \ldots, x_n\}$, ta xét mọi giá trị của $x_1$, rồi sau đó duyệt tiếp $\{x_2, x_3, \ldots, x_n\}$, tiếp tục xét mọi giá trị $x_2$, rồi lại duyệt $\{x_3, x_4, \ldots, x_n\}$, ..., cho đến khi nào tất cả các giá trị đều đã xác định. Lúc này, ta lưu tập vừa tạo lại vào danh sách và tiếp tục chuyển sang tập khác từ các giá trị khác của các $x_i$

```cpp
void backtrack(int pos)
{
    // Trường hợp cơ sở
    if (<pos là vị trí cuối cùng>)
    {
        <output/lưu lại tập hợp đã dựng nếu thoả mãn>
        return;
    }

    //Phần đệ quy
    for (<tất cả giá trị i có thể ở vị trí pos>)
    {
        <thêm giá trị i vào tập đanh xét>
        backtrack(pos + 1);
        <xoá bỏ giá trị i khỏi tập đang xét>
    }
}
```

Việc thêm giá trị mới vào tập đang xét rồi cuối cùng xoá bỏ nó ra khỏi tập giải thích cho tên gọi "quay lui" của thuật toán. Đó là việc khôi phục lại trạng thái cũ của tập hợp sau khi kết thúc việc gọi đệ quy.

Bạn đọc có thể thử vẽ sơ đồ tính toán giống như bài giai thừa ở trên và quen sát xem các hàm đệ quy được gọi ra theo thứ tự như thế nào.

Bạn vừa tiếp thu một lượng khá lớn kiến thức, và có thể sẽ gặp chút vấn đề. Không sao, chúng ta hãy đi vào ví dụ để hiểu hơn.

## Sinh các dãy nhị phân
**Bài toán:** Liệt kê tất cả các dãy nhị phân độ dài $n$, là dãy có tất cả $n$ ký tự và gồm toàn các ký tự $0$ và $1$.
Ví dụ, với $n = 3$ ta có các dãy $000, 001, 010, 011, 100, 101, 110, 111$.

**Phân tích:**
Ở ví dụ phía trên, chúng ta đã nói về việc xét mọi trường hợp để xây dựng các dãy này như thế nào. Khi cài đặt đệ quy, sử dụng tư duy quy nạp "xây tập sau từ tập trước", thuật toán sẽ hoạt động như sau:

![](/uploads/algo/basic/backtracking/QqypRGl.png)

Tại hàm `gen(1)`, ta xét từng giá trị của ký tự hiện tại, sau đó gọi `gen(2)` với từng ký tự đó. Tương tự như vậy, ta gọi `gen(3)` từ các ký tự ở `gen(2)` và rồi `gen(4)`. Tới `gen(4)`, ta đã duyệt hết các vị trí và không thể thử thêm nữa, nên có thể in ra xâu.

```cpp
#include <bits/stdc++.h>

using namespace std;

int n;
string curString;

void genString(int pos) {
    if (pos > n) {
        cout << curString << "\n";
        return;
    }
    for (char i = ''0''; i <= ''1''; i++) {
        curString.push_back(i); //thêm ký tự mới vào dãy
        genString(pos + 1);
        curString.pop_back(); //bỏ ký tự này đi
    }
}

int main() {
    cin >> n;
    curString = "";
    genString(1);

    return 0;
}
```
Chú ý rằng, cách sinh này cũng chưa phải là tốt nhất nếu xét về độ dài của code. Sử dụng các phép toán trên bit của C++ sẽ giúp liệt kê tất cả các dãy trên với một đoạn code đơn giản hơn nhiều mà thời gian chạy vẫn không chậm hơn (tất nhiên là không cần sử dụng đệ quy).

## Sinh tổ hợp (tập hợp con)
**Bài toán:** Cho tập $S = \{1, 2, 3, \ldots, n\}$. In ra tất cả các tập con có chính xác $k$ phần tử của $S$. Hai tập con là hoán vị của nhau chỉ tính là một.

**Phân tích:**
Có một số ý tưởng cho bài này, như biểu diễn tập hợp bằng một dãy nhị phân rồi tìm các dãy có đúng $k$ ký tự $1$, hay lần lượt xây dựng các số trong dãy sao cho số sau lớn hơn số trước đến khi đủ $k$. Mình sẽ trình bày hướng thứ hai.

Để tránh trùng lặp, ta luôn luôn dựng các tập con $P$ là các dãy thoả mãn $P_i > P_{i - 1}$, hay mọi phần tử đều lớn hơn hẳn phần tử được dựng trước đó. Giả sử ta đã xây dựng được dãy đến vị trí thứ $i$, và $P_i$ là giá trị cuối cùng được thêm vào. Tại vị trí thứ $i+1$, do có $P_{i + 1} > P_i$, nên ta chỉ thử các số từ $P_{i} + 1$ đến $n$.

Phần đệ quy sẽ kết thúc khi tập con đã có đủ $k$ phần tử.

Sử dụng ý tưởng trên ta cài đặt như sau:

```cpp
#include <bits/stdc++.h>

using namespace std;

int n, k;
vector<int> curSubset;

//Hàm đệ quy
void printSubset() {
    for (int i : curSubset)
        cout << i << " ";
    cout << "\n";
}

void genSubset(int pos) {
    int lastNum = (curSubset.empty() ? 0 : curSubset.back()); //số cuối cùng được chọn
    for (int i = lastNum + 1; i <= n; i++) {
        curSubset.push_back(i);
        if (curSubset.size() == k)
            printSubset();
        else
            genSubset(pos + 1);
        curSubset.pop_back();
    }
}

int main() {
    cin >> n >> k;
    curSubset.clear();
    genSubset(1);

    return 0;
}
```

**Mở rộng:** Vẫn đề bài trên nhưng giờ bỏ đi điều kiện "Hai tập con là hoán vị của nhau chỉ tính là một." thì chúng ta sẽ làm như thế nào? (gợi ý: lúc này thay vì có mọi số lớn hơn số liền trước, ta chỉ cần các số trong tập hợp khác nhau là đủ)

Còn về hướng biểu diễn dãy nhị phân, bạn đọc hãy thử tự suy nghĩ và cài đặt. Trong lập trình thi đấu, khi phải duyệt mọi tập con, cách này dễ đọc và hiệu quả hơn hẳn. Nhưng đây là bài giới thiệu về đệ quy nên là...

## Bài toán phân tích số
**Bài toán:** Ở một quốc gia có $n$ loại tiền gồm các mệnh giá $a_1, a_2, \ldots, a_n$ ($n \leq 10$). Có những cách nào để lấy các tờ tiền sao cho tổng mệnh giá của chúng là $S$? Biết rằng mỗi mệnh giá tiền có thể được lấy nhiều lần và hai cách lấy là hoán vị của nhau chỉ tính là một.
Ví dụ: với 3 loại tiền mệnh giá $10, 20, 50$, có $10$ cách lấy tiền để có tổng là $100$, bao gồm $10$ tờ $10$, hoặc $2$ tờ $50$, hoặc $3$ tờ $10$, $1$ tờ $20$ và $1$ tờ $50$, ...

Một cách rất tự nhiên, chúng ta sẽ tiếp tục làm tương tự như bài trước: lưu các tờ tiền đã có vào một tập hợp, sau đó lấy tiền sao cho tờ sau có mệnh giá không nhỏ hơn tờ trước. Hàm đệ quy như thế sẽ có dạng `genMoneySet(int pos)`.

Vậy thì khi nào chúng ta dừng lại? Đó là khi tổng số tiền chúng ta đã lấy được đạt mức yêu cầu, hoặc lớn hơn. Khi đó, kết quả hợp lệ sẽ là trường hợp số tiền đạt mức yêu cầu.

Trong quá trình cài đặt, song song với việc duy trì một tập hợp tiền đang xây dựng `curMoneySet`, chúng ta sẽ cần lưu thêm một giá trị tổng `curMoneySum` để đơn giản tính toán.

```cpp
#include <bits/stdc++.h>

using namespace std;

int n, a[15];
long long S, curMoneySum;
vector<int> curMoneySet;

void printMoneySet() {
    for (auto i : curMoneySet)
        cout << a[i] << " ";
    cout << "\n";
}

//Hàm đệ quy
void genMoneySet(int pos) {
    int lastIndex = (curMoneySet.empty() ? 1 : curMoneySet.back());
    for (int i = lastIndex; i <= n; i++) {
        //Lấy thêm 1 tờ tiền mới vào tập hợp
        curMoneySet.push_back(i);
        curMoneySum += a[i];

        //Gọi đệ quy
        if (curMoneySum >= S) {
            if (curMoneySum == S)
                printMoneySet();
        } else
            genMoneySet(pos + 1);

        //Bỏ tờ tiền này ra khỏi tập hợp
        curMoneySet.pop_back();
        curMoneySum -= a[i];
    }
}

int main() {
    cin >> n >> S;
    for (int i = 1; i <= n; i++)
        cin >> a[i];
    curMoneySet.clear();
    curMoneySum = 0;
    genMoneySet(1);

    return 0;
}
```

Nếu bạn đọc để ý kỹ thì chúng ta không sử dụng tham số `pos` trong hàm `genMoneySet` vào mục đích gì cả. Có thể bỏ tham số này đi, và chúng ta có một hàm đệ quy không tham số. Tham số này ở đây chỉ giúp chúng ta hiểu hàm này hơn thôi.

## Bài toán xếp hậu
[Xếp hậu](https://en.wikipedia.org/wiki/Eight_queens_puzzle) là bài toán rất kinh điển, có lẽ nếu bạn học đệ quy quay lui ở đâu thì cũng sẽ gặp.

**Bài toán:** Tìm tất cả các cách xếp $n$ ($n \leq 12$) quân Hậu lên một bàn cờ $n \times n$ sao cho không có hai quân Hậu nào có thể ăn được nhau. Nếu có hai cách là hoán vị của nhau (về vị trí) thì chỉ tính là một, ví dụ hai tập hợp $\{(1, 2), (3, 4), (5, 6)\}$ và $\{(1, 2), (5, 6), (3, 4)\}$ chỉ lấy $1$. Hai quân Hậu được gọi là có thể ăn được nhau nếu chúng nằm cùng hàng, cột hoặc đường chéo của bàn cờ.

![](/uploads/algo/basic/backtracking/FQTQrW0.png)
(Hình ảnh tìm trên Google Images)

**Phân tích:**
Giả sử quân Hậu thứ $i$ nằm ở hàng $x_i$ và cột $y_i$. Cách gọi này hơi ngược một chút so với hệ toạ độ Decartes thông thường nhưng nó sẽ rất hợp cho những bài toán liên quan đến bảng.

Khi nào thì hai quân Hậu $A$ và $B$ ăn nhau?
- Khi $A$ và $B$ nằm cùng hàng, tức là $x_A = x_B$.
- Khi $A$ và $B$ nằm cùng cột, tức là $y_A = y_B$.
- Khi $A$ và $B$ nằm trên cùng đường chéo. Lúc này có hai trường hợp:
    - $x_A + y_A = x_B + y_B$
    - $x_A - y_A = x_B - y_B$

Đối với đường chéo, bạn đọc có thể tự kiểm chứng thấy rằng, hiệu hoặc tổng của chỉ số hàng và chỉ số cột luôn luôn là một số không đổi đối với hai phần tử cùng đường chéo, lần lượt ứng với đường chéo chính (hướng tây bắc - đông nam) và đường chéo phụ (hướng đông bắc - tây nam).

Vậy thì, việc của chúng ta bây giờ chỉ là sinh ra những bộ toạ độ đôi một thoả mãn các điều kiện trên thôi. Chúng ta sẽ sinh các bộ toạ độ này lần lượt theo từng hàng, và đảm bảo rằng quân Hậu sau sẽ không cùng cột và cùng đường chéo với quân Hậu trước. Để khỏi phải `for` lại từ đầu tập đã sinh để kiểm tra trùng lặp, chúng ta sẽ duy trì một số mảng đánh dấu cột, đường chéo phụ, đường chéo chính: `isInCol[]`, `isInDiag1[]`, `isInDiag2[]`
- `isInCol[k]` nhận giá trị `true` nếu đã có một quân Hậu đã nằm ở cột $k$.
-  `isInDiag1[k]` nhận giá trị `true` nếu đã có một quân Hậu đã nằm ở đường chéo phụ có tổng toạ độ $x$ và $y$ là $k$
-  `isInDiag2[k]` nhận giá trị `true` nếu đã có một quân Hậu đã nằm ở đường chéo chính có hiệu toạ độ $x$ và $y$ là $k$

Một vòng đệ quy sẽ kết thúc nếu ta sinh thành công $n$ quân Hậu. Lúc này, ta chỉ việc in kết quả, và đi tiếp tới các trường hợp khác.

```cpp
#include <bits/stdc++.h>

using namespace std;

int n;

//mảng đánh dấu cột, đường chéo phụ và đường chéo chính
bool isInCol[13], isInDiag1[26], isInDiag2[26];

//gọi 2 tập riêng chi hàng và cột
//tập X có thể bỏ qua do các quân Hậu được sinh lần lượt theo từng hàng
vector<int> curQueensSetX, curQueensSetY;

//In kết quả dạng (X, Y)
void printQueensSet() {
    for (int i = 0; i < n; i++) {
        cout << "(" << curQueensSetX[i] << ", " << curQueensSetY[i] << ")";
        if (i < n - 1)
            cout << ", ";
    }
    cout << "\n";
}

//Hàm đệ quy
void genQueensSet(int curRow) {
    for (int curCol = 1; curCol <= n; curCol++) {
        //Xác định đường chéo phụ và chính hiện tại
        int curDiag1 = curRow + curCol;
        int curDiag2 = curRow - curCol + 13; //+13 để tránh chỉ số âm

        //Kiểm tra toạ độ mới xem có thoả mãn không
        if (isInCol[curCol] == true)
            continue;
        if (isInDiag1[curDiag1] == true)
            continue;
        if (isInDiag2[curDiag2] == true)
            continue;

        //Thêm nó vào tập hợp hiện tại nếu thoả mãn
        curQueensSetX.push_back(curRow);
        curQueensSetY.push_back(curCol);
        isInCol[curCol] = true;
        isInDiag1[curDiag1] = true;
        isInDiag2[curDiag2] = true;

        //Gọi đệ quy thêm quân tiếp theo hoặc in kết quả
        if (curQueensSetX.size() == n)
            printQueensSet();
        else
            genQueensSet(curRow + 1);

        //Xoá quân vừa thêm vào khỏi tập hợp
        curQueensSetX.pop_back();
        curQueensSetY.pop_back();
        isInCol[curCol] = false;
        isInDiag1[curDiag1] = false;
        isInDiag2[curDiag2] = false;
    }
}

int main() {
    cin >> n;

    memset(isInCol, 0, sizeof(isInCol));
    memset(isInDiag1, 0, sizeof(isInDiag1));
    memset(isInDiag2, 0, sizeof(isInDiag2));

    genQueensSet(1);

    return 0;
}
```

Nếu bạn thực hiện thuật toán một cách chính xác, với $n = 8$ bạn sẽ thu được $92$ cách xếp thoả mãn. $92$ cách có vẻ nhiều, nhưng nếu không code, liệu bạn có xếp được không? :)).

# Kỹ thuật Nhánh cận
Trong một số trường hợp, thay vì yêu cầu liệt kê tất cả các cách chọn thoả mãn, ta sẽ phải tìm xem cách nào là **cách chọn tốt nhất**. Khi đó, việc dùng phương pháp **nhánh cận** (branch and bound) sẽ giúp chúng ta giải những bài toán dạng như vậy.

Thực chất, đây vẫn là thuật toán quay lui, nhưng thay vì in ra hoặc lưu lại tất cả kết quả trong mỗi lần tính toán, ta cập nhật lại trạng thái tốt nhất. Để thuật toán tối ưu hơn, nếu tại một bước, bất kỳ bước nào tiếp theo cũng không thể làm cho kết quả tốt hơn kết quả hiện có, ta có thể bỏ qua nó luôn.

Phương pháp nhánh cận thường được sử dụng trong các bài toán mà tại một vòng đệ quy, mọi cách đi tiếp đều không thể đưa ra một trường hợp thoả mãn. Từ đó, ta loại bỏ những công đoạn không cần thiết.

Quay trở lại bài toán phân tích số ở trên. Lần này, ta sẽ thêm vào đề bài một điều kiện:
"Số tờ tiền được xếp ra là nhỏ nhất. Nếu có nhiều cách xếp thoả mãn, chọn cách bất kỳ."

Vẫn với ý tưởng đệ quy như trên, chúng ta hoàn toàn có thể liệt kê tất cả cách xếp rồi lấy cách tốt nhất. Tuy nhiên, rõ ràng tại một số cách, số tiền còn lại khi duyệt tới những tờ giữa đã hơi "cấn" rồi. Ví dụ đã có một cách xếp $2 \times 20 + 1 \times 10 + 1 \times 50 = 100$, trong một bước khác mới xét tới $5 \times 10$ thôi đã chẳng còn ý nghĩa gì. Những cách đó có thể bỏ đi để chương trình chạy nhanh hơn.

```cpp
#include <bits/stdc++.h>

using namespace std;

int n, a[15];
long long S, curMoneySum;
vector<int> curMoneySet, bestSet;

void genMoneySet(int pos) {
    int lastIndex = (curMoneySet.empty() ? 1 : curMoneySet.back());
    for (int i = lastIndex; i <= n; i++) {
        curMoneySet.push_back(i);
        curMoneySum += a[i];

        if (curMoneySum >= S) {
            if (curMoneySum == S) {
                bestSet.clear();
                for (int i : curMoneySet)
                    bestSet.push_back(i);
            }
        } else if (bestSet.empty() || curMoneySet.size() < bestSet.size()) //loại ngay nếu không tối ưu
            genMoneySet(pos + 1);

        curMoneySet.pop_back();
        curMoneySum -= a[i];
    }
}

int main() {
    cin >> n >> S;
    for (int i = 1; i <= n; i++)
        cin >> a[i];
    curMoneySet.clear();
    curMoneySum = 0;
    bestSet.clear();
    genMoneySet(1);

    for (int i : bestSet)
        cout << a[i] << " ";
    cout << "\n";

    return 0;
}
```

# Chú ý thêm
## Vì sao lại dùng đệ quy?
Ưu điểm mà chúng ta thấy ngay được của việc sử dụng đệ quy là viết code ngắn gọn hơn. Lấy ví dụ, khi tính số Fibonacci mà không sử dụng đệ quy, ta sẽ phải tạo hai biến nhớ cho số gần thứ nhì và gần nhất, cộng chúng lại, lưu vào biến mới rồi cập nhật hai biết nhớ; hoặc có thể sử dụng mảng rồi cập nhật lại sao mỗi lần tính. Chúng đều làm cho đoạn code trở nên dài hơn một chút so với việc dùng đệ quy ở trên. Nhưng ở những bài toán lớn hơn, ví dụ như những bài toán sinh dãy ở trên, việc không sử dụng đệ quy sẽ làm bài lời giải của chúng ta cồng kềnh hơn rất nhiều.

Một ưu điểm khác của đệ quy giúp giải dễ dàng các bài toán có dạng một phần nhỏ hơn của công việc cộng thêm một vài lệnh khác, ví dụ như các bài toán duyệt cây và đồ thị.

Tất nhiên, đệ quy không phải công cụ toàn năng. Đệ quy làm cho thuật toán trở nên khó hiểu hơn khi đọc trực tiếp, đặc biệt là với những thuật toán dài. Đệ quy cũng sử dụng thời gian và bộ nhớ hơn so với phương pháp duyệt trực tiếp, do bộ nhớ cần phải lưu trữ lại stack các hàm đệ quy.

## Một số ứng dụng của đệ quy
Ngoài các bài toán sinh hoặc duyệt vét cạn, đệ quy còn được sử dụng phổ biến trong các bài toán duyệt cây, duyệt đồ thị và quy hoạch động. Rất nhiều bài toán "chia để trị" khác cũng sử dụng đệ quy, điển hình là thuật toán QuickSort.

## Độ phức tạp của đệ quy
Một hàm đệ quy có dạng như sau:
```cpp
void recursive(int x) {
    if (x > n)
        return;
    for (int i = 1; i <= m; i++)
        recursive(x + 1);
}
```
Hàm trên được gọi đệ quy $n$ lần, mỗi lần phải thực hiện $m$ lần vòng lặp nên độ phức tạp sẽ là $\mathcal{O}(m^{n})$.

Có thể thấy, các thuật toán đệ quy có thể có độ phức tạp rất lớn, nhiều khi lên tới hàm mũ, tuy vậy lại có lúc nhỏ cỡ $\log$ như hàm tính ƯCLN. Do vậy, việc xác định số lần bị gọi của hàm đệ quy rất quan trọng.

Những bài toán yêu cầu duyệt vét cạn như ở trên thường đòi hỏi phải duyệt trên mọi trạng thái chưa biết, và vì thế dữ liệu đầu vào rất nhỏ.

Có một cách hiệu quả để xác định độ phức tạp của các hàm đệ quy là [định lý thợ (Master Theorem)](https://en.wikipedia.org/wiki/Master_theorem_(analysis_of_algorithms)) (tên gọi tiếng Việt có thể khác tuỳ tài liệu). Chúng ta sẽ không đi sâu vào nó trong bài viết này.

Ngoài ra, trong một số bài toán yêu cầu tính toán ta cũng có thể lưu lại kết quả trả về của một vài vòng đệ quy để không phải duyệt lại những phần đã duyệt rồi. Phương pháp này gọi là **đệ quy có nhớ**.

# Luyện tập
- [Một số bài tập trên VNOI](https://oj.vnoi.info/contest/backtrack)
- [MNS](https://community.topcoder.com/stat?c=problem_statement&pm=1744&rd=4545)
- [Bridge Crossing](https://community.topcoder.com/stat?c=problem_statement&pm=1599&rd=4535)
- [Weird Rooks](https://community.topcoder.com/stat?c=problem_statement&pm=3998&rd=6533)
- Giải Sudoku: Hãy thử vào [sudoku.com](https://sudoku.com), tìm một bảng Sudoku bất kì rồi thử viết một chương trình sử dụng đệ quy quay lui để giải nó.
# Tài liệu tham khảo
- Lê Minh Hoàng (2003), *Giải thuật và lập trình*
', 'int factorial(int n) {
    if (n == 0)
        return 1;                //trường hợp cơ sở
    return factorial(n - 1) * n; //phần đệ quy
}', '2026-10-06T10:32:15.176003');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_divide_and_conquer', 'Chia để trị (Divide and Conquer)', 'basic', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/basic/divide-and-conquer.md', '["chia để trị", "divide and conquer", "quicksort", "mergesort"]', '---
title: Chia để trị (Divide and Conquer)
description: 
published: true
date: 2024-09-13T06:07:28.334Z
tags: 
editor: markdown
dateCreated: 2024-05-07T11:59:22.050Z
---', '---
title: Chia để trị (Divide and Conquer)
description: 
published: true
date: 2024-09-13T06:07:28.334Z
tags: 
editor: markdown
dateCreated: 2024-05-07T11:59:22.050Z
---

# Chia để trị (Divide and Conquer)
**Tác giả:**
- Nguyễn Đức Kiên, Trường Đại học Công nghệ, ĐHQGHN

**Reviewer:**
- Nguyễn Hoàng Vũ - Trường Đại học Công nghệ, ĐHQGHN
- Nguyễn Minh Nhật - THPT chuyên Khoa học Tự nhiên, ĐHQGHN

## Mở đầu

**Chia để trị (Divide and Conquer, DnC)** chỉ việc chia nhỏ bài toán thành các phần nhỏ có cùng dạng với nó, tới khi có thể giải được một cách dễ dàng (thường là có ngay kết quả), sau đó dùng các kết quả này kết hợp lại để giải được bài toán lớn. Các bước để giải một bài toán chia để trị bao gồm:

-   Chia bài toán thành các bài toán con (thường là chia đôi hoặc xấp xỉ như vậy).
-   Giải các bài toán con. Nếu vẫn gặp khó khăn với các bài toán con, ta lại tiếp tục chia nó thành các bài toán nhỏ hơn cho tới khi dễ dàng tìm được kết quả.
-   Tổng hợp kết quả các bài toán con lại để có kết quả của bài toán lớn nếu cần.

Bạn đọc có thể thấy những bước trên có phần tương đồng với quá trình làm các bài toán đệ quy cơ bản. Các bài toán đó cũng có thể coi là chia để trị, và đệ quy cũng là một cách để cài đặt các thuật chia để trị.

Tư tưởng chia để trị cũng xuất hiện rất đa dạng và phổ biến trong các bài toán, thuật toán và cấu trúc dữ liệu: tìm kiếm nhị phân, cấp trúc cây tìm kiếm nhị phân (BST), heap, cây phân đoạn (segment tree), cây BIT/Fenwick, mảng thưa, các thuật toán sắp xếp, luỹ thừa nhanh, ...

## Xác định độ phức tạp

Ta nhắc lại một vài ký hiệu trước khi vào phần này:

-   $\log_a b$: Logarit cơ số $a$ của $b$, là số thực $k$ thoả mãn $a^{k} = b$. Bài viết này sẽ sử dụng ký hiệu $\log b$ cho trường hợp $a = 2$.
-   $T(n)$: Thời gian chạy thuật toán với kích thước dữ liệu đầu vào là $n$, tính bằng số phép tính.
-   $\mathcal{O}()$ (big-O): Các hàm độ phức tạp thuật toán. Chi tiết bạn đọc tham khảo [Độ phức tạp thời gian](/algo/basic/computational-complexity.md)

Chi tiết về các ký hiệu độ phức tạp và thời gian bạn đọc có thể tham khảo bài .

### Định lý Thợ (Master theorem)

Các công thức dưới đây được nhắc đến trong sách _Introduction to Algorithms_ (xem phần Tài liệu tham khảo). Chưa rõ tên tiếng Việt của thuật toán có nguồn gốc từ đâu.

Độ phức tạp của các thuật toán chia để trị cài đặt dưới dạng đệ quy được xác định bằng **Định lý Thợ**.

Giả sử có một bài toán $P$ với dữ liệu đầu vào có độ lớn là $n$ (mảng có độ dài $n$ chẳng hạn) được cài đặt bằng đệ quy, tại mỗi vòng đệ quy bài toán được chia thành $a$ bài toán con như sau:

```cpp=
void P(<input kích thước n>)
{
    if (n < k)  //k là một hằng số
    {
        <giải bài toán trực tiếp (base case)>
    }
    else
    {
        for (int i = 1; i <= a; i ++)
        {
            P(<input kích thước n/b>);
        }
        <kết hợp kết quả các bước trên>
    }
}
```

Nếu ta coi mỗi bài toán con là một nút trên một cây và mỗi lần gọi đệ quy từ một bài toán con ta nối thêm một nút con vào nút biểu diễn bài toán nói trên thì bài toán lớn của chúng ta sẽ có dạng như sau:

![problem tree](/uploads/algo/basic/divide-and-conquer/SJGSaKEk6.png)

Tại mỗi nút của cây trên, nếu việc kết hợp kết quả các bài toán con mất $f(n)$ thời gian, thì thời gian chạy tại một nút với kích thước dữ liệu là $n$ có thể được tính theo công thức truy hồi:

$$
T(n) = \begin{cases}
 a \times T\left(\frac{n}{b}\right) + f(n) &\text{khi } n \geq k\\
 \mathcal{O}(1) &\text{khi } n < k
 \end{cases}
$$

với $k$ là một hằng số nào đó, tuỳ thuộc vào thuật toán.

Ví dụ, với thuật toán MergeSort, tại mỗi bước ta chia một đoạn có độ dài $n$ thành hai đoạn con có độ dài $\frac{n}{2}$ hoặc xấp xỉ số đó. Thuật toán sẽ có thời gian chạy là $T(n) = 2T\left(\frac{n}{2}\right) + \mathcal{O}(n)$ khi $n > 1$ và $\mathcal{O}(1)$ khi $n = 1$.

Bây giờ, ta lại xét giá trị $f(n)$. Giả sử $f(n)$ viết được dưới dạng $\mathcal{O}(n^{p}\log^{q} n)$ (Định lý Thợ chỉ áp dụng khi $f(n)$ có độ phức tạp đa thức). Chúng ta có thể tiếp tục thu gọn biểu thức như sau:
| Quan hệ $a$ và $b^{p}$ | Biểu thức $T(n)$ |
|---|---|
| $a > b^{p}$ | $T(n) = \mathcal{O}(n^{\log_b a})$ |
| $a = b^{p}$ | $T(n) = \mathcal{O}(n^{\log_b a}\log^{q + 1} n)$ khi $q > -1$ <br> $T(n) = \mathcal{O}(n^{\log_b a}\log\log n)$ khi $q = -1$ <br> $T(n) = \mathcal{O}(n^{\log_b a})$ khi $q < -1$ |
| $a < b^{p}$ | $T(n) = \mathcal{O}(n^{p}\log_q n)$ khi $q \geq 0$ <br> $T(n) = \mathcal{O}(n^{p})$ khi $q < 0$ |

Một số ví dụ:

-   Thuật toán Tìm kiếm nhị phân (Binary search) mỗi lần chia bài toán thành 2 phần bằng nhau nhưng chỉ xét 1, không cần kết hợp kết quả sẽ có $T(n) = T\left(\frac{n}{2}\right) + \mathcal{O}(1)$. Thời gian chạy trung bình của thuật toán là $T(n) = \mathcal{O}(\log n)$, ứng với $a = 1, b = 2, p = 0, q = 0$.
-   Thuật toán MergeSort chia đôi dãy hiện tại thành 2 phần bằng nhau, lấy cả 2 và phải xét lại cả 2 phần để lấy kết quả sẽ có $T(n) = 2T\left(\frac{n}{2}\right) + \mathcal{O}(n)$. Thời gian chạy trung bình của thuật toán là $T(n) = \mathcal{O}(n\log n)$, ứng với $a = 2, b = 2, p = 1, q = 0$ (Chi tiết về thuật MergeSort bạn đọc có thể đọc phần dưới).
-   Một thuật toán chia để trị có $T(n) = 3T\left(\frac{n}{2}\right) + \log^{2} n$. Thời gian chạy trung bình của thuật toán là $T(n) = \mathcal{O}(n^{\log_2 3})$, tương ứng với $a = 3, b = 2, p = 0, q = 2$.

Định lý Thợ là một công cụ hữu hiệu để xác định độ phức tạp của một thuật toán chia để trị. Chỉ cần xác định được số bài toán con, kích thước dữ liệu các bài toán con và độ phức tạp của việc kết hợp dữ liệu, ta dễ dàng tìm ra độ phức tạp chung của bài toán.

## Một số ví dụ áp dụng Chia để trị

Các bài toán áp dụng Chia để trị chỉ có chung một phương pháp như đã nói ở trên. Khi sử dụng, thứ mà ta quan tâm chủ yếu là độ phức tạp; thông thường, chia để trị là công cụ tối ưu độ phức tạp khá hiệu quả.

### MergeSort

**Đề bài**: Sắp xếp một dãy gồm $n$ số nguyên $(n \leq 10^{6})$.

#### Phân tích thuật toán

Đây là một thuật toán sắp xếp nổi tiếng và cũng hay được áp dụng (nếu không được phép sử dụng các thư viện có sẵn). Thuật toán này sử dụng phương pháp đệ quy. Tại mỗi vòng đệ quy, giả sử đang cần sắp xếp một đoạn $[l, r]$ ta chia dãy làm hai phần bằng nhau, $[l, mid]$ và $[mid + 1, r]$ với $mid = \left\lfloor \frac{l + r}{2} \right\rfloor$. Sau khi đã gọi đệ quy các đoạn con, ta tiến hành hợp nhất hai đoạn này. Việc hợp nhất hai đoạn đã sắp xếp được tiến hành bằng phương pháp [hai con trỏ](/algo/basic/two-pointers.md), có độ phức tạp là $\mathcal{O}(n)$. Trong trường hợp một đoạn chỉ có một phần tử duy nhất, ta coi như nó đã được sắp xếp.

![Minh hoạ MergeSort](/uploads/algo/basic/divide-and-conquer/Skh8YzQxa.png)


#### Cài đặt

:::spoiler **Nhấn để hiện code**

```cpp=
//Ghép hai đoạn [l1, r1], [l2, r2] thành một đoạn bắt đầu từ l1
void merge(int a[], int l1, int r1, int l2, int r2) {
    int cur = l2;
    vector<int> newArr;
    for (int i = l1; i <= r1; i++) {
        while (cur <= r2 && a[cur] < a[i]) {
            newArr.push_back(a[cur]);
            cur++;
        }
        newArr.push_back(a[i]);
    }
    for (int j = cur; j <= r2; j++)
        newArr.push_back(a[j]);
    for (int i = 0; i < newArr.size(); i++)
        a[l1 + i] = newArr[i];
}

void mergeSort(int a[], int l, int r) {
    if (l == r)
        return;
    int mid = (l + r) / 2;
    mergeSort(a, l, mid);
    mergeSort(a, mid + 1, r);
    merge(a, l, mid, mid + 1, r);
}
```

Hàm `merge()` trong đoạn code trên có thể thay thế bằng hàm `merge()` trong thư viện `algorithm`.
:::

#### Đánh giá

Theo như phân tích độ phức tạp đã đề cập ở trên, độ phức tạp trung bình của MergeSort là $\mathcal{O}(n\log n)$. Thực tế thì trong mọi trường hợp, độ phức tạp của MergeSort luôn là $\mathcal{O}(n\log n)$.

### Cặp điểm gần nhất

**Đề bài**: Cho $n$ điểm trên mặt phẳng $(2 \leq n \leq 10^{5})$. Hãy tìm khoảng cách nhỏ nhất giữa hai điểm bất kỳ trong đó.

_Đề bài VNOI_: [NEAREST](https://vnoi.info/problems/NEAREST/)

#### Phân tích

Giả sử có $n$ điểm $A_1, A_2, \ldots, A_n$.

Ta có thể sử dụng một thuật toán "ngây thơ" cho bài này: xét tất cả mọi cặp điểm, kiểm tra xem khoảng cách giữa hai cặp điểm nào là gần nhau nhất. Độ phức tạp khi đó sẽ là $\mathcal{O}(n^{2})$ trong mọi trường hợp, chưa đủ để vượt qua giới hạn của bài toán này.

Ta nghĩ đến việc sử dụng chia để trị. Trước hết, ta sắp xếp các điểm trong tập hợp theo hoành độ $x$. Tại mỗi vòng đệ quy, ta chia tập điểm hiện tại thành hai phần bên trái và bên phải vị trí $mid$ ta chọn. Base case (trường hợp cơ bản) lúc này thay vì là $l = r$ thì sẽ là $r - l \leq 2$, do ta không thể xác định khoảng cách với $1$ điểm, và cũng cần đảm bảo rằng khi chạy đệ quy không tồn tại tập nào có độ lớn như vậy. Ngoài trường hợp đó, ta thu được kết quả của 2 tập trái và phải. Tuy nhiên, việc kết hợp kết quả không đơn giản, vì một điểm ở bên trái $A_{mid}$ vẫn có thể tạo ra khoảng cách ngắn nhất với một điểm bên phải. Ta cũng không thể chạy hết từng cặp điểm một trong hai tập này, vì khi đó theo Định lý Thợ độ phức tạp trung bình sẽ lên đến $\mathcal{O}(n^{2})$.

![nearest1](/uploads/algo/basic/divide-and-conquer/ryCGGq4kT.png)

Ở hình vẽ trên, hai màu xanh và đỏ tượng trưng cho hai nửa phải và trái. Điểm $A_4$ đóng vai trò là $A_{mid}$, thuộc tập bên phải.

Gọi $d$ là giá trị nhỏ hơn giữa khoảng cách ngắn nhất giữa hai điểm ta vừa thu được ở tập bên phải và tập bên trái. Cụ thể:
$$
d = \min\{\operatorname{nearest}(l, mid), \operatorname{nearest}(mid + 1, r)\}
$$
Khi đó, trong cùng một tập hợp, không tồn tại một cặp điểm nào có khoảng cách ngắn hơn $d$. Giữa hai tập hợp lúc này ta sẽ chỉ quan tâm đến các cặp điểm có khoảng cách nhỏ hơn $d$.

Xét các điểm có hoành độ cách $A_{mid}$ một khoảng không vượt quá $d$. Các điểm này nằm giữa các đường thẳng $x = x_{mid} - d$ và $x = x_{mid} + d$:

![nearest2](/uploads/algo/basic/divide-and-conquer/rysgQc4yT.png)

Đến đây, ta có một nhận xét quan trọng: Với mỗi điểm $A_m$ nằm trong miền nằm giữa hai đường thẳng nói trên (vùng được tô màu), tồn tại không quá 7 điểm khác $A_m$ có tung độ $y$ lớn hơn không quá $d$ so với $y_m$.

:::spoiler _Chứng minh (nhấn để hiện)_

Khoảng các điểm thoả mãn điều kiện trên được giới hạn bởi hình vẽ sau:

![window](/uploads/algo/basic/divide-and-conquer/rkqqL9V1p.png)

Khoảng trên là hình tạo bởi hai hình vuông có cạnh là $d$ nằm cạnh nhau. Các điểm thoả mãn nằm trong hoặc trên cạnh của hai hình vuông này, và khoảng cách giữa hai điểm bất kỳ trong cùng một hình vuông không nhỏ hơn $d$. Không thể xếp quá $4$ điểm như vậy vào trong một hình vuông. Thật vậy, với mỗi điểm ta vẽ một đường tròn có tâm tại điểm đó và bán kính bằng $\frac{d}{2}$. Hai đường tròn bất kỳ không thể có nhiều hơn 1 điểm chung, vì nếu không khoảng cách giữa chúng sẽ nhỏ hơn $d$.

![window2](/uploads/algo/basic/divide-and-conquer/BJaKDqE16.png)

Ta thấy mỗi hình tròn có diện tích giao với hình vuông là $\geq \frac{\pi d^{2}}{4} = \frac{\pi}{16} d^{2}$, do khi tịnh tiến hình tròn dọc theo cả hai phương $x$ và $y$ ta đều thu được các hình có diện tích lớn hơn. Vì hình vuông có diện tích là $d^{2}$, số miền diện tích như vậy có thể đặt vào hình tròn là $d^{2} : \frac{\pi}{16}d^{2} \approx 5.1$. Tuy nhiên, không tồn tại cách đặt 5 điểm vào hình vuông thoả mãn yêu cầu của đề bài, nên số điểm đặt được tối đa là 4.

Với 4 điểm ở mỗi hình vuông, số điểm đặt được tối đa là 8, tính cả điểm mà chúng ta đã xét ban đầu. Do vậy có tối đa 7 điểm thoả mãn tung độ lớn hơn $y_m$ không quá $d$.

:::

Nếu ta sắp xếp các điểm trong miền này theo thứ tự $y$ tăng dần, với một điểm bất kỳ ta chỉ cần xét một số điểm lân cận thoả mãn chênh lệch tung độ không vượt quá $d$, rồi tính khoảng cách giữa chúng.

![nearest3](/uploads/algo/basic/divide-and-conquer/r1deOc4kp.png)

Khi cài đặt, sau khi tiến hành tìm khoảng cách ngắn nhất giữa hai điểm ta có thể giữ nguyên trạng thái sau khi sắp xếp theo $y$ của đoạn đó, rồi dùng phép `merge()` như bài MergeSort ở trên để sắp xếp nhanh đoạn lớn trong $\mathcal{O}(n)$.

#### Cài đặt

:::spoiler **Nhấn để hiện code**

```cpp=
#include <bits/stdc++.h>

using namespace std;

const int MAXN = 1e5 + 5;
const long long INF = LLONG_MAX;

struct Point {
    double x, y;

    void inp() {
        cin >> x >> y;
    }

    bool operator<(Point other) {
        if (x == other.x)
            return (y < other.y);
        return (x < other.x);
    }
} a[MAXN], middleArea[MAXN];

bool ascendingY(Point p1, Point p2) {
    return make_pair(p1.y, p1.x) < make_pair(p2.y, p2.x);
}

double dist(Point p1, Point p2) {
    return hypot(1.0 * p1.x - p2.x, 1.0 * p1.y - p2.y);
}

//Tìm cặp điểm gần nhất trong các điểm thuộc middleAreaa
double nearestMiddle(int middleAreaSize, double d) {
    double ret = INT_MAX;
    for (int i = 1; i <= middleAreaSize; i++)
        for (int j = i + 1; j <= middleAreaSize; j++) {
            if (middleArea[j].y - middleArea[i].y >= d)
                break;
            ret = min(ret, dist(middleArea[i], middleArea[j]));
        }
    return ret;
}

//Tìm cặp điểm gần nhất trong các điểm thuộc mảng a độ dài n
double nearest(Point a[], int n) {
    if (n <= 3) {
        sort(a + 1, a + n + 1, ascendingY);
        double ret = INF;
        for (int i = 1; i <= n; i++)
            for (int j = i + 1; j <= n; j++)
                ret = min(ret, dist(a[i], a[j]));
        return ret;
    }

    int mid = n / 2;
    auto midPoint = a[mid];
    double dL = nearest(a, mid);
    double dR = nearest(a + mid, n - mid);
    double d = min(dL, dR);

    int middleAreaSize = 0;
    merge(a + 1, a + mid + 1, a + mid + 1, a + n + 1, middleArea + 1, ascendingY);
    for (int i = 1; i <= n; i++) {
        a[i] = middleArea[i];
        if (abs(middleArea[i].x - midPoint.x) < d)
            middleArea[++middleAreaSize] = middleArea[i];
    }
    return min(d, nearestMiddle(middleAreaSize, d));
}

int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; i++)
        a[i].inp();
    sort(a + 1, a + n + 1);
    cout << fixed << setprecision(3) << nearest(a, n);

    return 0;
}
```

Mảng `middleArea[]` lưu các điểm nằm ở giữa miền tạo bởi hai đường thẳng $x = x_{mid} - m$ và $x = x_{mid} + m$.
Hàm `hypot(a, b)` trả về cạnh huyền của tam giác vuông có hai cạnh góc vuông là $a$ và $b$, tức giá trị $\sqrt{a^{2} + b^{2}}$; hàm này có sẵn trong thư viện `cmath`.
:::

#### Đánh giá

Mỗi tập $[l, r]$ được chia thành hai tập con, mỗi tập con có bộ dữ liệu bằng đúng một nửa tập lớn. Việc tìm kết quả của đoạn lớn bao gồm việc ghép đoạn để sắp xếp lại mất $\mathcal{O}(n)$ và tính khoảng cách nhỏ nhất giữa các điểm ở giữa hết $\mathcal{O}(7n) = \mathcal{O}(n)$. Do vậy thuật này có $T(n) = 2T\left(\frac{n}{2}\right) + \mathcal{O}(n)$ và có độ phức tạp trung bình là $\mathcal{O}(n\log n)$ theo Định lý Thợ. Trong mọi trường hợp, thuật toán đều thực hiện những bước tương tự và độ phức tạp là $\mathcal{O}(n\log n)$.

#### Bonus

Bài toán này còn một lời giải khác bằng cách sử dụng kỹ thuật đường quét (sweep-line) kết hợp với cấu trúc `set`. Lời giải này có cùng độ phức tạp nhưng ngắn gọn và dễ cài đặt hơn lời giải bằng chia để trị. Bạn đọc tự cài đặt và tìm hiểu thêm, tham khảo [code của skyvn97](https://vnoi.info/problems/show_solution/NEAREST/1389230/).

## Bài toán Truy vấn trên mảng cố định

### Bài toán

Bài toán **Truy vấn trên mảng cố định (SRQ - Static Array Queries)** được mô tả như sau:

Xét phép toán bất kỳ $\star$ và mảng $a$ gồm các số $a_1, a_2, \ldots, a_n$. Ta phải trả lời $q$ truy vấn, mỗi truy vấn yêu cầu ta tính $a_l \star a_{l + 1} \star \ldots \star a_r$, với $l, r$ là các giá trị cho trước, $l, r \in [1, n]$.

Trong trường hợp $\star$ là phép toán có tính chất kết hợp, cụ thể hơn, phép toán này áp dụng được trên các giá trị (không nhất thiết là số) $a, b, c$ sao cho $(a \star b) \star c = a \star (b \star c)$, ta có thể sử dụng chia để trị để giải. Một số ví dụ cho phép toán này là phép cộng, phép nhân, phép lấy $\min$.

### Thuật toán giải

Có rất nhiều cách giải bài toán này với độ phức tạp không gian và thời gian logarit tuyến tính ($\mathcal{O}(n\log n)$), như cây phân đoạn, BIT, mảng thưa, ... Chia để trị cũng là một cách hiệu quả để giải quyết bài toán, đặc biệt trong trường hợp độ phức tạp cho mỗi truy vấn cần rất thấp.

Giả sử tất cả các truy vấn $(lq, rq)$ đều thoả mãn điều kiện $l \leq lq \leq rq \leq r$. Ban đầu, ta có $l = 1, r = n$. Đặt $mid = \lfloor \frac{l + r}{2} \rfloor$ (tuỳ trường hợp, để tính toán thuận lợi, $mid$ có thể nhận các giá trị khác nhau, nhưng thường ta lấy vị trí chính giữa). Gọi $leftAcc[i]$ là "tổng" hậu tố tính từ $mid$ tới $i$ hay:
$$
leftAcc[i] = a[i] \star a[i + 1] \star \ldots \star a[mid]
$$

Tương tự, ta gọi $rightAcc[i]$ là "tổng" tiền tố tính từ $mid + 1$ tới $i$:
$$
rightAcc[i] = a[mid + 1] \star a[mid + 2] \star \ldots \star a[i]
$$

Với các truy vấn thoả mãn $lq \leq mid \leq rq$, kết quả của truy vấn đó sẽ là $leftAcc[i] \star rightAcc[i]$. Điều này là hiển nhiên theo tính chất kết hợp. Với các truy vấn còn lại, hiển nhiên chúng chỉ nằm hoàn toàn ở một trong hai bên của $mid$. Ta thay đổi các giá trị $l, r$ và tính các giá trị $leftAcc, rightAcc$ theo $l, r$ mới. Cứ như vậy tới khi $l = r$.

Về độ phức tạp, ở mỗi bước ta chia mảng độ dài $n$ thành 2 phần đều nhau có kích thước dữ liệu là $\frac{n}{2}$. Sau khi có hai đoạn này, ta mất $\mathcal{O}(n)$ để tính $leftAcc, rightAcc$, và $\mathcal{O}(1)$ cho mỗi truy vấn, tổng cộng là $\mathcal{O}(n + q)$. Độ phức tạp thời gian của thuật toán là $\mathcal{O}((n + q)\log n)$, chạy ổn định, còn về không gian chỉ cần $\mathcal{O}(n + q)$.

Hai mảng $leftAcc$ và $rightAcc$ không có chung nhau một vị trí nào, vậy nên ta có thể kết hợp lại thành một mảng $acc$. Khi đó với một đoạn $[l, r]$ có phần tử ở giữa là $mid$, các giá trị từ $acc[l]$ đến $acc[mid]$ tương đương với $leftAcc$, và các giá trị $acc[mid + 1]$ đến $acc[r]$ tương đương với $rightAcc$.

Nếu phải sử dụng các truy vấn online, ta lưu lại $acc$ của mỗi lần đệ quy dưới dạng một mảng hai chiều giống như mảng thưa, ví dụ $acc[j][i]$ là kết quả $acc[i]$ ở vòng đệ quy với độ sâu $j$ (xem ví dụ để hiểu rõ hơn). Bằng cách này, ta vẫn có thể trả lời mọi truy vấn trong $\mathcal{O}(1)$, và độ phức tạp trở thành $\mathcal{O}(n\log n + q)$ cho thời gian và $\mathcal{O}(n\log n + q)$ cho không gian.

### Ví dụ

**Đề bài**: [SEGPROD](https://www.codechef.com/problems/SEGPROD)

_Tóm tắt_: Cho dãy $A$ gồm $N$ số nguyên dương và một số nguyên dương $P$. Có $Q \leq 2\times10^{7}$ truy vấn, truy vấn thứ $i$ yêu cầu tìm tích của các số $A_j$ với $L_i \leq j \leq R_i$, lấy số dư khi chia cho $P$. Chú ý rằng các truy vấn phải được xử lý online và số $P$ có thể không là số nguyên tố.

#### Phân tích

Đây là một bài toán SRQ khá "thẳng", chỉ yêu cầu ta tính tích trên một đoạn bất kỳ. Ý tưởng "ngây thơ" nhất là duyệt qua mọi đoạn con được truy vấn để tìm tích của nó, mất $\mathcal{O}(n^{2})$. Ta cũng nghĩ đến việc áp dụng tích tiền tố đơn giản, tuy nhiên việc lấy ra một đoạn sẽ gặp khó khăn nếu $P$ không phải là số nguyên tố. Các ý tưởng khác cho bài toán SRQ như cây phân đoạn và mảng thưa đều mất $\mathcal{O}(\log n)$ cho mỗi truy vấn, khó qua được giới hạn của bài toán này. May mắn thay, sử dụng chia để trị vừa khít với bộ dữ liệu của bài toán.

Bằng cách sử dụng cách chia để trị như đã nói ở trên, ta dễ dàng khởi tạo mảng $acc$ trong $\mathcal{O}(n\log n)$. Khi trả lời một truy vấn `lq rq`, như đã nói ở trường hợp truy vấn offline, $lq$ và $rq$ phải thoả mãn $l \leq lq \leq mid$ và $mid + 1 \leq rq \leq r$ tại một vòng đệ quy.

Giả sử độ sâu $lvl$ của một vòng đệ quy là số lần phải gọi đệ quy từ đoạn $[1, n]$, ta thấy hai đoạn có cùng độ sâu không có điểm chung. Do đó ta có thể lưu các giá trị $acc$ đi kèm với độ sâu mà không sợ bị trùng lặp.

![srq1](/uploads/algo/basic/divide-and-conquer/H1ZBwmiJp.png)

Quay lại với truy vấn `lq rq`, ta cần phải tìm một độ sâu sao cho $lq$ và $rq$ nằm về hai phía của $mid$ của độ sâu này. Để giải quyết vấn đề này, ta gọi $mask[i]$ là một dãy bit, sao cho bit thứ $j$ của dãy này bằng $0$ nếu vị trí $i$ nằm về bên trái $mid$ (tính cả $mid$) ở độ sâu $j$, và $1$ nếu vị trí này nằm về bên phải của $mid$ (không tính $mid$). Ví dụ với dãy bằng $8$ như trên hình, $mask[3] = (010)_2$, $mask[7] = (011)_2$. Như vậy, độ sâu thoả mãn $lq$ và $rq$ nằm về hai phía của $mid$ ở độ sâu này là vị trí của bit đầu tiên bằng $1$ từ phải qua trái trong dãy $mask[lq] \oplus mask[rq]$, với $\oplus$ là phép xor.

#### Cài đặt

:::spoiler **Nhấn để hiện code**

```cpp=
const int MAXN = 1e6;

int n, a[MAXN], b[MAXN], mod, acc[21][MAXN], mask[MAXN];

/// Khởi tạo acc
void calc(int l, int r, int level) {
    if (l == r)
        return;
    int mid = (l + r) / 2;
    calc(l, mid, level + 1);
    calc(mid + 1, r, level + 1);

    acc[level][mid] = a[mid];
    for (int i = mid - 1; i >= l; i--)
        acc[level][i] = 1ll * acc[level][i + 1] * a[i] % mod;
    acc[level][mid + 1] = a[mid + 1];
    for (int i = mid + 2; i <= r; i++)
        acc[level][i] = 1ll * acc[level][i - 1] * a[i] % mod;

    for (int i = mid + 1; i <= r; i++)
        mask[i] |= (1 << level);
}

/// Giải quyết 1 truy vấn
void solve() {
    int q;
    cin >> n >> mod >> q;
    for (int i = 0; i < n; i++)
        cin >> a[i];

    for (int i = 0; i < n; i++)
        for (int l = 0; (1 << l) < n; l++)
            acc[l][i] = 1;
    for (int i = 0; i < n; i++)
        mask[i] = 0;
    calc(0, n - 1, 0);

    int res = 0;
    for (int i = 0; i < q / 64 + 2; i++) {
        cin >> b[i];
    }
    for (int i = 0, lq = 0, rq = 0; i < q; i++) {
        // Nhận truy vấn tiếp theo theo cách đề bài mô tả
        if (i % 64 == 0) {
            lq = (b[i / 64] + res) % n;
            rq = (b[i / 64 + 1] + res) % n;
        } else {
            lq = (lq + res) % n;
            rq = (rq + res) % n;
        }
        if (lq > rq)
            swap(lq, rq);

        // Tìm kết quả cho đoạn [lq, rq] vừa tìm được
        if (lq == rq)
            res = a[lq];
        else {
            int lvl = __builtin_ctz(mask[lq] ^ mask[rq]);
            res = 1ll * acc[lvl][lq] * acc[lvl][rq] % mod;
        }
        (res += 1) %= mod;
    }
    cout << res << "\n";
}
```

Hàm `__builtin_ctz(x)` trả về số bit $0$ ở cuối dãy nhị phân có giá trị bằng $x$. Giá trị này chính là vị trí của bit $1$ đầu tiên từ phải qua trái của dãy. Bạn đọc có thể xem bài [Phép toán bit](/algo/basic/bitwise-operators.md) để biết thêm chi tiết.
:::

## Chú ý thêm

-   Kỹ thuật chia để trị có thể làm tối ưu khá tốt lời giải của một thuật toán. Đặc biệt trong các bài toán quy hoạch động, chia để trị là một trick tối ưu khá hiệu quả. Bạn đọc có thể tham khảo thêm tại [bài viết này](/algo/dp/Mot-so-ky-thuat-toi-uu-hoa-thuat-toan-Quy-Hoach-Dong.md).
-   Đối với các bài toán SRQ, còn một phương pháp hiệu quả vượt trội các phương pháp đã nói trên về độ phức tạp thời gian, đó là cấu trúc Sqrt Tree. Bạn đọc có thể tìm hiểu thêm về cấu trúc này tại [đây](https://cp-algorithms.com/data_structures/sqrt-tree.html).

## Bài tập

Các bài chia để trị nói chung:

-   [CERC 17 - I](https://codeforces.com/gym/101620/attachments)
-   [VNOJ - NORMA](https://oj.vnoi.info/problem/norma)
-   [VNOJ - LIS2VN](https://oj.vnoi.info/problem/lis2vn)
-   [UVA - Bit Maps](https://onlinejudge.org/index.php?option=onlinejudge&Itemid=8&page=show_problem&problem=119)
-   [IOI 2011 - Race](https://oj.uz/problem/view/IOI11_race)

Các bài toán SRQ:

-   [VNOJ - XORSHIFT](https://oj.vnoi.info/problem/mofkcup_r1_e)
-   [Duyên hải Bắc Bộ 2023 - HKDATA](https://lqdoj.edu.vn/problem/dhbb23hkdata) (Bạn cần tham gia [contest](https://lqdoj.edu.vn/contest/dhbb23) để xem được đề bài)
-   [DMOJ - Continued Fractions](https://dmoj.ca/problem/dmopc19c7p4)
-   [USACO - Non-Decreasing Subsequences](http://www.usaco.org/index.php?page=viewproblem2&cpid=997)
-   [Codeforces - Destiny](https://codeforces.com/problemset/problem/840/D)
-   [Codeforces - Timofey and our friends animals](https://codeforces.com/problemset/problem/763/E)

## Tài liệu tham khảo

-   Steven Halim, Felix Halim (2013), _Competitive Programing 3_
-   Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford Stein (2022), _Introduction to Algorithms_, 4th edition
-   Mark Berg , Otfried Cheong , Marc Kreveld , Mark Overmars (2008), _Computational Geometry - Algorithms and Applications_
-   Wikipedia (Master''s Theorem)
-   [Bài giảng của Piotr Indyk tại MIT](http://people.csail.mit.edu/indyk/6.838-old/handouts/lec17.pdf) (bài NEAREST)
-   USACO Guide Platinium, [Divide and Conquer - SRQ](https://usaco.guide/plat/DC-SRQ?lang=cpp)
-   Codeforces, [Post của Wind_Eagle](https://codeforces.com/blog/entry/104443)
-   Codeforces, [Post của steveonalex](https://codeforces.com/blog/entry/119104)
', 'Nếu ta coi mỗi bài toán con là một nút trên một cây và mỗi lần gọi đệ quy từ một bài toán con ta nối thêm một nút con vào nút biểu diễn bài toán nói trên thì bài toán lớn của chúng ta sẽ có dạng như sau:

![problem tree](/uploads/algo/basic/divide-and-conquer/SJGSaKEk6.png)

Tại mỗi nút của cây trên, nếu việc kết hợp kết quả các bài toán con mất $f(n)$ thời gian, thì thời gian chạy tại một nút với kích thước dữ liệu là $n$ có thể được tính theo công thức truy hồi:

$$
T(n) = \begin{cases}
 a \times T\left(\frac{n}{b}\right) + f(n) &\text{khi } n \geq k\\
 \mathcal{O}(1) &\text{khi } n < k
 \end{cases}
$$

với $k$ là một hằng số nào đó, tuỳ thuộc vào thuật toán.

Ví dụ, với thuật toán MergeSort, tại mỗi bước ta chia một đoạn có độ dài $n$ thành hai đoạn con có độ dài $\frac{n}{2}$ hoặc xấp xỉ số đó. Thuật toán sẽ có thời gian chạy là $T(n) = 2T\left(\frac{n}{2}\right) + \mathcal{O}(n)$ khi $n > 1$ và $\mathcal{O}(1)$ khi $n = 1$.

Bây giờ, ta lại xét giá trị $f(n)$. Giả sử $f(n)$ viết được dưới dạng $\mathcal{O}(n^{p}\log^{q} n)$ (Định lý Thợ chỉ áp dụng khi $f(n)$ có độ phức tạp đa thức). Chúng ta có thể tiếp tục thu gọn biểu thức như sau:
| Quan hệ $a$ và $b^{p}$ | Biểu thức $T(n)$ |
|---|---|
| $a > b^{p}$ | $T(n) = \mathcal{O}(n^{\log_b a})$ |
| $a = b^{p}$ | $T(n) = \mathcal{O}(n^{\log_b a}\log^{q + 1} n)$ khi $q > -1$ <br> $T(n) = \mathcal{O}(n^{\log_b a}\log\log n)$ khi $q = -1$ <br> $T(n) = \mathcal{O}(n^{\log_b a})$ khi $q < -1$ |
| $a < b^{p}$ | $T(n) = \mathcal{O}(n^{p}\log_q n)$ khi $q \geq 0$ <br> $T(n) = \mathcal{O}(n^{p})$ khi $q < 0$ |

Một số ví dụ:

-   Thuật toán Tìm kiếm nhị phân (Binary search) mỗi lần chia bài toán thành 2 phần bằng nhau nhưng chỉ xét 1, không cần kết hợp kết quả sẽ có $T(n) = T\left(\frac{n}{2}\right) + \mathcal{O}(1)$. Thời gian chạy trung bình của thuật toán là $T(n) = \mathcal{O}(\log n)$, ứng với $a = 1, b = 2, p = 0, q = 0$.
-   Thuật toán MergeSort chia đôi dãy hiện tại thành 2 phần bằng nhau, lấy cả 2 và phải xét lại cả 2 phần để lấy kết quả sẽ có $T(n) = 2T\left(\frac{n}{2}\right) + \mathcal{O}(n)$. Thời gian chạy trung bình của thuật toán là $T(n) = \mathcal{O}(n\log n)$, ứng với $a = 2, b = 2, p = 1, q = 0$ (Chi tiết về thuật MergeSort bạn đọc có thể đọc phần dưới).
-   Một thuật toán chia để trị có $T(n) = 3T\left(\frac{n}{2}\right) + \log^{2} n$. Thời gian chạy trung bình của thuật toán là $T(n) = \mathcal{O}(n^{\log_2 3})$, tương ứng với $a = 3, b = 2, p = 0, q = 2$.

Định lý Thợ là một công cụ hữu hiệu để xác định độ phức tạp của một thuật toán chia để trị. Chỉ cần xác định được số bài toán con, kích thước dữ liệu các bài toán con và độ phức tạp của việc kết hợp dữ liệu, ta dễ dàng tìm ra độ phức tạp chung của bài toán.

## Một số ví dụ áp dụng Chia để trị

Các bài toán áp dụng Chia để trị chỉ có chung một phương pháp như đã nói ở trên. Khi sử dụng, thứ mà ta quan tâm chủ yếu là độ phức tạp; thông thường, chia để trị là công cụ tối ưu độ phức tạp khá hiệu quả.

### MergeSort

**Đề bài**: Sắp xếp một dãy gồm $n$ số nguyên $(n \leq 10^{6})$.

#### Phân tích thuật toán

Đây là một thuật toán sắp xếp nổi tiếng và cũng hay được áp dụng (nếu không được phép sử dụng các thư viện có sẵn). Thuật toán này sử dụng phương pháp đệ quy. Tại mỗi vòng đệ quy, giả sử đang cần sắp xếp một đoạn $[l, r]$ ta chia dãy làm hai phần bằng nhau, $[l, mid]$ và $[mid + 1, r]$ với $mid = \left\lfloor \frac{l + r}{2} \right\rfloor$. Sau khi đã gọi đệ quy các đoạn con, ta tiến hành hợp nhất hai đoạn này. Việc hợp nhất hai đoạn đã sắp xếp được tiến hành bằng phương pháp [hai con trỏ](/algo/basic/two-pointers.md), có độ phức tạp là $\mathcal{O}(n)$. Trong trường hợp một đoạn chỉ có một phần tử duy nhất, ta coi như nó đã được sắp xếp.

![Minh hoạ MergeSort](/uploads/algo/basic/divide-and-conquer/Skh8YzQxa.png)


#### Cài đặt

:::spoiler **Nhấn để hiện code**', '2026-10-06T10:32:15.582326');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_stack', '**Stack (ngăn xếp)**', 'data-structures', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/data-structures/Stack.md', '["stack", "ngăn xếp", "lifo", "push", "pop"]', '---
title: Stack (ngăn xếp)
description: 
published: true
date: 2025-03-24T17:25:22.689Z
tags: 
editor: markdown
dateCreated: 2023-12-25T11:00:37.911Z
---', '---
title: Stack (ngăn xếp)
description: 
published: true
date: 2025-03-24T17:25:22.689Z
tags: 
editor: markdown
dateCreated: 2023-12-25T11:00:37.911Z
---

# **Stack (ngăn xếp)**

**Tác giả:** Nguyễn Hà Duy - THPT Chuyên Hà Nội - Amsterdam

**Reviewer:** Hoàng Xuân Nhật

---

# Giới thiệu

Stack là một danh sách được bổ sung 2 thao tác: **thêm một phần tử vào cuối danh sách**, và **loại bỏ một phần tử ở cuối danh sách**. Ví trí cuối của Stack được gọi là đỉnh (**top**).

Có thể hình dung Stack như một chồng sách. Việc đặt một quyển sách lên trên cùng chính là thao tác thêm phần tử, và lấy ra quyển sách ở trên đầu là thao tác loại bỏ phần tử. Như vậy, quyển sách được đặt vào sau cùng sẽ luôn được lấy ra trước tiên. Vì tính chất này, Stack còn được gọi là danh sách **LIFO** (Last In - First Out, hay vào sau - ra trước).

Hình ảnh minh họa cho Stack chứa các phần tử kiểu `char`:
![](/uploads/algo/data-structures/Stack/stack_0_.png)

Stack có khá nhiều ứng dụng trong lập trình thi đấu. Bài viết này sẽ xem xét các ứng dụng điển hình của Stack.

# Cài đặt

## Cài đặt thủ công

Ta có thể biểu diễn Stack bằng một mảng, cùng với biến `top` biểu diễn vị trí của phần tử nằm ở đỉnh Stack. Dưới đây là một cách cài đặt Stack chứa các phần tử thuộc kiểu `int`:
```cpp
#include <cassert>

const int MAXN = 1e5 + 2;

int st[MAXN];
int top = 0;

void push(int x) // thêm x vào cuối Stack
{
    ++top;
    st[top] = x;
}

void pop() // loại bỏ phần tử ở cuối Stack
{
    assert(top); // đảm bảo Stack đang chứa ít nhất 1 phần tử
    --top;
}

int peek() // trả về giá trị của phần tử ở đỉnh Stack
{
    return st[top];
}
```

## Sử dụng thư viện chuẩn

Thư viện chuẩn của C++ cho phép ta sử dụng Stack qua kiểu dữ liệu `stack` trong header cùng tên. Các thao tác chính trên `stack` là:

* `push`: thêm phần tử vào cuối danh sách
* `top`: trả về giá trị phần tử ở cuối danh sách
* `pop`: loại bỏ phần tử ở cuối danh sách

Ngoài ra, `stack` cũng hỗ trợ các thao tác:
* `size`: trả về số phần tử hiện có trong stack
* `empty`: trả về trạng thái của stack (`true` nếu stack rỗng, `false` nếu stack có ít nhất 1 phần tử)

Ví dụ:
```cpp
#include <iostream>
#include <stack>

using namespace std;

int main() {
    stack<int> st;
    st.push(5);               // thêm 5 vào stack
    st.push(10);              // thêm 10 vào stack
    cout << st.top() << endl; // In ra 10
    st.pop();                 // loại bỏ phần tử ở cuối
    cout << st.top() << endl; // In ra 5
    return 0;
}
```
![](/uploads/algo/data-structures/Stack/stack_1_.png)

Ngoài ra, ta có thể dùng `vector` để biểu diễn một Stack. Các hàm `push`, `top` và `pop` sẽ được thay bằng `push_back`, `pop_back` và `back` khi sử dụng `vector`.

## Phân tích

Do Stack có thể được cài đặt bằng `vector` nên các thao tác trên Stack cũng có cùng độ phức tạp với `vector`.

### Độ phức tạp thời gian

Các hàm `push`, `pop`, `top`, `size` và `empty` của Stack đều hoạt động trong $\mathcal{O}(1)$. Hơn nữa, như ta đã thấy ở cách cài đặt thủ công, bản chất của Stack chính là mảng, nên tất cả các thao tác trên Stack đều hoạt động trong $\mathcal{O}(1)$.

### Độ phức tạp bộ nhớ

Độ phức tạp bộ nhớ của Stack là $\mathcal{O}(N)$, với $N$ là số phần tử được đưa vào Stack.

# Ứng dụng

## Sử dụng Stack để xử lý xâu

### Bài toán 1

Cho xâu $S$ chỉ gồm các số nguyên dương và các dấu $+$, $-$, $\times$, $\div$, trong $S$ không có dấu khoảng trống. Bạn cần tính giá trị của biểu thức được biểu diễn bởi xâu đó.

Đây là bài toán dễ hơn của [**Expression Parsing**](https://cp-algorithms.com/string/expression_parsing.html).

#### Cách giải

Vấn đề chính của bài toán là các toán tử $+$, $-$, $\times$ và $\div$ không có cùng độ ưu tiên. Cụ thể, ta cần tính kết quả của các cụm dấu $\times$ và $\div$ trước, do nhân và chia có độ ưu tiên cao hơn cộng và trừ.

Xét bài toán đơn giản hơn: trong xâu $S$ chỉ có các dấu $+$ và $-$. Rõ ràng, do $+$ và $-$ có cùng độ ưu tiên nên ta có thể xử lý bài toán bằng cách duyệt các toán hạng và toán tử từ trái sang phải và tính trực tiếp kết quả sau mỗi phép cộng hoặc trừ. Ta có thể cài đặt như sau: duy trì một danh sách chứa số (toán hạng) và một danh sách chứa toán tử. Duyệt xâu từ trái qua phải, nếu ký tự đang xét là chữ số thì ta đẩy nó vào danh sách chứa số. Nếu đó là toán tử, ta đẩy ký tự vào danh sách chứa toán tử. Cuối cùng, ta lần lượt tính kết quả dựa vào danh sách toán hạng và toán tử đã xây dựng.

```cpp
// xử lý toán tử và cập nhật trực tiếp vào mảng val
void process_op(vector<int> &val, char op) {
    // l, r là 2 toán hạng, op là dấu giữa chúng
    int r = val.back();
    val.pop_back();
    int l = val.back();
    val.pop_back();
    switch (op) {
    case ''+'':
        val.push_back(l + r);
        break;
    case ''-'':
        val.push_back(l - r);
        break;
    }
}

// tính giá trị của biểu thức biểu diễn bởi s
int evaluate(string s) {
    vector<int> val;
    vector<char> op;
    for (int i = 0; i < (int)s.size(); ++i) {
        if (isdigit(s[i])) {
            int number = 0; // giá trị của toán hạng đang xét
            while (i < (int)s.size() && isdigit(s[i])) {
                number = number * 10 + s[i] - ''0'';
                ++i;
            }
            val.push_back(number);
            --i; // cẩn thận với index!
        } else {
            if (!op.empty()) {
                process_op(val, op.back()); // xử lý biểu thức từ trái sang phải
                op.pop_back();
            }
            op.push_back(s[i]);
        }
    }

    if (!op.empty()) {
        process_op(val, op.back());
        op.pop_back();
    }

    return val.back();
}
```

Do các toán tử có cùng độ ưu tiên, ta có thể xử lý chúng lần lượt theo danh sách đã xây dựng. Tuy nhiên, nếu danh sách $\texttt{op}$ có các toán tử khác độ ưu tiên, thì ta vẫn có thể xử lý bài toán bằng việc luôn giữ cho danh sách toán tử $\texttt{op}$ chứa các toán tử có độ ưu tiên *tăng dần*, sau đó xử lý danh sách toán tử từ dưới lên để đảm bảo các dấu có độ ưu tiên lớn hơn luôn được xử lý trước.

Trong bài toán gốc, xâu $S$ còn chứa ký tự $\times$ và $\div$. Ta cần xử lý danh sách toán tử sao cho các phép tính có độ ưu tiên lớn hơn luôn được thực hiện trước.

Ta định nghĩa một thứ tự ưu tiên cho các dấu:
```cpp
// Trả về 2 nếu là nhân hoặc chia, 1 nếu là cộng hoặc trừ
int priority(char op) {
    if (op == ''+'' || op == ''-'')
        return 1;
    else
        return 2;
}
```

Giống với bài toán đơn giản, ta vẫn duyệt xâu $S$ từ trái sang phải. Khi gặp toán hạng, ta vẫn đẩy chúng vào danh sách. Tuy nhiên, khi gặp toán tử, ta cần xem xét thứ tự ưu tiên của toán tử ngay trước nó. Nếu toán tử trước có độ ưu tiên lớn hơn hoặc bằng toán tử đang xétxét, ta cần phải xử lý nó trước, và loại bỏ toán tử đứng trước đó khỏi danh sách. Ta sẽ lặp lại việc xử lý toán tử đứng trước này cho đến khi nó có độ ưu tiên không lớn hơn toán tử đang xét. Điều này đảm bảo phép tính sẽ luôn được thực hiện theo mức độ ưu tiên.

Để ý rằng bản chất của danh sách ta sử dụng chính là Stack. Việc thêm toán tử/toán hạng vào danh sách chính là thao tác `push`; cách ta xử lý toán tử gợi đến việc `top` và `pop` do trong các bước của lời giải, ta chỉ cần quan tâm tới những phần tử ở cuối danh sách. Lời giải sử dụng `vector` để biểu diễn Stack.

```cpp
void process_op(vector<int> &val, char op) {
    int r = val.back();
    val.pop_back();
    int l = val.back();
    val.pop_back();
    switch (op) {
    case ''+'':
        val.push_back(l + r);
        break;
    case ''-'':
        val.push_back(l - r);
        break;
    case ''*'':
        val.push_back(l * r);
        break;
    case ''/'':
        val.push_back(l / r);
        break;
    }
}

int evaluate(string s) {
    // ...
    for (int i = 0; i < (int)s.size(); ++i) {
        if (isdigit(s[i])) {
            // ...
        } else {
            char cur_op = s[i]; // toán tử hiện tại
            while (!op.empty() && priority(op.back()) >= priority(cur_op))
            // xử lý các toán tử ngay trước nó có độ ưu tiên bằng hoặc lớn hơn
            // chú ý rằng nếu thay dấu >= bằng dáu > thì đápđáp
            {
                process_op(val, op.back());
                op.pop_back();
            }
            op.push_back(cur_op);
        }
    }
    // do danh sách toán tử có độ ưu tiên tăng dần nên ta có thể xử lý
    // lần lượt như trong bài toán chỉ có + và -
    // chú ý là ta xử lý ngược từ đáy về đầu, nên các toán tử được xử lý
    // sẽ tạo thành một dãy giảm theo thứ tự ưu tiên
    while (!op.empty()) {
        process_op(val, op.back());
        op.pop_back();
    }
    return val.back();
}
```

Xét ví dụ: $S = 2 \times 3 - 4 \times 5$.

Giá trị của $\texttt{val}$ và $\texttt{op}$ sau khi xử lý xâu $S$:
![](/uploads/algo/data-structures/Stack/stack_2_.png)

Quá trình xử lý danh sách toán tử $\texttt{op}$:
![](/uploads/algo/data-structures/Stack/stack_3_.png)

### Bài toán 2

Cho xâu $S$ chỉ gồm ký tự $($ và $)$. Bạn cần kiểm tra xem $S$ có phải là dãy ngoặc đúng không.

Nếu $S$ là dãy ngoặc đúng, với mỗi vị trí trong $S$ bạn cần in ra vị trí của **dấu ngoặc tương ứng**.

Định nghĩa:
* Xâu rỗng là dãy ngoặc đúng
* Nếu xâu $A$ là dãy ngoặc đúng thì $(A)$ cũng là dãy ngoặc đúng. Khi đó, cặp dấu ngoặc quanh xâu $A$ này là cặp **dấu ngoặc tương ứng**.
* Nếu xâu $A$ và $B$ đều là dãy ngoặc đúng thì xâu $A + B$ cũng là dãy ngoặc đúng

Hình ảnh minh họa cho một dãy ngoặc đúng. Các cặp dấu ngoặc tương ứng được tô cùng màu:
![](/uploads/algo/data-structures/Stack/stack_4_.png)

#### Nhận xét

Ta định nghĩa thêm: dãy ngoặc đúng cơ bản là dãy ngoặc đúng không thể tách được thành tổng của các dãy ngoặc đúng nhỏ hơn. Ví dụ, $(()())$ là dãy ngoặc đúng cơ bản, và $(())()$ không phải là dãy ngoặc đúng cơ bản, do nó có thể tách được thành $(()) + ()$.

Từ các định nghĩa, có thể rút ra các tính chất của dãy ngoặc đúng:

* **Tính chất 1**: Giữa một cặp dấu ngoặc tương ứng là một dãy ngoặc đúng
* **Tính chất 2**: Một dãy ngoặc đúng độ dài $2 \times n$ có $n$ cặp dấu ngoặc tương ứng, tương ứng với $n$ dấu ngoặc mở và $n$ dấu ngoặc đóng. Dấu ngoặc tương ứng của một dấu ngoặc mở phải nằm ở sau nó trong dãy, và dấu ngoặc tương ứng của một dấu ngoặc đóng phải nằm trước nó. Do đó, dãy ngoặc đúng không thể bắt đầu bằng dấu đóng ngoặc, hay kết thúc bằng dầu mở ngoặc.
* **Tính chất 3**: Xét một dãy ngoặc đúng $S$. Nếu một tiền tố hoặc hậu tố $A$ của $S$ là một dãy ngoặc đúng, thì dãy $S \setminus A$, hay dãy con của $S$ không chứa $A$, cũng là một dãy ngoặc đúng.
* **Tính chất 4**: Nếu $S$ là dãy ngoặc đúng thì nó có thể được tách ra thành tổng của các dãy ngoặc đúng độc lập nhau, hay $S = s_1 + s_2 + \cdots + s_k$, với $s_1, s_2, \ldots, s_k$ đều là dãy ngoặc đúng *cơ bản*.
* **Tính chất 5**: Ký tự đầu và cuối của dãy ngoặc đúng cơ bản tạo thành một cặp dấu ngoặc tương ứng.

Ta có các bổ đề và hệ quả sau:

#### Bổ đề 1

Trong dãy ngoặc đúng, mỗi dấu ngoặc tương ứng với một và chỉ một dấu ngoặc khác.

#### Chứng minh

Giả sử tồn tại một dấu ngoặc có thể tương ứng với nhiều hơn một dấu ngoặc khác. Khi đó, sẽ có nhiều hơn một cách chia dãy ngoặc thành các cặp dấu ngoặc tương ứng. Do đó, tồn tại một dấu ngoặc đóng trong dãy tương ứng với nhiều hơn một dấu ngoặc khác.

Giả sử dấu ngoặc ở vị trí $k$ là dấu ngoặc đóng và có thể tương ứng với các dấu ngoặc mở ở vị trí $i$ và $j$, với $i < j < k$. Theo **tính chất 1**, ta có:

* Dãy ngoặc con từ vị trí $i + 1$ đến $k - 1$ của dãy gốc là dãy ngoặc đúng.
* Dãy ngoặc con từ vị trí $j + 1$ đến $k - 1$ của dãy gốc là dãy ngoặc đúng.

$$
\ldots(\ldots(\ldots(
$$

$$
\ldots i \ldots j \ldots k
$$

Theo **tính chất 3**, dãy ngoặc từ vị trí $i + 1$ đến $j$ cũng là dãy ngoặc đúng. Mà dãy ngoặc từ vị trí $i + 1$ đến $j$ lại kết thúc bằng dấu mở ngoặc, trái với **tính chất 2**. Vậy giả thiết tồn tại một dấu ngoặc tương ứng với nhiều hơn một dấu ngoặc khác là sai.

Vậy ta có điều phải chứng minh.

#### Bổ đề 2

Dãy ngoặc đúng khi và chỉ khi số dấu ngoặc mở bằng số dấu ngoặc đóng, và trong mọi tiền tố của dãy, số dấu ngoặc mở không nhỏ hơn số dấu ngoặc đóng.

#### Chứng minh

* **Chiều thuận**: dãy ngoặc đúng có số dấu ngoặc mở bằng số dấu ngoặc đóng, và trong mọi tiền tố của dãy, số dấu ngoặc mở không nhỏ hơn số dấu ngoặc đóng. Theo **tính chất 2**, dãy ngoặc mở có số dấu đóng ngoặc bằng số dấu mở ngoặc. Mặt khác, nếu tồn tại một tiền tố của dãy ngoặc đúng có số dấu mở ngoặc nhỏ hơn số dấu đóng ngoặc thì rõ ràng tồn tại ít nhất 1 dấu đóng ngoặc không tương ứng với dấu mở ngoặc nào, trái với **bổ đề 1**. Vậy ta chứng minh được chiều thuận.

* **Chiều đảo**: trong mọi tiền tố của dãy, số dấu ngoặc mở không nhỏ hơn số dấu ngoặc đóng đảm bảo rằng mỗi dấu ngoặc đóng đều có dấu ngoặc mở tương ứng với nó. Hơn nữa, số dấu ngoặc mở bằng số dấu ngoặc đóng đảm bảo không có dấu ngoặc mở bị thừa ra (hay không tương ứng với dấu ngoặc nào) trong dãy ngoặc. Do đó, dãy có số dấu ngoặc mở bằng số dấu ngoặc đóng và trong mọi tiền tố của dãy, số dấu ngoặc mở không nhỏ hơn số dấu ngoặc đóng là dãy ngoặc đúng.

#### Hệ quả 1

Dãy ngoặc không đúng sẽ có số dấu ngoặc mở lớn hơn số ngoặc đóng, hoặc có một tiền tố mà số dấu ngoặc mở nhỏ hơn số dấu ngoặc đóng.

#### Cách giải

Cho một Stack chứa các phần tử kiểu `char`, đang ở trạng thái rỗng. Xét quá trình sau:
* Duyệt xâu $S$ từ trái qua phải
* Nếu ký tự đang xét là dấu $($, thêm nó vào Stack
* Nếu ký tự đang xét là dấu $)$, xét phần tử đang ở đỉnh Stack. Nếu đó là dấu $($, ta tìm được một cặp dấu ngoặc tương ứng, và loại bỏ dấu ngoặc mở khỏi Stack. Nếu ngược lại, hoặc Stack rỗng, xâu $S$ không phải dãy ngoặc đúng.
* Sau khi thực hiện quá trình, nếu Stack không rỗng thì $S$ không phải dãy ngoặc đúng.

Trước hết, quá trình này sẽ luôn xác định xem xâu $S$ có phải là dãy ngoặc đúng hay không. Nhắc lại, quá trình sẽ kết luận xâu $S$ không phải dãy ngoặc đúng khi:
* Ký tự đang xét là dấu đóng ngoặc và Stack đang rỗng.
* Sau khi xử lý, Stack không rỗng.

Trường hợp 1 xảy ra khi xâu $S$ có một tiền tố mà số dấu ngoặc đóng nhiều hơn số dấu ngoặc mở. Trường hợp 2 xảy ra khi xâu $S$ có số dấu ngoặc mở nhiều hơn số dấu ngoặc đóng. Cả hai trường hợp trên đều là dấu hiệu của dãy ngoặc không đúng nêu trong **hệ quả 1**. Vậy quá trình sẽ luôn xác định $S$ là dãy đúng hay không.

Từ bây giờ, ta mặc định $S$ là dãy ngoặc đúng, và chứng minh rằng việc sử dụng Stack sẽ **luôn chỉ ra các cặp dấu ngoặc tương ứng**.

Quan sát quá trình trên, ta có một nhận xét quan trọng: sau khi xử lý một dãy ngoặc đúng trên Stack $st$ thì Stack sẽ giữ nguyên trạng thái. Điều này là đúng do mỗi dấu mở ngoặc được `push` vào Stack và `pop` khỏi Stack đúng một lần.

Theo **tính chất 4**, $S$ có thể được tách thành tổng của các dãy ngoặc đúng cơ bản $s_1 + s_2 + \cdots + s_k$. Theo **tính chất 5**, $s_i = ( \ + s'' + \ )$, với $s''$ là dãy ngoặc đúng, có thể là xâu rỗng. Vì sau khi xử lý các dãy $s_1, s_2, \ldots$ thì Stack sẽ trở về trạng thái rỗng, nên ta chỉ cần xem xét quá trình với dãy ngoặc đúng cơ bản $s_i$:

* Đẩy dấu ngoặc mở vào Stack
* Xử lý dãy ngoặc đúng $s''$ để tìm các cặp dấu ngoặc tương ứng trong đó. Sau bước này, ta tìm được tất cả cặp dấu tương ứng trong $s''$.
* Xét dấu ngoặc đóng ở cuối $s_i$. Do sau khi xử lý dãy ngoặc đúng, Stack chỉ còn một phần tử là dấu ngoặc mở được thêm vào từ đầu, ta tìm được một cặp dấu ngoặc tương ứng, và xóa dấu ngoặc mở khỏi Stack
* Stack trở về trạng thái rỗng

Như vậy, quá trình sẽ xác định tất cả các cặp dấu ngoặc tương ứng.

#### Cài đặt

Ta có thể cài đặt bài toán đúng như mô tả của quá trình nêu trên:

```cpp
stack<int> st;
vector<pair<int, int>> matches; // lưu các cặp dấu ngoặc tương ứng

bool solve(string s) {
    int n = (int)s.size();
    for (int i = 0; i < n; ++i) {
        if (s[i] == ''('') // chỉ đẩy dấu ngoặc mở vào Stack
            st.push(i);
        else {
            if (st.empty())
                return false;                 // dãy không phải là dãy ngoặc đúng
            matches.push_back({st.top(), i}); // tìm thấy một cặp tương ứng
            st.pop();
        }
    }
    if (!st.empty())
        return false; // nếu Stack không rỗng thì dãy không đúng
    return true;
}
```

### Mở rộng
Bài toán 2 có thể được mở rộng thêm: dãy có thể có cả ngoặc vuông và ngoặc nhọn. Rõ ràng, ta có thể xử lý các loại ngoặc như cách ta làm với bài toán 2. Lưu ý duy nhất là ta cần phải kiểm soát thêm cả kiểu loại của dấu.

Minh họa cho quá trình với $S = $ "$([\{\}])()$":

![](/uploads/algo/data-structures/Stack/stack_5_.png)

## Sử dụng Stack để khử đệ quy

Vì tính chất **LIFO** của Stack, nó có thể được sử dụng để khử các hàm đệ quy. Trên thực tế, khi ta dùng hàm đệ quy, hệ thống sẽ tự động tạo một cấu trúc **LIFO** như Stack để chứa và thực hiện các lời gọi hàm.

Xét thuật toán DFS với cách cài đặt sử dụng đệ quy:

```cpp
void dfs(int start) {
    visited[start] = true;   // đánh dầu đỉnh đã thăm
    for (int u : adj[start]) // với các đỉnh thuộc danh sách kề của đỉnh đang xét
    {
        if (visited[u])
            continue;
        dfs(u); // đệ quy: thăm u
    }
}
```

Ta có thể cài đặt DFS sử dụng Stack:

```cpp
void dfs(int start) {
    stack<int> st;
    st.push(start); // ta bắt đầu từ đỉnh "start"

    while (!st.empty()) {
        int v = st.top();  // thăm đỉnh v ở đỉnh Stack
        st.pop();          // loại bỏ đỉnh v khỏi Stack do đã thăm
        visited[v] = true; // đánh dấu v đã thăm

        for (int u : adj[v]) // xét các đỉnh của đồ thị chung cạnh với v
        {
            if (visited[u]) // nếu đã thăm thì thôi
                continue;
            st.push(u); // đẩy đỉnh u vào Stack thay vì gọi đệ quy đến u
        }
    }
}
```

Trong cách cài đặt DFS đệ quy, một nhánh đệ quy luôn phải được xử lý trọn vẹn trước khi ta gọi đệ quy đến nhánh khác. Nói cách khác, khi ta thăm một đỉnh $v$ thì ta phải thăm toàn bộ những đỉnh kề với nó, và cứ tiếp tục như vậy đến khi không còn đỉnh nào thăm được nữa. Stack hoạt động trên nguyên lý tương tự: những đỉnh được đẩy vào Stack sau đều được xử lý trọn vẹn trước những đỉnh được đẩy vào sớm hơn. Do đó, lời giải trên là đúng đắn.

Việc dùng Stack để khử đệ quy có thể áp dụng với mọi hàm có tính chất đệ quy. Trên lý thuyết, độ phức tạp thời gian và bộ nhớ của 2 cách cài đặt dùng Stack và dùng đệ quy là như nhau, nhưng trên thực tế, cách cài đặt dùng Stack thường hiệu quả hơn về mặt bộ nhớ, do việc gọi đệ quy chịu ảnh hưởng bởi [Function Overhead](https://en.wikipedia.org/wiki/Overhead_(computing)). Đổi lại, cách cài đặt dùng Stack thường khiến code trở nên phức tạp và thiếu trực quan hơn.

Trong lập trình thi đấu, ta có thể sử dụng đệ quy thông thường trong hầu hết các trường hợp. Ta chỉ cần dùng Stack khi hàm đệ quy quá sâu và có nguy cơ bị [tràn bộ nhớ](https://vi.wikipedia.org/wiki/L%E1%BB%97i_tr%C3%A0n_b%E1%BB%99_nh%E1%BB%9B_%C4%91%E1%BB%87m). Theo kinh nghiệm của người viết, ta cần khử đệ quy khi hàm có thể đạt độ sâu khoảng $10^{7}$.

## Stack đơn điệu

Stack đơn điệu là ngăn xếp mà các phần tử của nó xét từ đáy của Stack đến đỉnh Stack tạo thành một dãy số đơn điệu.

Hình ảnh minh họa cho một Stack đơn điệu giảm:

![](/uploads/algo/data-structures/Stack/stack_6_.png)

### Bài toán

Cho mảng $A$ có $n$ phần tử $a_1, a_2, \dots, a_n$, $n \leq 10^{6}$. Với mỗi $i$ từ $1$ đến $n$ ta cần tìm $j$ sao cho $a_j > a_i$, và $\lvert i - j \rvert$ nhỏ nhất. Nếu không tồn tại $j$, in ra $-1$.

#### Nhận xét

Ta sẽ bài toán đơn giản hơn: với mỗi $i$ ta chỉ cần tìm $j$ thỏa mãn điều kiện gốc, *mà $j < i$*. Rõ ràng, nếu ta giải được bài toán này thì bài toán gốc cũng có thể dễ dàng giải được, vì nếu $j > i$ thì ta có thể duyệt ngược lại mảng $A$, đưa bài toán về dạng đơn giản như đã nói.

Do $n \leq 10^{6}$ nên cách giải hồn nhiên: với mỗi $i$ ta lại xét $j$ từ $1$ đến $n$ là chưa đủ để giải quyết bài toán, do độ phức tạp thời gian lên tới $\mathcal{O}(n^{2})$.

#### Mô hình lại bài toán

Xét mô hình sau:
* Phần tử thứ $i$ của mảng $A$ tượng trưng cho một người có chiều cao $a_i$.
* Lần lượt người từ $1$ đến $n$ xếp thành một hàng. Người thứ $i$ sẽ *nhìn được* người thứ $j$ nếu $j$ đứng trước $i$ trong hàng.
* Hàng luôn nhìn từ cuối về đầu.

Theo mô hình này, giá trị $j$ gần $i$ nhất $(j < i)$ mà $a_i < a_j$ chính là chỉ số của người gần nhất cao hơn người $i$ mà anh ta có thể nhìn được.

Hình ảnh minh họa, số ở hàng trên là chiều cao mỗi người, ở hàng dưới là chỉ số người gần nhất ở bên trái cao hơn họ:

![](/uploads/algo/data-structures/Stack/stack_7_.png)

Ta có thể cải tiến mô hình bằng việc chỉnh sửa cách thức xếp hàng.
Khi người thứ $i$ xếp hàng, họ sẽ thực hiện các thao tác sau:
1. Xếp vào cuối hàng
2. Nếu họ đứng đầu hàng thì ghi lại số $-1$. Mặt khác, nếu người đứng trước họ có chiều cao thấp hơn hoặc bằng với $a_i$, đuổi người đó ra khỏi hàng. Lặp lại quá trình đuổi người đứng trước thấp hơn cho tới khi người $i$ đứng đầu hàng, hoặc người đứng trước có chiều cao lớn hơn. Ghi lại chỉ số của người đứng trước, hoặc $-1$ nếu họ đứng đầu hàng.

Ta sẽ chứng minh số mà mỗi người ghi lại chính là chỉ số của người gần nhất đứng trước mà cao hơn họ.

Lúc đầu, cho một người có chỉ số $-1$, chiều cao $+\infty$. Việc đứng đầu hàng có thể coi như đứng ngay sau người chỉ số $-1$ này. Xét một người $i$ bất kỳ ghi lại số $j$, $j < i$. Trước hết, $a_j$ chắc chắn phải lớn hơn $a_i$. Giả sử ngược lại, $j$ không phải là người gần $i$ nhất mà cao hơn người $i$, mà $k$ mới là người như vậy. Ta có $j < k < i$ và $a_k > a_i$. Tại thời điểm người $i$ xếp vào hàng thì người $k$ này *không còn trong hàng nữa* (nếu còn thì họ sẽ ghi lại người $k$ chứ không phải $j$). Do đó, người $k$ đã bị đuổi khỏi hàng bởi một người nào đó đứng sau $k$ và trước $i$. Gọi chỉ số của người đó là $l$. Để đuổi người $k$ thì $a_l \geq a_k$. Từ đó ta có $k < l < i, \ \ a_l \geq a_k > a_i$, trái với giả thiết $k$ là người gần $i$ nhất mà cao hơn $i$.

Như vậy, số mà mỗi người nhớ lại chính là **chỉ số của người gần nhất cao hơn họ** ($-1$ nếu không tồn tại người như vậy). Đây chính là giá trị $j$ cần tìm với mỗi $i$.

Giả sử mảng $A = [1, 2, 7, 4, 3, 6]$. Các bước diễn ra như sau:

![](/uploads/algo/data-structures/Stack/stack_8_.png)

Dễ thấy chiều cao của người trong hàng luôn tạo thành một dãy đơn điệu.

#### Cài đặt

Ta có thể biểu diễn mô hình nêu trên dưới dạng một Stack đơn điệu như sau:
* Người xếp vào hàng là phép `push`
* Đuổi người đứng trước là phép `pop`

Từ các bước nêu trong mô hình, có thể cài đặt lời giải như sau:
```cpp
stack<int> st;

for (int i = 1; i <= n; ++i) {
    while (!st.empty() && a[st.top()] <= a[i])
        st.pop();
    int ans = -1;
    if (!st.empty())
        ans = st.top();
    cout << ans << '' '';
    st.push(i);
}
```

#### Đánh giá độ phức tạp

Độ phức tạp bộ nhớ của lời giải là $\mathcal{O}(n)$ do sử dụng Stack và một mảng chứa $n$ phần tử.

Thoạt nhìn, độ phức tạp tính toán của lời giải có vẻ là $\mathcal{O}(n^{2})$ do có vòng lặp `while` lồng trong vòng `for`. Tuy nhiên, để ý rằng mỗi phần tử $a_i$ đều được `push()` vào Stack đúng một lần, và bị `pop()` khỏi Stack tối đa 1 lần, nên độ phức tạp tính toán vẫn là $\mathcal{O}(n)$

### Mở rộng

Bài toán gốc nêu trên có nhiều ứng dụng và mở rộng. Sau đây là một vài ví dụ.

#### Hình chữ nhật lớn nhất

[Link SPOJ](https://www.spoj.com/PTIT/problems/SSAM219G/).

Vẽ $n$ cột hình chữ nhật sát nhau. Cột thứ $i$ có chiều rộng $1$ và chiều cao $h_i$. Tìm hình chữ nhật có diện tích lớn nhất tạo bởi các cột.

Ví dụ:
$$
h = \{2, 4, 4, 3, 2\}
$$

Hình chữ nhật lớn nhất có diện tích $10$

![](/uploads/algo/data-structures/Stack/stack_9_.png)

##### Cách giải

Để ý rằng hình chữ nhật lớn nhất luôn có chiều cao bằng với chiều cao của một cột đã có.

Với mỗi cột $i$, ký hiệu $L_i$, $R_i$ là cột gần nhất ở bên trái/phải $i$ có chiều cao **nhỏ hơn $i$**. Việc tìm cột gần nhất ở bên trái/phải cột $i$ mà thấp hơn $h_i$ chính là bài toán gốc nêu ở mục trước. Ta chỉ cần sửa đổi thay vì tìm cột cao hơn thì phải tìm cột thấp hơn.

Khi đã xác định các mảng $L$ và $R$, ta có thể xét từng cột $i$ từ $1$ đến $n$. Giả sử hình chữ nhật có chiều cao bằng với cột đang xét. Khi đó, chiều dài lớn nhất của hình chữ nhật là từ cột gần nhất bên trái thấp hơn cột $i$ đến cột gần nhất bên phải thấp hơn cột $i$. Diện tích của hình chữ nhật lớn nhất qua cột $i$ là: $(R_i - L_i - 1) \times h_i$.

Vậy diện tích hình chữ nhật lớn nhất chính là giá trị $(R_i - L_i - 1) \times h_i$ lớn nhất với mọi $i$ từ $1$ đến $n$.

Độ phức tạp thời gian và bộ nhớ của lời giải là $\mathcal{O}(n)$.

#### Hình chữ nhật lớn nhất trong lưới ô vuông

[Link SPOJ](https://oj.vnoi.info/problem/qbrect/)

Đây là một mở rộng của bài toán trước. Cho lưới ô vuông $n \times m$, các ô có giá trị $0$ hoặc $1$. Ta cần tìm hình chữ nhật có diện tích lớn nhất có tất cả ô vuông có cùng giá trị.

##### Cách giải

Ta có thể chia bài toán thành hai trường hợp riêng biệt: tìm hình chữ nhật chỉ gồm các ô giá trị $0$ và chỉ gồm các ô giá trị $1$. Nếu giải được một trường hợp, ta cũng có thể dễ dàng giải trường hợp còn lại. Từ giờ, ta sẽ giải bài toán tìm hình chữ nhật lớn nhất *chỉ chứa giá trị $1$*.

Ta xét lưới ô vuông con của lưới gốc, kích thước $k \times m$. Nói cách khác, lưới ô vuông con này chính là $k$ hàng đầu tiên của lưới gốc. Với mỗi $k$ từ $1$ đến $n$, ta xét chiều cao của các cột chứa toàn số $1$ dựng trên từng vị trí trong hàng. Sau đó, ta có thể áp dụng bài toán tìm hình chữ nhật lớn nhất tạo bởi các cột để giải quyết vấn đề.

```cpp
for (int i = 1; i <= m; ++i)
    h[i] = 0;
for (int k = 1; k <= n; ++k) {
    for (int j = 1; j <= m; ++j) {
        if (grid[k][j] == 1)
            ++h[j];
        else
            h[j] = 0;
    }
    // giải bài toán tìm hình chữ nhật lớn nhất trong các cột...
}
```

Độ phức tạp thời gian và bộ nhớ của lời giải là $\mathcal{O}(n \times m)$.

# Bài tập áp dụng
* [JNEXT](https://www.spoj.com/problems/JNEXT/)
* [STPAR](https://www.spoj.com/problems/STPAR/)
* [280B - Codeforces](https://codeforces.com/problemset/problem/280/B)
* [1132G - Codeforces](https://codeforces.com/problemset/problem/1132/G)
* Tham khảo thêm tại: [VNOI Problem List](https://vnoi.info/problems/list/)
', '#include <cassert>

const int MAXN = 1e5 + 2;

int st[MAXN];
int top = 0;

void push(int x) // thêm x vào cuối Stack
{
    ++top;
    st[top] = x;
}

void pop() // loại bỏ phần tử ở cuối Stack
{
    assert(top); // đảm bảo Stack đang chứa ít nhất 1 phần tử
    --top;
}

int peek() // trả về giá trị của phần tử ở đỉnh Stack
{
    return st[top];
}', '2026-10-06T10:32:16.105285');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_deque', 'Deque - hàng đợi hai đầu', 'data-structures', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/data-structures/Deque.md', '["deque", "hàng đợi hai đầu", "sliding window deque", "min max đoạn"]', '- _Thêm_ một phần tử vào _cuối deque_. **(Push back)**
  - _Thêm_ một phần tử vào _đầu deque_. **(Push front)**
  - _Bỏ_ đi phần tử ở _cuối deque_, trả về giá trị của phần tử đó. **(Pop back)**
  - _Bỏ_ đi phần tử ở _đầu deque_, trả về giá trị của phần tử đó. **(Pop front)**', '# Deque - hàng đợi hai đầu

**Hàng đợi hai đầu** (**deque**) là cấu trúc dữ liệu chứa 0 hoặc nhiều phần tử có cùng kiểu dữ liệu và được biểu diễn bằng một hàng có phần tử _đầu_ (**front**) và phần tử _cuối_ (**last**). **Deque** hỗ trợ 4 thao tác như sau:

  - _Thêm_ một phần tử vào _cuối deque_. **(Push back)**
  - _Thêm_ một phần tử vào _đầu deque_. **(Push front)**
  - _Bỏ_ đi phần tử ở _cuối deque_, trả về giá trị của phần tử đó. **(Pop back)**
  - _Bỏ_ đi phần tử ở _đầu deque_, trả về giá trị của phần tử đó. **(Pop front)**

Về ứng dụng, ta sẽ bổ sung thêm một số thao tác sau:

  - _Xây dưng_ một deque rỗng. **(Construct)**
  - _Sao chép_ deque này sang một deque khác. **(Copy)**
  - _Lấy giá trị_ của phần tử cuối mà không xóa nó. **(Peek back)**
  - _Lấy giá trị_ của phần tử đầu mà không xóa nó. **(Peek front)**
  - _Xóa sạch_ một deque đang có phần tử. **(Empty)**
  - _Tìm số lượng phần tử_ trong deque. **(Find size)**
  - _Kiểm tra_ xem deque có rỗng hay không. **(Test empty)**

Hai thao tác _lấy giá trị_ thật sự không cần thiết, bởi _lấy giá trị phần tử đầu_ deque **(peek front)** tương đương với việc xóa đi phần tử đó **(pop front)** rồi lại thêm nó vào **(push front)**, và tương tự với _lấy giá trị phần tử cuối_ **(peek last)**. Cũng như  _kiểm tra rỗng_ **(Test empty)** thật ra cũng chỉ là _kiểm tra xem số lượng phần tử_ của deque có bằng 0 hay không.

# Thuật ngữ

Thuật ngữ **deque** là cách gọn ngắn tắt của _double-ended queue_ (hàng đợi hai đầu). Sở dĩ là vì nó có thể thêm, bớt phần tử ở cả hai đầu; còn thuật ngữ **queue** ở đây là một lớp cấu trúc dữ liệu cho phép thêm, bớt phần tử (nhưng không thể tìm kiếm). Một phần tử được xem là **đứng trước** một phần tử khác nếu nó gần với phần tử đầu (**front**) hơn là phần tử còn lại; ngược, lại, một phần tử được xem là **đứng sau** một phần tử khác nếu nó xa với phần tử đầu (**front**) hơn là phần tử còn lại. **Push** một phần tử là thêm phần tử đó vào hàng đợi, **pop** đẩy ra một phần tử. Lưu ý rằng _điểm đầu_ (**front**) và _điểm cuối_ (**last**) là tương đương nhau, khi thay đổi toàn bộ điểm cuối và đầu trong giải thuật của chúng ta thì nó vẫn hoạt động tương tự như trước đó.

# Cài đặt

## Cài đặt bằng mảng

- Khi sử dụng mảng để biển diễn **deque**, thì giá trị của **deque** sẽ được lưu giữ bằng những phần tử liên tiếp trong mảng. Tuy nhiên, đối vấn cách cài đặt này, thì nếu ta muốn đặt phần tử có _chỉ số thấp nhất_ (**front**) luôn luôn cố định ở một chỉ số (ví dụ $0$ hoặc $1$), hay nói cách khác, chỉ số thấp nhất luôn là cố định thì: Khi ta muốn **pop front** (thêm phần tử phía trước vào đầu hàng đợi), ta sẽ phải tịnh tiến toàn bộ các phần tử về bên trái sao cho phần tử có _chỉ số thấp nhất_ (**front**) sẽ lưu giá trị của phần tử _tiếp theo_ (**next**) và tương tự với các phần tử còn lại. Cũng như đối với việc **push front** (thêm phần tử vào đầu hàng đợi), toàn bộ những phần tử hiện tại trong **deque** sẽ phải tịnh tiến về bên phải để phần tử _chỉ số thấp nhất_ (**front**) sẽ lưu giá trị của phần tử vừa thêm vào, trong khi các phần tử còn lại sẽ lưu phần tử _đứng trước_. Thế nên, với cách cài đặt thế này, mỗi thao tác thực hiện sẽ tốn chi phí là **$\mathcal{O}(n)$** - với $n$ là số lượng phần tử hiện đang có của **deque**.

- Tuy nhiên, để có thể thực hiện một số thuật toán quan trọng như [BFS](http://wcipeg.com/wiki/Breadth-first_search) trong _thời gian tuyến tính_, các thao tác **push, pop** phải được thực hiện với chi phí là **$\mathcal{O}(1)$**. Đối với vấn đề này, thay vì phải thay thế phần tử bị **pop**, ta chỉ đơn thuần _thay đổi chỉ số_ của **front**, và khi **push** vào một phần tử, ta chỉ cần gán phần tử vào _chỉ số liền kề_ với phần tử đứng đầu và _thay đổi chỉ số_ của phần tử đầu. Tức là, ta chỉ cần quan tâm đến hai chỉ số của mảng, _đầu_ (**front**) và _cuối_ (**back**). Khi ta thêm một phần tử vào đầu (**push front**), ta chỉ cần giảm _chỉ số đầu_ (**front index**) rồi gán phần tử ấy vào chỉ số mới. Ngược lại khi ta thêm một phần tử vào cuối (**push back**), ta chỉ cần tăng _chỉ số đầu_ (**back index**) rồi gán phần tử ấy vào. Còn khi ta ta xóa một phần tử ở đầu (**pop front**), ta chỉ việc _tăng chỉ số đầu_, còn xóa phần tử ở cuối (**pop back**) thì ta sẽ _giảm chỉ số cuối_.

- Hãy thử nghĩ xem, trong trường hợp ta thêm một phần tử vào đầu (**push front**), rồi lại xóa đi phần tử cuối (**pop back**), rồi thêm lại phần tử đầu (**push front**), ... Tiếp tục như vậy, **deque** mà ta xây dựng vẫn luôn luôn chỉ có tối đa một phần tử, thế nhưng hai _chỉ số đầu_ và _chỉ số cuối_ lại tăng lên liên tục dẫn tới việc bị tràn giới hạn mảng. Để khắc phục vấn đề này, ta sẽ cho phép các chỉ số được _xoay vòng_ (**hàng đợi hai đầu xoay vòng**). Thế nên, khi tăng **chỉ số cực hạn** lên, ta sẽ nhận được **chỉ số cực tiểu** và ngược lại, khi giảm **chỉ số cực tiểu** ta sẽ nhận được **chỉ số cực đại**. Việc này được thực hiện bằng cách sử dụng toán tử _mod_ (**modulo** - %). Dưới đây sẽ là một cách cài đặt mẫu bằng mã giả:

```cpp
cấu trúc deque
     thủ tục construct(max_size)
          gán A là một mảng có tối đa max_size+1 phần tử
          gán N = max_size+1
          gán first = 0
          gán last = 0
     thủ tục push_front(x)
          first = (first - 1) mod N
          A[first] = x
     thủ tục push_back(x)
          A[last] = x
          last = (last + 1) mod N
     hàm pop_front
          return_val = A[first]
          first = (first + 1) mod N
          trả về return_val
     hàm pop_back
          last = (last - 1) mod N
          trả về A[last]
     hàm peek_front
          trả về A[first]
     hàm peek_back
          trả về A[(last-1) mod N]
     hàm size
          trả về (last-first) mod N
     thủ tục make_empty
          last = first
```

- Lưu ý rằng, nếu **deque** đã đầy rồi nhưng ta vẫn **push** thêm các phần tử vào thì kích thước của **deque** lúc này sẽ là $0$, và một số phần tử cũ sẽ bị ghi đè lên bằng các phần tử mới. Ngoài ra, khi kích thước của deque là $0$ nhưng ta lại muốn xóa đi phần tử thì lúc này, kích thước của **deque** sẽ là cực đại. Việc thêm vào các đoạn mã _kiểm tra lỗi_, _kiểm tra rỗng_ và _copy_ **deque** được lược bỏ đi nhằm mục đích ngắn gọn code.

## Cài đặt bằng danh sách liên kết

- Cài đặt bằng mảng xoay vòng hầu như đã là phương pháp tối ưu, tuy nhiên trong một vài trường hợp, khi mà số lượng phần tử cần không thể xác định được, lúc này ta sẽ sử dụng _danh sách liên kết_ (**linked list**) để biểu diễn **deque**. Chi tiết cho cách cài đặt này được mô tả bằng đoạn mã giả như sau:

```cpp
cấu trúc deque
     thủ tục construct
          gán L là một danh sách rỗng
     thủ tục push_front(x)
          chèn x vào đầu của L
     thủ tục push_back(x)
          chèn x vào cuối L
     hàm pop_front
          xóa phần tử đầu của L, trả về giá trị của phần tử đó
     hàm pop_back
          xóa phần tử cuối của L, trả về giá trị của phần tử đó
     hàm peek_front
          trả về giá trị của phần tử đầu L
     hàm peek_back
          trả về giá trị của phần tử cuối L
     hàm size
          trả về kích thước của L
     thủ tục make_empty
          làm rỗng L
```

- Ta có thể dễ dàng nhận ra, **deque** đơn thuần chỉ là chứa các thao tác của **list** sẵn có. (Ở đây ta giả định rằng **list** bao gồm cả hàm trả về kích thước, nếu không thì ta sẽ thêm hàm trả về kích thước trong **deque**).


## Lớp **deque** trong STD C++
- Trong STD C++, lớp `deque` nằm trong tiêu đề `<deque>`, là một _cấu trúc dữ liệu_ có khả năng chứa mọi kiểu dữ liệu (**cố định**), và kiểu dữ liệu này xem được xem như một thông số mẫu. Do đó, ví dụ như `deque<char>` là một hàng đợi hai đầu chứa các ký tự. Cấu trúc dữ liệu này cho phép sử dụng các hàm sau: (lưu ý rằng `T` là kiểu dữ liệu mà hàng đợi đó lưu trữ)

1.  `void push_front(const T& x)`: thêm x vào đầu **deque**.
2.  `void push_back(const T& x)`: thêm x vào cuối **deque**.
3.  `void pop_front()`: xóa phần tử đầu khỏi **deque**.
4.  `void pop_back()`: xóa phần tử cuối khỏi **deque**.
5.  `T& front()`: trả về giá trị đầu **deque**.
6.  `T& back()`: trả về giá trị cuối **deque**.
7.  `size_type size()`: trả về số lượng phần tử hiện tại trong **deque**.
8.  `bool empty()`: trả về giá trị `true` nếu **deque** rỗng và ngược lại, `false` nếu **deque** có phần tử.
9.  `void clear()`: xóa toàn bộ phần tử trong **deque**.

- Ngoài ra, không giống như cấu trúc dữ liệu STD `queue` và `stack`, cấu trúc dữ liệu `deque` lưu địa chỉ của các phần tử một cách ngẫu nhiên: do đó, D[0] sẽ đại diện cho phần tử đứng đầu D, và tương tự như thế với các phần tử tiếp theo.

- Cấu trúc dữ liệu `deque` nên dùng bất cứ khi nào mà nó có thể chứ đủ các phần tử cần thiết; bởi sử dụng nó sẽ nhanh và ít lỗi hơn so với việc bạn tự cài đặt lại. Trong khi đó, hầu như bạn không bao giờ phải đối mặt với một vấn đề gì mà STD `deque` vẫn không chạy đủ nhanh.

- Lưu ý rằng thao tác `pop` được định nghĩa trong cấu trúc dữ liệu `deque` chỉ xóa đi phần tử đó nhưng không trả về giá trị của nó. Để lấy được giá trị của nó rồi xóa, ta sẽ thực hiện cả hai thao tác gọi `front` hoặc `back` và sau đó thì `pop_front` hoặc `pop_back`.

- Các cấu trúc dữ liệu STD `queue` và `stack`, trừ khi bị ghi đè lên các đối số, thì chỉ là một phần của cấu trúc dữ liệu `deque` thôi. Bởi vì các tính chất của `stack` và `queue` chỉ là một phần của `deque`, nên ta có thể dễ dàng tạo ra nó bằng cách giới hạn những thao tác `deque`.
', 'cấu trúc deque
     thủ tục construct(max_size)
          gán A là một mảng có tối đa max_size+1 phần tử
          gán N = max_size+1
          gán first = 0
          gán last = 0
     thủ tục push_front(x)
          first = (first - 1) mod N
          A[first] = x
     thủ tục push_back(x)
          A[last] = x
          last = (last + 1) mod N
     hàm pop_front
          return_val = A[first]
          first = (first + 1) mod N
          trả về return_val
     hàm pop_back
          last = (last - 1) mod N
          trả về A[last]
     hàm peek_front
          trả về A[first]
     hàm peek_back
          trả về A[(last-1) mod N]
     hàm size
          trả về (last-first) mod N
     thủ tục make_empty
          last = first', '2026-10-06T10:32:16.535511');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_dsu', 'Disjoint Set Union', 'data-structures', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/data-structures/disjoint-set-union.md', '["dsu", "disjoint set union", "tập hợp rời rạc", "kruskal", "find union"]', '---
title: Disjoint Set Union
description: 
published: true
date: 2025-01-31T09:45:46.763Z
tags: 
editor: markdown
dateCreated: 2023-12-25T11:00:54.406Z
---', '---
title: Disjoint Set Union
description: 
published: true
date: 2025-01-31T09:45:46.763Z
tags: 
editor: markdown
dateCreated: 2023-12-25T11:00:54.406Z
---

# Disjoint Set Union

**Nguời viết:**
- Ngô Nhật Quang - HUS High School for Gifted Students

**Reviewer:**
- Trần Quang Lộc - ITMO University
- Hoàng Xuân Nhật - VNUHCM-University of Science
- Hồ Ngọc Vĩnh Phát - VNUHCM-University of Science

# Giới thiệu

**Disjoint Set Union**, hay **DSU**, là một cấu trúc dữ liệu hữu dụng và thường xuyên được sử dụng trong các kì thi CP. DSU, đúng như tên gọi của nó, là một cấu trúc dữ liệu có thể quản lí một cách hiệu quả một tập hợp của các tập hợp.

# Bài toán

Cho một đồ thị có $n$ đỉnh, ban đầu không có cạnh nào. Chúng ta phải xử lí các truy vấn như sau:
- Thêm một cạnh giữa đỉnh $x$ và đỉnh $y$ trong đồ thị.
- In ra `YES` nếu như đỉnh $x$ và đỉnh $y$ nằm trong cùng một thành phần liên thông. In ra `NO` nếu ngược lại.

Một thành phần liên thông trong đồ thị là một đồ thị con trong đó giữa bất kì hai đỉnh nào đều có đường đi đến nhau, và không thể nhận thêm bất kì một đỉnh nào mà vẫn duy trì tính chất trên.

# Cấu trúc dữ liệu Disjoint Set Union

Nếu ta coi mỗi đỉnh trong đồ thị là một phần tử và mỗi thành phần liên thông trong đồ thị là một tập hợp, truy vấn thứ nhất sẽ trở thành gộp hai tập hợp lần lượt chứa phần tử $x$ và $y$ thành một tập hợp mới và truy vấn thứ hai trở thành hỏi hai phần tử $x$ và $y$ có nằm trong cùng một tập hợp hay không.

Để giải bài toán này, ta sẽ xây dựng một cấu trúc dữ liệu có ba thao tác như sau:
- `make_set(v)` - tạo ra một tập hợp mới chỉ chứa phần tử `v`.
- `union_sets(a, b)` - gộp tập hợp chứa phần tử `a` và tập hợp chứa phần tử `b` thành một.
- `find_set(v)` - cho biết **đại diện** của tập hợp có chứa phần tử `v`. Đại diện này sẽ là một phần tử của tập hợp đó và có thể thay đổi sau mỗi lần gọi thao tác `union_sets`. Ta có thể sử dụng đại diện đó để kiểm tra hai phần tử có nằm trong cùng một tập hợp hay không. `a` và `b` nằm trong cùng một tập hợp nếu như đại diện của hai tập chứa chúng là giống nhau và không nằm trong cùng một tập hợp nếu ngược lại.

Ta có thể xử lí các thao tác một cách hiệu quả này với các tập hợp được biểu diễn dưới dạng các cây, mỗi phần tử là một đỉnh và mỗi cây tương ứng với một tập hợp. Gốc của mỗi cây sẽ là đại diện của tập hợp đó.

Cấu trúc của cây được thể hiện qua ví dụ sau đây:

![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img1.png)

Ban đầu, mỗi phần tử thuộc một tập hợp riêng biệt, vậy mỗi đỉnh là một cây riêng biệt. Bước tiếp theo, ta gộp hai tập hợp chứa phần tử $1$ và $2$. Sau đó, ta gộp hai tập hợp chứa phần tử $3$ và $4$. Cuối cùng, ta gộp hai tập hợp chứa phần tử $1$ và $3$.

Với cách cài đặt này, ta sẽ lưu một mảng `parent` với `parent[v]` là cha của phần tử `v`.

## Cài đặt "ngây thơ"

Để tạo một tập hợp mới gồm phần tử `v` (hay `make_set(v)`), ta chỉ cần tạo một cây có gốc là `v`, với `parent[v] = v`.

Để gộp hai tập hợp lần lượt chứa phần tử `a` và phần tử `b` (hay `union_sets(a, b)`), ta sẽ tìm gốc của cây có chứa phần tử `a` và gốc của cây có có chứa phần tử `b`. Nếu hai giá trị này giống nhau, ta sẽ không làm gì do hai phần tử này đã nằm trong cùng một tập hợp. Còn nếu không, ta sẽ đặt gốc cây này là cha của gốc cây còn lại. Dễ thấy điều này sẽ gộp hai cây lại thành một.

Để tìm kí hiệu của một tập hợp có chứa phần tử `v` (hay `find_set(v)`), ta đơn giản nhảy lên các tổ tiên của đỉnh `v` cho đến khi ta đến gốc của cây. Thao tác này có thể dễ dàng được cài đặt bằng đệ quy.

```cpp
void make_set(int v) {
    parent[v] = v; // Tạo ra cây mới có gốc là đỉnh v
}

int find_set(int v) {
    if (v == parent[v])
        return v;               // Trả về đỉnh v nếu như đỉnh v là gốc của cây
    return find_set(parent[v]); // Đệ quy lên cha của đỉnh v
}

void union_sets(int a, int b) {
    a = find_set(a); // Tìm gốc của cây có chứa đỉnh a
    b = find_set(b); // Tìm gốc của cây có chứa đỉnh b
    if (a != b)
        parent[b] = a; // Gộp hai cây nếu như hai phần tử ở hai cây khác nhau
}
```

Như đã nói, đây là cách cài đặt ngây thơ, ta có thể dễ dàng tạo ra một ví dụ sao cho khi sử dụng cách cài đặt này, cây sẽ trở thành một đoạn thẳng gồm $n$ phần tử. Trong trường hợp này, độ phức tạp của thao tác `find_set` sẽ là $\mathcal{O}(n)$.

Điều này đương nhiên là không thể chấp nhận được, vì vậy ta sẽ tìm hiểu hai phương pháp tối ưu thuật toán dưới đây.

## Tối ưu 1 - Gộp theo kích cỡ / độ cao

Phương pháp tối ưu này sẽ thay đổi thao tác `union_sets`. Chính xác hơn, ta sẽ thay đổi cách xét trong hai cây đang gộp, gốc của cây nào sẽ là cha của gốc của cây còn lại.

Có khá nhiều cách để xét điều này, nhưng hai cách được sử dụng nhiều nhất chính là gộp theo kích cỡ và gộp theo độ cao của cây.

Giả dụ mỗi cây có một giá trị. Ở cách thứ nhất, giá trị đó là kích cỡ của cây, và ở cách thứ hai, giá trị đó là độ cao của cây. Ở cả hai cách này, ta sẽ luôn đặt gốc của cây có giá trị cao hơn là cha của gốc của cây có giá trị thấp hơn.

Thao tác `union_sets` được tối ưu gộp theo kích cỡ:
```cpp
void make_set(int v) {
    parent[v] = v;
    sz[v] = 1; // Ban đầu tập hợp chứa v có kích cỡ là 1
}

void union_sets(int a, int b) {
    a = find_set(a);
    b = find_set(b);
    if (a != b) {
        if (sz[a] < sz[b])
            swap(a, b); // Đặt biến a là gốc của cây có kích cỡ lớn hơn
        parent[b] = a;
        sz[a] += sz[b]; // Cập nhật kích cỡ của cây mới gộp lại
    }
}
```

Thao tác `union_sets` được tối ưu gộp theo độ cao:
```cpp
void make_set(int v) {
    parent[v] = v;
    rank[v] = 0; // Gốc của cây có độ cao là 0
}

void union_sets(int a, int b) {
    a = find_set(a);
    b = find_set(b);
    if (a != b) {
        if (rank[a] < rank[b])
            swap(a, b); // Đặt biến a là gốc của cây có độ cao lớn hơn
        parent[b] = a;
        if (rank[a] == rank[b])
            rank[a]++; // Nếu như hai cây có cùng một độ cao, độ cao của cây mới sau khi gộp sẽ tăng 1
    }
}
```

Chỉ cần sử dụng phương pháp tối ưu này, độ phức tạp của thao tác `find_set` sẽ trở thành $\mathcal{O}(\log{n})$. Tuy nhiên, ta vẫn còn có thể làm tốt hơn thế khi kết hợp với phương pháp tối ưu thứ hai.

## Tối ưu 2 - Nén đường đi

Phương pháp tối ưu này nhằm tăng tốc thao tác `find_set`.

Giả dụ ta gọi `find_set(v)` với một đỉnh `v` bất kì, chúng ta tìm được `p` là gốc của cây, đồng thời cũng là giá trị của mọi hàm `find_set(u)` với `u` là một đỉnh nằm trên đường đi từ `u` đến `p`. Cách tối ưu ở đây chính là làm cho đường đi đến gốc của các đỉnh `u` ngắn đi bằng cách gán trực tiếp cha của các đỉnh `u` này thành `p`.

Có thể thấy sau khi thực hiện một thao tác như vậy, cấu trúc cả cây có thể thay đổi. Ta có thể thấy điều này trong ví dụ sau đây:

<center>

![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img2.png =700x)
</center>

Bên trái là cây ban đầu và bên phải là cây bị nén sau khi ta sử dụng thao tác `find_set(7)`, nén đường đi tới gốc của các đỉnh $7, 5, 3, 2$.

Thao tác `find_set` mới này được cài đặt như sau:
```cpp
int find_set(int v) {
    if (v == parent[v])
        return v;                // Trả về đỉnh v nếu như đỉnh v là gốc của cây
    int p = find_set(parent[v]); // Đệ quy lên cha của đỉnh v
    parent[v] = p;               // Nén đoạn từ v lên gốc của cây
    return p;
}
```

Một cách cài đặt khác của thao tác `find_set` mà thường được sử dụng nhiều trong CP do tính ngắn gọn của nó:
```cpp
int find_set(int v) {
    return v == parent[v] ? v : parent[v] = find_set(parent[v]);
}
```

## Độ phức tạp thời gian

Khi kết hợp cả hai phương pháp tối ưu bên trên lại, ta sẽ đạt được độ phức tạp trung bình cho thao tác `find_set` là $\mathcal{O}(\alpha(n))$ với $\alpha(n)$ là hàm Ackermann nghịch đảo. Tuy nhiên hàm này **tăng rất chậm** (với $\alpha(n) \le 3$ với $n \le 61$ và $\alpha(n) \le 4$ với xấp xỉ $n < 10^{600}$).

Độ phức tạp trung bình, đúng như tên gọi của nó, là tổng độ phức tạp của các thao tác, chia cho số lượng thao tác. Điều này có nghĩa ở một số thao tác, độ phức tạp có thể lên tới $\mathcal{O}(\log{n})$ nhưng ta thực hiện $m$ thao tác như vậy, độ phức tạp sẽ trở thành $\mathcal{O}(m \cdot \alpha(n))$ ($\approx \mathcal{O}(m)$ với $m$ đủ lớn).

Một điều đáng lưu ý là nếu như chúng ta chỉ sử dụng phương pháp tối ưu $2$, độ phức tạp trung bình của thao tác `find_set` cũng chỉ là $\mathcal{O}(\log{n})$.

## Chứng minh độ phức tạp thời gian

**Tối ưu gộp set theo kích cỡ**: Gọi $a$ là độ lớn của cây con có gốc là đỉnh $v$, $b$ là độ lớn của cây con có gốc là $p$ (cha của đỉnh $v$). Dễ thấy rằng $b \ge 2 \times a$ do số lượng đỉnh trong cây con gốc $p$ mà không thuộc cây con gốc $v$ lớn hơn hoặc bằng $a$. Do vậy độ sâu tối đa của cây sẽ là $\log_2{n}$.

**Tối ưu gộp set theo độ cao**: Ta sẽ chứng minh một cây có độ cao là $k$ có ít nhất $2^{k}$ đỉnh. Có thể thấy rằng số cây có độ cao là $0$ có chính xác $1$ đỉnh. Một cây chỉ có thể có độ cao là $k$ nếu như trước đó độ cao của nó là $k - 1$ và nó được gộp với một cây khác có độ cao là $k - 1$. Vì vậy, số đỉnh trong cây có độ cao là $k$ sẽ lớn hơn hoặc bằng hai lần số đỉnh trong cây có độ cao là $k - 1$. Do đó độ cao lớn nhất có thể của cây sẽ là $\log_2{n}$.

**Kết hợp hai phương pháp tối ưu**: Phần chứng minh này khá dài dòng và khó hiểu, bạn đọc có thể tìm hiểu tại [đây](http://e-maxx.ru/bookz/files/dsu/Efficiency%20of%20a%20Good%20But%20Not%20Linear%20Set%20Union%20Algorithm.%20Tarjan.pdf) hoặc [đây](https://codeforces.com/blog/entry/98275).

## Một cách cài đặt khác

Ở trong một số tài liệu như Giải thuật và lập trình (thầy Lê Minh Hoàng) hay thư viện Atcoder, thay vì cài đặt cấu trúc dữ liệu DSU bằng hai mảng `parent` và `sz`, chỉ một mảng `lab` được sử dụng.

Nếu như `lab[v]` âm thì $u$ là gốc của một cây và `-lab[v]` là số lượng đỉnh của cây đó. Còn nếu `lab[v]` dương thì `lab[v]` là cha của đỉnh $u$.

```cpp
void make_set(int v) {
    lab[v] = -1;
}

int find_set(int v) {
    return lab[v] < 0 ? v : lab[v] = find_set(lab[v]);
}

void union_sets(int a, int b) {
    a = find_set(a);
    b = find_set(b);

    if (a != b) {
        if (lab[a] > lab[b])
            swap(a, b);
        lab[a] += lab[b];
        lab[b] = a;
    }
}
```

# Một số ứng dụng của DSU

## Lưu thêm thông tin khác cho mỗi tập hợp

Ngoài việc lưu các thông tin về cấu trúc cây, ta có thể lưu các hàm có tính chất giao hoán và kết hợp của từng tập hợp. Ví dụ, ta có thể lưu tổng các phần tử/ giá trị phần tử bé nhất của từng tập hợp. Lúc này, các thao tác của dsu sẽ được cài đặt như sau:

```cpp
void make_set(int v) {
    parent[v] = v;
    sz[v] = 1;
    mn[v] = value[v];
    sum[v] = value[v];
    // value[v] là giá trị của phần tử thứ v
}

int find_set(int v) {
    return v == parent[v] ? v : parent[v] = find_set(parent[v]);
}

void union_sets(int a, int b) {
    a = find_set(a);
    b = find_set(b);
    if (a != b) {
        if (sz[a] < sz[b])
            swap(a, b);
        parent[b] = a;
        sz[a] += sz[b];
        sum[a] += sum[b];
        mn[a] = min(mn[a], mn[b]);
    }
}
```

Có thể thấy rằng, tương tự như thông tin về độ lớn của cây (`sz`) hay độ cao của cây (`rank`), ta sẽ lưu các hàm này tại gốc của từng cây.

```cpp
int find_sum(int v) { // Trả về tổng của các phần tử trong tập hợp chứa v
    v = find_set(v);
    return sum[v];
}

int find_min(int v) { // Trả về giá trị bé nhất của các phần tử trong tập hợp chứa v
    v = find_set(v);
    return mn[v];
}
```

## Bài toán xếp hàng

### Bài toán

Cho $n$ người đang xếp hàng ở các vị trí từ $1$ đến $n$. Viết chương trình xử lí các truy vấn:
- Người đứng ở vị trí thứ $i$ rời khỏi hàng.
- Tìm người gần nhất về bên phải vị trí $p$ mà chưa rời khỏi hàng.

### Lời giải

Với mỗi vị trí, ta sẽ có một con trỏ. Nếu người đứng ở vị trị này vẫn đang đứng trong hàng, con trỏ trỏ vào vị trị đó, nếu không thì con trỏ này sẽ trỏ vào vị trí ngay bên phải.

Xét ví dụ sau với $n = 5$, ban đầu ta có:

<center>

![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img3.png =600x)
</center>
<br>

Giả dụ người đứng ở vị trí $2$ và $3$ rời khỏi hàng:

<center>

![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img4.png =600x)
</center>
<br>

Dễ thấy để tìm người gần nhất bên phải mà chưa rời khỏi hàng, ta đi dần dần sang phải cho đến khi gặp một vị trí có con trỏ trỏ đến chính nó.

Chúng ta có thể sử dụng cấu trúc dữ liệu DSU để lưu trữ các thông tin trên và sử dụng phương pháp tối ưu nén đoạn để đạt được độ phức tạp trung bình $\mathcal{O}(\log{n})$ với mỗi truy vấn.

Để ý kĩ hơn, ta thấy vị trí ta cần tìm chính là vị trí có thứ tự lớn nhất trong tập hợp. Ta có thể lưu phần tử lớn nhất trong một tập hợp như đã nói ở phần trên, qua đó đạt được độ phức tạp trung bình $\mathcal{O}(\alpha{(n)})$ với mỗi truy vấn.

### Code mẫu
```cpp
void make_set(int v) {
    parent[v] = v;
    sz[v] = 1;
    mx[v] = v;
}

int find_set(int v) {
    return v == parent[v] ? v : parent[v] = find_set(parent[v]);
}

void union_sets(int a, int b) {
    a = find_set(a);
    b = find_set(b);
    if (a != b) {
        if (sz[a] < sz[b])
            swap(a, b);
        parent[b] = a;
        sz[a] += sz[b];
        mx[a] = max(mx[a], mx[b]);
    }
}

void leave(int v) { // Người thứ v rời khỏi hàng
    union_sets(v, v + 1);
}

int find_next(int p) { // Trả vè thứ tự của người gần nhất về bên phải
                       // vị trí p mà chưa rời khỏi hàng
    p = find_set(p);
    return mx[p];
}
```

## Tối ưu thuật toán tìm cây khung nhỏ nhất trong đồ thị

Sử dụng DSU, ta có thể tối ưu độ phức tạp của thuật toán tìm cây khung nhỏ nhất của đồ thị từ $\mathcal{O}(m \log{n} + n^{2})$ xuống $\mathcal{O}(m \log{n})$.

Bạn đọc có thể tìm hiểu kĩ hơn ở [blog](/algo/graph-theory/minimum-spanning-tree.md) tìm cây khung nhỏ nhất trong đồ thị.

## Đảo ngược truy vấn

Do tính chất một chiều của cấu trúc dữ liệu DSU (chỉ thêm chứ không xóa được), ở một số bài ta phải đảo ngược thứ tự của các truy vấn trong bài để giải.

### Bài toán

[Codeforces 722C - Destroying Array](https://codeforces.com/contest/722/problem/C)

Cho mảng gồm $n$ số nguyên không âm $a_1, a_2, \ldots, a_n$ và một hoán vị các số từ $1$ đến $n$.

Các phần tử sẽ lần lượt bị phá hủy theo thứ tự hoán vị trên. Sau mỗi lần một phần tử bị phá hủy, hãy in ra dãy con liên tiếp có tổng lớn nhất mà không có phần tử nào đã bị phá hủy. Tổng của một đoạn con rỗng là $0$.

Giới hạn: $1\le n \le 10^{5}, 0 \le a_i \le 10^{9}$.

### Lời giải

Do các phần tử là các số nguyên không âm, ta có thể thấy rằng nếu sau khi một số phần tử bị phá hủy, dãy bị chia thành $k$ đoạn con liên tiếp thì đáp án sẽ là một trong $k$ đoạn con này.

Đảo ngược thứ tự của các truy vấn, ta có thể thấy bài toán trở nên dễ dàng rất nhiều: Hồi sinh một số bị phá hủy trở về ban đầu và in ra đoạn con có tổng lớn nhất. Đến đây ta nghĩ tới cấu trúc dữ liệu DSU để xử lí các đoạn con liên tiếp.

Khi một số được hồi sinh, ta sẽ kiểm tra bên trái số đó, nếu có số nào đã được hồi sinh từ trước thì ta sẽ thêm cạnh giữa số đó và số bên trái số đó. Tương tự với số bên phải. Dễ thấy rằng mọi lúc các thành phần liên thông trong DSU sẽ thể hiện cho một đoạn con liên tiếp. Việc lưu trữ tổng của một thành phần liên thông đã được nhắc đến ở phần trước.

### Code mẫu
```cpp
#include <bits/stdc++.h>

#define int long long

using namespace std;

const int N = 1e5 + 5;
int n, ans;
int a[N], p[N], res[N];
bool flag[N];

struct DSU {
    vector<int> parent, sz, sum;

    DSU(int n) : parent(n), sz(n), sum(n) {};

    void make_set(int v) {
        parent[v] = v;
        sz[v] = 1;
        sum[v] = a[v];
    }

    int find_set(int v) {
        return v == parent[v] ? v : parent[v] = find_set(parent[v]);
    }

    void join_sets(int a, int b) {
        a = find_set(a);
        b = find_set(b);
        if (a != b) {
            if (sz[a] < sz[b])
                swap(a, b);
            parent[b] = a;
            sz[a] += sz[b];
            sum[a] += sum[b];
        }
    }
};

signed main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    cin >> n;

    for (int i = 1; i <= n; i++)
        cin >> a[i];
    for (int i = 1; i <= n; i++)
        cin >> p[i];

    DSU g(n + 5);
    for (int i = 1; i <= n; i++)
        g.make_set(i);
    for (int i = n; i >= 1; i--) {
        flag[p[i]] = true;

        if (p[i] > 1 && flag[p[i] - 1])
            g.join_sets(p[i], p[i] - 1);
        if (p[i] < n && flag[p[i] + 1])
            g.join_sets(p[i], p[i] + 1);

        ans = max(ans, g.sum[g.find_set(p[i])]);
        res[i - 1] = ans;
    }

    for (int i = 1; i <= n; i++)
        cout << res[i] << "\n";
}
```

## Kiểm tra tính chất hai phía của đồ thị online

### Bài toán

Cho một đồ thị có $n$ đỉnh, ban đầu không có cạnh nào. Xử lí các truy vấn thêm cạnh vào đồ thị. Hỏi sau truy vấn nào thì đồ thị không còn là đồ thị hai phía?

### Lời giải

Dựa vào tính chất của đồ thị hai phía, dễ thấy rằng với mọi cặp đỉnh thuộc cùng một phía sẽ có đường đi bắt kì giữa chúng có độ dài chẵn. Nói cách khác, nếu ta chọn một đỉnh $l$ trong một thành phần liên thông, hai đỉnh $a$ và $b$ sẽ nằm cùng một phía nếu như khoảng cách của hai đỉnh này tới đỉnh $l$ có cùng tính chẵn lẻ.

Chúng ta hoàn toàn có thể sử dụng cấu trúc dữ liệu DSU để lưu trữ thông tin này bằng cách lưu tính chẵn lẻ của đường đi từ mọi đỉnh tới gốc của cây. Lúc này, hàm `find_set` của ta sẽ trả về một cặp `{gốc của cây, tính chẵn lẻ của độ dài đường đi đến gốc của cây}` và được cài đặt như sau:

```cpp
pair<int, int> find_set(int v) {
    if (v == parent[v])
        return {v, 0};
    pair<int, int> val = find_set(parent[v]);
    parent[v] = val.first;
    dist[v] = (dist[v] + val.second) % 2;
    // độ dài từ đỉnh đến cha mới
    // = độ dài đến đỉnh cha cũ
    // + độ dài từ cha cũ tới cha mới (gốc của cây)
    return {parent[v], dist[v]};
}
```

Hàm `union_sets`, tương tự, cũng cần phải được thay đổi và được cài đặt như sau:
```cpp
void union_sets(int a, int b) {
    pair<int, int> valA = find_set(a),
                   valB = find_set(b);
    a = valA.first;
    b = valB.first;

    if (a == b) {
        if (valA.second != valB.second) {
            // Đồ thị không còn là đồ thị hai phía do có
            // cạnh nối giữa hai đỉnh thuộc hai phía khác nhau.
        }
    }

    else {
        if (sz[a] < sz[b])
            swap(a, b);
        parent[b] = a;
        sz[a] += sz[b];
        dist[b] = (valA.second + valB.second + 1) % 2;
        // Độ dài từ đỉnh b tới gốc cây
        // = Độ dài từ đỉnh a tới gốc cây ban đầu chứa a
        // + Dộ dài từ đỉnh b tới gốc cây ban đầu chứa b
        // + 1 (Khoảng cách giữa hai đỉnh a và b)
    }
}
```

# Một số kĩ thuật sử dụng tính chất của DSU

Ngoài ra tính chất của DSU còn được sử dụng trong một số kĩ thuật khá phổ biến.

## Kĩ thuật gộp set (Small-to-Large Merging)

Giả sử ta cần lưu trực tiếp các phần tử của một tập hợp bằng một cấu trúc dữ liệu như set/map, thì liệu có cách nào đủ hiệu quả để thực hiện thao tác `union_sets` hay không? Câu trả lời là có và kĩ thuật này được gọi là gộp set (small-to-large merging).

### Bài toán

[VNOJ - colquery](https://oj.vnoi.info/problem/colquery)

Cho một đồ thị vô hướng có $n$ đỉnh, đỉnh thứ $i$ có màu $a_i$. Ban đầu đồ thị chưa có cạnh nào.

Cho $q$ truy vấn, mỗi truy vấn thuộc một trong hai dạng sau:
- $1\,u\,v$: Thêm một cạnh nối giữa $u$ và $v$.
- $2\,u\,c$: Tính số đỉnh có màu $c$ trong thành phần liên thông chứa $u$.

### Lời giải

Chúng ta vẫn sẽ sử dụng cấu trúc dữ liệu DSU trong bài này, và lưu thêm một map chứa số lượng từng màu tại gốc của từng cây.

Trong thao tác `union_sets`, ta sẽ chuyển lần lượt các phần tử trong map của tập hợp bé hơn vào map của tập hợp lớn hơn. Thoạt nhìn ban đầu, việc làm này có độ phức tạp tổng là $\mathcal{O}(n^{2})$, nhưng thực chất nó chỉ là $\mathcal{O}(n \log{n})$. Ta sẽ chứng minh tại sao.

Gọi số phần tử nằm trong hai dãy số lớn hơn và bé hơn lần lượt là $a$ và $b$. Dễ thấy được rằng $a + b \ge 2 \cdot b$, nên mỗi lần một phần tử bị di chuyển, nó sẽ bị di chuyển tới một dãy số có kích thước lớn hơn ít nhất hai lần kích thước dãy số ban đầu nó nằm trong. Vì vậy mà ta thấy rằng một phần tử chỉ bị di chuyển tối đa $\log_2{n}$ lần, qua đó mà đạt được độ phức tạp $\mathcal{O}(n \log{n})$.

### Code mẫu

```cpp
#include <bits/stdc++.h>

using namespace std;

const int N = 1e5 + 5;
int n, q;
int a[N];

struct DSU {
    vector<map<int, int>> color;
    vector<int> parent, sz;

    DSU(int n) : color(n), parent(n), sz(n) {};

    void make_set(int v) {
        color[v][a[v]] = 1;
        parent[v] = v;
        sz[v] = 1;
    }

    int find_set(int v) {
        if (v == parent[v])
            return v;
        int p = find_set(parent[v]);
        parent[v] = p;
        return p;
    }

    void union_sets(int a, int b) {
        a = find_set(a);
        b = find_set(b);
        if (a != b) {
            if (sz[a] < sz[b])
                swap(a, b);
            parent[b] = a;
            sz[a] += sz[b];

            for (auto p : color[b])
                color[a][p.first] += p.second;
            color[b].clear();
        }
    }

    int query(int v, int c) {
        v = find_set(v);
        return color[v].find(c) != color[v].end() ? color[v][c] : 0;
    }
};

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    cin >> n >> q;
    for (int i = 1; i <= n; i++)
        cin >> a[i];

    DSU g(n + 5);
    for (int i = 1; i <= n; i++)
        g.make_set(i);
    while (q--) {
        int op, x, y;
        cin >> op >> x >> y;
        if (op == 1)
            g.union_sets(x, y);
        else
            cout << g.query(x, y) << "\n";
    }
}
```

Độ phức tạp thuật toán: $\mathcal{O}(n \log^{2}{n})$, có thêm một $\log$ do ta phải lưu giữ thông tin bằng cấu trúc dữ liệu map.

## Kĩ thuật DSU trên cây (Sack)

Đây là một thuật toán sử dụng ý tưởng gộp set ở phần trước để giải quyết một số bài toán truy vấn trên cây một cách hiệu quả.

### Bài toán

Cho một cây có $n$ đỉnh với gốc là đỉnh $1$, đỉnh thứ $i$ được tô màu $c_i$. Cho $q$ truy vấn có dạng $v\,c$, với mỗi truy vấn in ra số lượng đỉnh có màu $c$ trong cây con gốc $v$.

### Lời giải

Sử dụng ý tưởng gộp set ở phần trước, ta có thể dễ dàng đạt được độ phức tạp $\mathcal{O}(n \log^{2}{n} + q\log{n})$. Tuy nhiên, ta còn có thể làm tốt hơn với kĩ thuật DSU trên cây

Bằng cách thay đổi cách dfs, ta có thể loại bỏ một $\log$ của cấu trúc dữ liệu map trong độ phức tạp, qua đó mà đạt được độ phức tạp $\mathcal{O}(n \log{n} + q)$. Ta sẽ tham khảo đoạn code dưới đây để hiểu hơn kĩ thuật này:

```cpp
int sz[N];
int cnt[N];

void pre_dfs(int u, int p) { // Một hàm dfs chạy trước
                             // để tính được độ lớn của từng cây con
    sz[u] = 1;
    for (auto v : g[u])
        if (v != p) {
            pre_dfs(v, u);
            sz[u] += sz[v];
        }
}

void update(int u, int p, int delta) {
    cnt[color[u]] += delta;
    for (auto v : g[u])
        if (v != p)
            update(v, u, delta);
}

void dfs(int u, int p) {
    int bigChild = -1;
    for (auto v : g[u])
        if (v != p) {
            if (bigChild == -1 || sz[v] > sz[bigChild])
                bigChild = v;
        } // Tìm cây con lớn nhất trong
    // các con trực tiếp của đỉnh u

    for (auto v : g[u])
        if (v != p && v != bigChild) {
            dfs(v, u);
            update(v, u, -1);
        }
    if (bigChild != -1)
        dfs(bigChild, u);

    for (auto v : g[u])
        if (v != p && v != bigChild)
            update(v, u, 1);
    cnt[color[u]]++;

    // Trả lời các truy vấn tại đỉnh u, với cnt[c]
    // là số lượng đỉnh có màu c trong cây con gốc u
}
```

Với cây con gốc $u$ đang xét, ta sẽ dfs xuống giải bài toán với đỉnh $v$ là con trực tiếp của đỉnh $u$. Nếu giải như bài toán colquery, ở mỗi đỉnh ta sẽ lưu một cấu trúc dữ liệu map để lưu số lượng từng màu trong cây con đó. Sau đó ta sẽ gộp chúng lại để có được map chứa số lượng từng màu trong cây con gốc $u$ (Gộp các map của cây con không phải cây con lớn nhất vào map của cây con lớn nhất).

<center>

![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img17.png =400x)
</center>
<br>

Tuy nhiên, sự tối ưu của kỹ thuật này chính là ta có thể đảo thứ tự dfs và trả lời các truy vấn offline.

<center>

![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img16.png =800x)
</center>
<br>

Ta sẽ sử dụng duy nhất một mảng để đếm số lượng từng màu trong một cây con. Bằng cách nào đó, đến cuối hàm dfs của cây con gốc $u$, ta có sẽ có mảng $\texttt{cnt}$ với $\texttt{cnt}[c]$ là số lượng đỉnh có màu $c$ trong cây con gốc $u$.

Do dùng chung một mảng chứ không phải lưu riêng từng cây con trong map riêng biệt, nên trước khi ta dfs xuống để giải bài toán cho các con tiếp theo, ta phải cập nhật "xóa" đi các màu của các cây con đã dfs từ trước khỏi mảng để tránh ghi đè lên đáp án. Do đó ta thấy chỉ có màu trong cây con được dfs cuối cùng là không nhất thiết phải xóa đi ngay lập tức.

Gọi đỉnh $v$ có cây con lớn nhất là `bigChild`. Với ý tưởng gộp màu trong các cây con khác vào cây con `bigChild`, hay nói cách khác ta không được phép di chuyển các màu trong cây con `bigChild`, ta sẽ đảo thứ tự dfs của `bigChild` xuống cuối cùng và giữ lại các màu trong mảng mà không xóa đi. Tiếp đó ta sẽ dfs xuống các cây không phải `bigChild` chỉ để thêm lại các màu vào mảng, qua đó mà tìm được số lượng từng màu trong cây con gốc $u$. Dễ thấy bằng cách này ta đã loại bỏ hoàn toàn việc sử dụng cấu trúc dữ liệu map, qua đó mà giảm được một $\log$ trong độ phức tạp thời gian.

Ta có thể thấy rõ hơn thông tin mà mảng $\texttt{cnt}$ lưu trữ trong quá trình sau đây:

| Chú thích | Minh họa |
| -------- | -------- |
| dfs xuống cây con $v_1$, lúc này trong mảng $\texttt{cnt}$ chứa các màu trong cây con này | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img5.png) |
| $v_1$ không phải `bigChild`,  do đó ta xóa các màu trong cây con này ra khỏi mảng $\texttt{cnt}$ | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img6.png) |
| dfs xuống cây con $v_3$, lúc này trong mảng $\texttt{cnt}$ chứa các màu trong cây con này | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img7.png) |
| $v_3$ không phải `bigChild`,  do đó ta xóa các màu trong cây con này ra khỏi mảng $\texttt{cnt}$ | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img8.png) |
| dfs xuống cây con $v_2$, lúc này trong mảng $\texttt{cnt}$ chứa các màu trong cây con này | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img9.png) |
| $v_2$ là `bigChild`,  do đó ta giữ nguyên các màu trong cây con này trong mảng $\texttt{cnt}$ | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img10.png) |
| Thêm các màu trong cây con $v_1$ vào mảng $\texttt{cnt}$ | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img11.png) |
| Thêm các màu trong cây con $v_3$ vào mảng $\texttt{cnt}$ | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img12.png) |
| Thêm đỉnh $u$ vào mảng $\texttt{cnt}$ | ![](/uploads/algo/data-structures/disjoint-set-union/disjoint-set-union_img13.png) |

Lúc này mảng $\texttt{cnt}$ đã có đủ các màu trong cây con gốc $u$ và ta có thể trả lời các truy vấn của đỉnh $u$.

### Code mẫu
```cpp
#include <bits/stdc++.h>

using namespace std;

const int N = 5e5 + 5;
int n, q, color[N];
int sz[N];
int cnt[N];
int res[N]; // res[i] là đáp án của truy vấn thứ i
vector<pair<int, int>> queries[N];
// cặp (a, b) trong queries[v] có nghĩa là ở đỉnh v
// có truy vấn hỏi có bao nhiêu đỉnh trong cây con có màu a
// và số thứ tự của truy vấn là b
vector<int> g[N];

void pre_dfs(int u, int p) {
    sz[u] = 1;
    for (auto v : g[u])
        if (v != p) {
            pre_dfs(v, u);
            sz[u] += sz[v];
        }
}

void update(int u, int p, int delta) {
    cnt[color[u]] += delta;
    for (auto v : g[u])
        if (v != p)
            update(v, u, delta);
}

void dfs(int u, int p) {
    int bigChild = -1;
    for (auto v : g[u])
        if (v != p) {
            if (bigChild == -1 || sz[v] > sz[bigChild])
                bigChild = v;
        }

    for (auto v : g[u])
        if (v != p && v != bigChild) {
            dfs(v, u);
            update(v, u, -1);
        }
    if (bigChild != -1)
        dfs(bigChild, u);

    for (auto v : g[u])
        if (v != p && v != bigChild)
            update(v, u, 1);
    cnt[color[u]]++;

    for (auto p : queries[u])
        res[p.second] = cnt[p.first];
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    cin >> n >> q;

    for (int i = 1; i <= n; i++)
        cin >> color[i];

    for (int i = 1; i < n; i++) {
        int a, b;
        cin >> a >> b;
        g[a].push_back(b);
        g[b].push_back(a);
    }

    for (int i = 1; i <= q; i++) {
        int v, c;
        cin >> v >> c;
        queries[v].push_back({c, i});
    }

    pre_dfs(1, 0);
    dfs(1, 0);

    for (int i = 1; i <= q; i++)
        cout << res[i] << "\n";
}
```

# Tham khảo
- [CP-Algorithms](https://cp-algorithms.com/data_structures/disjoint_set_union.html)
- [Codeforces ITMO Academy: pilot course](https://codeforces.com/edu/course/2/lesson/7)
- [Codeforces blog: DSU trên cây (Sack)](https://codeforces.com/blog/entry/44351)

# Bài tập

## Disjoint Set Union
- [Codeforces ITMO Academy: pilot course](https://codeforces.com/edu/course/2/lesson/7)
- [Codeforces Problemset](https://codeforces.com/problemset?tags=dsu)
- [VNOJ ILSBIN](https://oj.vnoi.info/problem/ilsbin)
- [VOI 2011 Bài 6](https://oj.vnoi.info/problem/upgranet)
- [VOI 2020 Bài 2](https://oj.vnoi.info/problem/voi20bus)

## Kỹ thuật Gộp set
- [Codeforces 1380E](https://codeforces.com/problemset/problem/1380/E)
- [SGU 507](https://codeforces.com/problemsets/acmsguru/problem/99999/507)
- Các bài trong [phần DSU trên cây](#Kỹ-thuật-DSU-trên-cây)

## Kỹ thuật DSU trên cây
- [Codeforces 208E](https://codeforces.com/contest/208/problem/E)
- [Codeforecs 246E](https://codeforces.com/contest/246/problem/E)
- [Codeforces 600E](https://codeforces.com/problemset/problem/600/E)
- [Codeforces 570D](https://codeforces.com/contest/570/problem/D)
- [IOI 2011 - Race](https://oj.vnoi.info/problem/lqdrace)
', 'void make_set(int v) {
    parent[v] = v; // Tạo ra cây mới có gốc là đỉnh v
}

int find_set(int v) {
    if (v == parent[v])
        return v;               // Trả về đỉnh v nếu như đỉnh v là gốc của cây
    return find_set(parent[v]); // Đệ quy lên cha của đỉnh v
}

void union_sets(int a, int b) {
    a = find_set(a); // Tìm gốc của cây có chứa đỉnh a
    b = find_set(b); // Tìm gốc của cây có chứa đỉnh b
    if (a != b)
        parent[b] = a; // Gộp hai cây nếu như hai phần tử ở hai cây khác nhau
}', '2026-10-06T10:32:17.026174');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_array_vs_linked_list', 'Mảng và danh sách liên kết', 'data-structures', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/data-structures/array-vs-linked-lists.md', '["mảng và danh sách liên kết", "array vs linked list", "danh sách liên kết"]', 'Cấu trúc dữ liệu đơn giản nhất chính là các biến (variable). Chúng nắm giữ duy nhất một giá trị, hơn nữa, phạm vi sử dụng có giới hạn. Khi nhiều giá trị cần lưu trữ, [mảng](#mảng-arrays) (arrays) được sử dụng.', '# Mảng và danh sách liên kết

# Biến, con trỏ

Cấu trúc dữ liệu đơn giản nhất chính là các biến (variable). Chúng nắm giữ duy nhất một giá trị, hơn nữa, phạm vi sử dụng có giới hạn. Khi nhiều giá trị cần lưu trữ, [mảng](#mảng-arrays) (arrays) được sử dụng.

Một khái niệm hơi khó hơn mặc dù không kém phần căn bản là con trỏ (pointer). Con trỏ thay vì giữ một giá trị, nó lại giữ một địa chỉ vùng nhớ:

![](/uploads/algo/data-structures/array-vs-linked-lists/data_structures_basic_pointer.png)

Trong hình trên:

- `var` là một biến thông thường, có địa chỉ `1001` và giá trị `50`
- `ptr` là một biến kiểu con trỏ, có địa chỉ `2047` và giá trị `1001`. Giá trị của `ptr` là địa chỉ của biến `var`.


# Mảng (Arrays)

Mảng là một cấu trúc dữ liệu cực kỳ đơn giản và có thể xem như một danh sách với chiều dài cố định. Mảng là một cấu trúc dữ liệu “đẹp” bởi tính đơn giản của nó. Mảng đặc biệt thích hợp cho các tình huống mà ta biết trước được số lượng phần tử hoặc có thể xác định được khi chạy chương trình.

Giả sử bạn cần một đoạn mã để tính giá trị trung bình của một vài con số. Mảng là sự lựa chọn tuyệt vời để giữ các giá trị bởi yêu cầu bài toán không đòi hỏi một thứ tự lưu trữ cụ thể và các phép tính toán cũng không đòi hỏi gì khác ngoài việc duyệt qua toàn bộ các phần tử.

Một trong những sức mạnh khác của mảng chính là ta có thể truy cập các phần tử của mảng một cách ngẫu nhiên bằng chỉ số. Ví dụ như, bạn có một danh sách gồm tên của các học sinh trong lớp học. Mỗi học sinh đánh số từ 1 đến $n$. Khi đó để đọc hoặc lưu tên học sinh thứ $i$ bạn chỉ cần gọi tới `studentName[i]`. Do các phần tử của mảng ở vị trí liên tiếp nhau trong bộ nhớ máy tính, nên thao tác này chỉ mất độ phức tạp $\mathcal{O}(1)$. Tuy nhiên cũng vì lý do này, nên việc tăng kích thước mảng hay thêm / xóa 1 phần tử vào vị trí bất kỳ của mảng có độ phức tạp $\mathcal{O}(N)$.

Mảng có số lượng phần tử cố định, mỗi phần tử giữ của mảng một thông tin và ở một vị trí không đổi đã được định nghĩa trước đó.

## Tổng kết

- Bộ nhớ cố định, cần biết trước số phần tử
- Truy cập một vị trí bất kỳ: $\mathcal{O}(1)$.
- Thêm / xóa một phần tử: $\mathcal{O}(N)$.

## Mở rộng

Trong C++ STL, có CTDL `vector`, được gọi là mảng động. CTDL này cho phép thực hiện các thao tác:

- Truy cập một vị trí bất kỳ: $\mathcal{O}(1)$.
- Thêm / Xóa 1 phần tử vào cuối mảng: độ phức tạp trung bình: $\mathcal{O}(1)$.
- Thêm / xóa một phần tử bất kỳ: $\mathcal{O}(N)$.

Để làm được điều này, `vector` sử dụng kĩ thuật "nhân đôi mảng":

- Mảng của ta sẽ có thể cấp phát bộ nhớ tối đa là 2 lần chiều dài thật (số phần tử) của mảng.
- Nếu mảng vẫn chưa đầy (bộ nhớ cấp phát lớn hơn chiều dài thật của mảng), ta chỉ cần đơn giản là thêm phần tử mới vào cuối mảng.
- Nếu mảng đầy, ta làm như sau:
  - Cấp phát bộ nhớ mới bằng 2 lần chiều dài mảng
  - Copy mảng cũ qua bộ nhớ mới cấp phát. Như vậy ta có mảng mới với dữ liệu giống với mảng cũ, và còn dư ra chỗ trống ở cuối mảng mới.
  - Thêm phần tử mới vào cuối mảng mới.

Nếu ta thêm $N$ phần tử vào cuối mảng, thì độ phức tạp là:

- $\mathcal{O}(1 + 2 + 4 + 8 + 16 + \cdots)$ cho các thao tác cấp phát bộ nhớ
- $\mathcal{O}(1)$ cho việc ghi phần tử mới vào phần bộ nhớ trống.

Do đó độ phức tạp tổng không quá $\mathcal{O}(N)$, và độ phức tạp trung bình của 1 thao tác là $\mathcal{O}(1)$.


# Danh sách liên kết (Linked Lists)

Danh sách liên kết là một cấu trúc dữ liệu có thể giữ một số lượng phần tử tùy ý và dễ dàng thay đổi kích thước, cũng như dễ dàng bỏ đi các phần tử bên trong nó.

Danh sách liên kết, hiểu theo cách đơn giản nhất là một con trỏ trỏ tới một nút dữ liệu. Mỗi nút dữ liệu bao gồm dữ liệu cần chứa và một con trỏ trỏ tới nút tiếp theo. Tại điểm cuối cùng, con trỏ trỏ tới giá trị NULL.

![](/uploads/algo/data-structures/array-vs-linked-lists/data_structures_basic_linked_list.png)

Với thiết kế như ban đầu, một danh sách liên kết thích hợp để lưu trữ dữ liệu khi chưa biết trước được số lượng các phần tử hoặc các phần tử thường xuyên thay đổi. Tuy vậy, chúng ta không thể truy cập một cách ngẫu nhiên các phần tử của danh sách liên kết. Để tìm kiếm một giá trị, ta phải bắt đầu tại phần tử đầu tiên và duyệt tuần tự qua các phần tử cho tới khi bắt gặp được giá trị mà mình cần tìm kiếm. Để chèn một nút vào danh sách liên kết, bạn cũng phải thực hiện tương tự. Độ phức tạp của cả 2 thao tác này là $\mathcal{O}(N)$. Tuy nhiên, nếu ta biết được con trỏ trỏ đến phần tử cần xóa, thì độ phức tạp chỉ là $\mathcal{O}(1)$. Dễ dàng nhận thấy, thao tác tìm kiếm và chèn trong danh sách liên kết không thật sự hiệu quả.

Sau đây là cài đặt kiểu dữ liệu danh sách liên kết thông thường:

```cpp
struct ListNode {
    int data;           // dữ liệu được lưu ở nút của linked list
    ListNode *nextNode; // con trỏ trỏ tới phần tử tiếp theo của linked list.
};
ListNode *firstNode;
```

Bạn có thể chèn một nút mới vào bằng cách chèn chúng vào đầu danh sách. Thao tác này có độ phức tạp là $\mathcal{O}(1)$.

```cpp
ListNode *newNode = new ListNode();
newNode->nextNode = firstNode;
firstNode = newNode;
```

Duyệt qua toàn bộ danh sách liên kết rất đơn giản như sau:

```cpp
ListNode *curNode = firstNode;
while (curNode != NULL) {
    cout << curNode->data << endl;
    curNode = curNode->nextNode;
}
```

Ngoài ra, ta cũng có thể lưu thêm con trỏ trỏ vào phần tử cuối của danh sách. Khi đó độ phức tạp để thêm 1 phần tử vào cuối danh sách là $\mathcal{O}(1)$.

## Tổng kết

- Thêm / xóa 1 phần tử mới vào đầu / cuối: $\mathcal{O}(1)$
- Truy cập 1 phần tử ở vị trí bất kỳ: $\mathcal{O}(N)$.


# Tài liệu tham khảo

- [Topcoder](https://www.topcoder.com/community/data-science/data-science-tutorials/data-structures/)
- [Wikipedia](https://en.wikipedia.org/wiki/Linked_list)
', 'struct ListNode {
    int data;           // dữ liệu được lưu ở nút của linked list
    ListNode *nextNode; // con trỏ trỏ tới phần tử tiếp theo của linked list.
};
ListNode *firstNode;', '2026-10-06T10:32:17.539776');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_dp_basic_1', 'Quy hoạch động cơ bản (Phần 1)', 'dp', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/dp/basic-dynamic-programming-1.md', '["quy hoạch động cơ bản", "dynamic programming", "công thức truy hồi", "bài toán con"]', 'Bài viết có tham khảo và bổ sung, chỉnh sửa từ [TopCoder](https://www.topcoder.com/thrive/articles/Dynamic%20Programming:%20From%20Novice%20to%20Advanced) và một số nguồn khác.', '# Quy hoạch động cơ bản (Phần 1)

Bài viết có tham khảo và bổ sung, chỉnh sửa từ [TopCoder](https://www.topcoder.com/thrive/articles/Dynamic%20Programming:%20From%20Novice%20to%20Advanced) và một số nguồn khác.

**Người viết:** Nguyễn Anh Bảo - Đại học Bách Khoa Hà Nội

**Reviewer:**
* Hồ Ngọc Vĩnh Phát - Đại học Khoa học Tự nhiên, ĐHQG-HCM
* Ngô Nhật Quang - Trường THPT chuyên Khoa học Tự Nhiên, ĐHQGHN


# Giới thiệu
__Quy hoạch động (QHĐ) (Dynamic Programming)__ là một trong những kĩ thuật quan trọng và cơ bản nhất trong lập trình thi đấu. Bài viết này sẽ trình bày và giải thích các khái niệm liên quan đến quy hoạch động đồng thời đưa ra các ví dụ minh họa.

# Beginner

Để mở đầu, ta xét ví dụ sau:

## Ví dụ 1

> *Bạn An có $n$ chiếc ghế màu trắng, $n$ chiếc ghế màu đen và $n$ chiếc ghế màu đỏ. An muốn chọn ra $n$ chiếc ghế để xếp thành một hàng ngang. Do An không thích màu đỏ nên An không muốn xếp hai chiếc ghế đỏ cạnh nhau. Tính số cách xếp ghế thỏa mãn điều kiện đó.*
> **Điều kiện:** $1\le n\le 10^{5}$.

***Lưu ý**: hai cách xếp được xem là khác nhau khi tồn tại một vị trí mà hai cách có hai loại ghế khác nhau.*

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img1.png)

Bây giờ ta sẽ xây dựng thuật giải:

### Thuật toán đệ quy

Gọi số cách xếp $i$ cái ghế là $f[i]$. Ta xét chiếc ghế thứ $n$.
* Nếu nó có màu đen hoặc trắng thì chiếc ghế cạnh nó có thể có một trong ba màu. Do đó ta chỉ cần bố trí $n-1$ chiếc ghế còn lại thỏa mãn yêu cầu. Do có 2 cách chọn màu cho ghế thứ $n$ và $f[n-1]$ cách chọn màu cho các ghế còn lại nên số cách xếp trong trường hợp này là $2 \times f[n-1]$.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img2.png)

* Nếu nó có màu đỏ thì chiếc ghế cạnh nó chỉ có thể có màu trắng hoặc đen. Do vậy nên chiếc ghế thứ $n-2$ có thể có một trong ba màu. Khi đó ta cũng chỉ cần bố trí $n-2$ chiếc ghế còn lại thỏa mãn yêu cầu. Số cách xếp trong trường hợp này là $1 \times 2 \times f[n-2]$.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img3.png)

Với ý tưởng trên, ta có thể giải bài toán này như các bài toán đệ quy đơn giản. Cài đặt như sau:

```cpp
// Tính số cách sắp xếp n cái ghế
int solve(int n) {
    // Trường hợp cơ bản
    if (n == 1)
        return 3;
    if (n == 2)
        return 8;
    // Bước đệ quy
    return 2 * solve(n - 1) + 2 * solve(n - 2);
}
```
Thuật toán trên có độ phức tạp lũy thừa nên chỉ áp dụng được với $n$ nhỏ $(n < 45)$, không đủ nhanh so với yêu cầu bài toán.

### Tối ưu thuật toán đệ quy

Thuật toán trên chạy chậm vì một số hàm ```solve(i)``` được gọi rất nhiều lần. Ta lấy ví dụ sau:

Giả sử cần tính `solve(1000)`. Khi đó cần tính `solve(999)` và `solve(998)`.

Để tính `solve(999)` cần gọi hàm `solve(998)` và `solve(997)`.
Để tính `solve(998)` cần gọi hàm `solve(997)` và `solve(996)`.
Để tính `solve(997)` cần gọi hàm `solve(996)` và `solve(995)`.
$\ldots$
Ta có thể biểu diễn các hàm được gọi bằng một sơ đồ như sau:

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img4.png)

Từ sơ đồ trên ta thấy có nhiều hàm bị gọi rất nhiều lần một cách không cần thiết:
* `solve(998)` được gọi $2$ lần
* `solve(997)` được gọi $3$ lần
* `solve(996)` được gọi $5$ lần
* $\ldots$

Để khắc phục điều này ta có thể sử dụng một mảng nhớ $d$ sao cho $d[i]$ là giá trị của `solve(i)`:

```cpp
int d[100010];

int solve(int n) {
    if (n == 1)
        return 3;
    else if (n == 2)
        return 8;
    else if (d[n] != 0)
        return d[n];
    else {
        d[n] = 2 * solve(n - 1) + 2 * solve(n - 2);
        return d[n];
    }
}
```
Thuật toán trên có độ phức tạp $\mathcal{O}(n)$.

Với cách tiếp cận trên, ta quan tâm đến giá trị cuối cùng $f[n]$, sau đó mới xem xét những giá trị bé hơn cần thiết cho tính toán.

Nhưng với phương pháp quy hoạch động, ta sẽ quan tâm đến các bài toán với tham số nhỏ hơn trước tiên.

## Phương pháp tiếp cận

### Khi nào có thể áp dụng QHĐ

Quy hoạch động được sử dụng khi ta tìm được công thức liên hệ giữa kết quả bài toán có đầu vào cho trước với một (hoặc một số) bài toán con tương tự nhưng có đầu vào nhỏ hơn. Khi ta biết được một số trạng thái bắt đầu của bài toán, nói cách khác - bài toán con với những đầu vào rất nhỏ, ta có thể sử dụng QHĐ để tính ra kết quả cuối cùng.

### Trạng thái của bài toán là gì?

Trạng thái là một trường hợp, một bài toán con của bài toán lớn với tham số cho trước.

Ví dụ, trạng thái trong bài này là số cách sắp xếp $n$ chiếc ghế thỏa mãn không có hai ghế đỏ cạnh nhau.

### Liên hệ giữa các trạng thái

Để giải bài toán quy hoạch động, điều quan trọng nhất là tìm ra mối liên hệ giữa một trạng thái và các trạng thái có tham số nhỏ hơn.

Gọi $f[i]$ là cách sắp xếp $i$ chiếc ghế thành một hàng dọc. Khi đó ta có:
$$
\begin{cases}
f[1] = 3; f[2] = 8 \\
f[i] = 2f[i - 1] + 2f[i - 2], \forall i=3;4;\ldots;n(*)
\end{cases}
$$
Công thức $(*)$ được gọi là **công thức truy hồi**.

### Tìm kết quả cuối cùng

Sau khi đã biết công thức truy hồi và tính được $f[1]$, $f[2]$, ta có thể tìm $f[n]$.

### Code mẫu:
```cpp
#include <iostream>
using namespace std;

long long n, f[100010];

int main() {
    cin >> n;
    f[1] = 3;
    f[2] = 8;
    for (int i = 3; i <= n; i++)
        f[i] = 2 * f[i - 1] + 2 * f[i - 2];
    cout << f[n];
    return 0;
}
```
Độ phức tạp của thuật toán trên là $\mathcal{O}(n)$, nhưng cách thực hiện đơn giản hơn đệ quy có nhớ.

**Phân tích:** Từ ví dụ trên, ta thấy phương pháp QHĐ được triển khai theo các bước sau:
* Xác định trạng thái của bài toán
* Tìm mối liên hệ giữa các trạng thái (tìm **công thức truy hồi**)
* Khởi tạo các giá trị ban đầu và cài đặt công thức truy hồi

Ta tiếp tục với ví dụ tiếp theo:

## Ví dụ 2

> *Cho $N$ loại đồng xu và giá tiền của mỗi loại là các số nguyên $v_1,v_2,\ldots,v_n$, và số nguyên dương $S$. Tìm số đồng xu nhỏ nhất để tổng giá trị của chúng bằng $S$ (số lượng đồng xu không giới hạn), nếu không tồn tại một số đồng xu có tổng là $S$ thì in ra $-1$.*
> **Điều kiện:** $1\le S,N\le1000$ và $1\le v_1,v_2,\dots,v_n\le S$.

Ta xây dựng thuật toán QHĐ:

Trạng thái của bài toán là số đồng xu nhỏ nhất có tổng giá tiền là $i$. Ta sẽ dùng mảng $f[i]$ để lưu số đồng xu ít nhất có tổng giá trị là $i$, nếu không tồn tại các đồng xu có tổng là $i$ thì gán $f[i] = -1$.

Cần một công thức truy hồi để tính $f[i]$ theo $f[1],f[2],\ldots,f[i-1]$.

Để ý thấy với $i$ bất kì, nếu có một đồng xu giá trị $v_j \le i$ thì ta có thể thêm đồng đó vào các đồng có tổng giá trị là $i-v_j$. Giả sử $m$ là số đồng xu ít nhất có tổng là $i-v_j$, khi đó có $m+1$ đồng xu có tổng giá trị $i$. Nếu $f[i] = -1$ thì ta cập nhật $f[i] = m + 1$, nếu $f[i] \ne -1$ thì $f[i]=\min(f[i], m+1)$.

Sau đây là ví dụ: ***Cho các đồng xu với giá tiền $1,3,5$. Và $S = 11$.***

Đầu tiên, ta bắt đầu từ trạng thái cơ bản nhất: $f[0]=0$.

Xét đến tổng $1$. Có duy nhất đồng xu $1$ nhỏ hơn hoặc bằng tổng $1$, nên ta có $f[1]=f[1 - v_1]+1=f[0]+1=1$.

Xét đến tổng $2$. Cũng giống như tổng trước, chỉ có $1$ đổng xu không vượt quá $2$, suy ra $f[2]=f[2 - v_1]+1=f[1]+1=2$.

Đến tổng $3$. Lần này có hai đồng xu không vượt quá $3$ là $1$ và $3$. Nếu ta chọn đồng $1$, ta có $f[3]=f[3 - v_1]+1=f[2]+1=3$; nếu ta chọn đồng $3$, ta có $f[3]=f[3 - v_2]+1=f[0]+1=1$. Rõ ràng $1 \le 3$ nên ta chọn đồng $3$ và $f[3]=1$.

Xét tiếp đến tổng $4,$ tổng $5,\ldots$ đến $11$ bằng cách như trên.

Đây là lời giải cho tất cả các tổng:

Tổng    |    Lượng xu nhỏ nhất    |    Xu được chọn<br>(Tổng còn lại)
--------|-------------------------|----------------
$0$|$0$|-
$1$|$1$|$1 (0)$
$2$|$2$|$1 (1)$
$3$|$1$|$3 (0)$
$4$|$2$|$1 (3)$
$5$|$1$|$5 (0)$
$6$|$2$|$3 (3)$
$7$|$3$|$1 (6)$
$8$|$2$|$3 (5)$
$9$|$3$|$1 (8)$
$10$|$2$|$5 (5)$
$11$|$3$|$1 (10)$

### Code tham khảo:
```cpp
#include <iostream>
using namespace std;

const int N = 1e3 + 10;
int f[N], v[N], n, S;
// Gán f[i] = -1 nếu không thể tìm được một số đồng xu tổng bằng i

int main() {
    cin >> n >> S;
    for (int i = 1; i <= n; i++)
        cin >> v[i];

    for (int i = 1; i <= S; i++)
        f[i] = -1;

    for (int i = 1; i <= S; i++)
        for (int j = 1; j <= n; j++)
            if (v[j] <= i && f[i - v[j]] != -1) {
                if (f[i] != -1)
                    f[i] = min(f[i], f[i - v[j]] + 1);
                else
                    f[i] = f[i - v[j]] + 1;
            }
    cout << f[S];
}
```
**Nhận xét:** Đôi khi, trạng thái trong bài QHĐ chính là yêu cầu của bài toán.

## Tìm độ dài dãy con không giảm dài nhất

Phần này giới thiệu một lớp bài toán QHĐ điển hình. Ta bắt đầu bằng bài toán sau:

> *Cho dãy số nguyên dương $a_1,a_2,\ldots,a_n$. Tìm độ dài của dãy con không giảm dài nhất của dãy.
> Dãy con của một dãy là dãy số thu được bằng cách bỏ đi một số phần tử của dãy ban đầu.*
> **Điều kiện:** $1\le n\le 1000$ và $1\le a_1,a_2,\dots,a_n\le 10^{9}$.

Đầu tiên cần xác định trạng thái của bài toán.

Ta đặt $f[i]$ là độ dài của dãy con không giảm dài nhất kết thúc ở $a_i$. $f[i]$ là trạng thái của bài toán. Ta khởi tạo $f[i] = 1$ ($a_i$ là một dãy không giảm).

Với $j<i$ mà $a_j \le a_i$ thì ta có thể thêm $a_i$ vào dãy không giảm kết thúc ở $a_j$, do đó nếu $f[j] + 1$ lớn hơn giá trị hiện tại của $f[i]$ thì ta cập nhật $f[i] = f[j] + 1$.

Cuối cùng để tìm được độ dài dãy con không giảm dài nhất ta tính $\max  (f[1],f[2],\ldots,f[n])$.

### Code tham khảo

```cpp
#include <iostream>
using namespace std;

const int N = 1e3 + 10;
int f[N], a[N], n;

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++)
        cin >> a[i];
    for (int i = 1; i <= n; i++)
        f[i] = 1;
    for (int i = 2; i <= n; i++)
        for (int j = 1; j < i; j++)
            if (a[j] <= a[i])
                f[i] = max(f[i], f[j] + 1);
    int mx = f[1];
    for (int i = 2; i <= n; i++)
        mx = max(mx, f[i]);
    cout << mx;
}
```

**Ví dụ minh họa:**

$i$|$1$ | $2$| $3$| $4$| $5$|
:-:|:-:|:-:|:-:|:-:|:-:|
$a[i]$|$1$|$4$|$2$|$3$|$7$|
$f[i]$|$1$|$f[1]+1=2$|$f[1]+1=2$|$f[3]+1=3$|$f[4]+1=4$

**Nhận xét:** Một số bài QHĐ có trạng thái là yêu cầu bài toán với $i$ phần tử đầu tiên của dãy số.

Bài toán tìm dãy con không giảm dài nhất là một ví dụ điển hình của phương pháp QHĐ. Một số biến thể của bài toán này tạo thành một lớp các bài toán tương tự nhau. Các bài toán đó có một số tính chất đặc trưng sau:

* Mỗi phần tử $a_i$ xuất hiện tối đa một lần trong dãy con. Vì vậy ta sẽ dùng vòng `For` duyệt qua các phần tử $a_i$ trong dãy.
* Thứ tự của các phần tử được chọn phải được giữ nguyên so với dãy ban đầu.

Một số biến thể:
### Tìm dãy con không giảm dài nhất

Bài toán giống ví dụ 3, nhưng yêu cầu in ra dãy con đó. Ta có thể làm tương tự như trên, nhưng thêm mảng truy vết $d[i]$ lưu vị trí $j<i$ mà $f[i]=f[j]+1$. Ta có thể cài đặt như sau:

```cpp
#include <iostream>
#include <vector>
using namespace std;

const int N = 1e3 + 10;
int f[N], a[N], d[N], n;

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++)
        cin >> a[i];
    // Bước QHĐ
    for (int i = 1; i <= n; i++) {
        f[i] = 1;
        for (int j = 1; j < i; j++)
            if (a[j] <= a[i] && f[i] < f[j] + 1) {
                f[i] = f[j] + 1;
                d[i] = j;
            }
    }
    // Tìm t là vị trí cuối cùng của dãy dài nhất
    int t = 1;
    for (int i = 1; i <= n; i++)
        if (f[i] > f[t])
            t = i;
    // In ra dãy con đó
    vector<int> seq;
    while (t) {
        seq.push_back(a[t]);
        t = d[t];
    }
    for (auto i = seq.rbegin(); i != seq.rend(); i++)
        cout << (*i) << '' '';
}
```
### Bố trí phòng họp (mất tính thứ tự so với dãy ban đầu)

> *Có $n$ cuộc họp, cuộc họp thứ $i$ bắt đầu vào thời điểm $A_i$ và kết thúc ở thời điểm $B_i$. Do chỉ có một phòng hội thảo nên 2 cuộc họp bất kì sẽ được cùng bố trí phục vụ nếu khoảng thời gian làm việc của chúng chỉ giao nhau tại đầu mút hoặc không giao nhau. Hãy bố trí phòng họp để phục vụ được nhiều cuộc họp nhất.*
> **Điều kiện:** $1\le n\le1000$ và $1\le A_i\le B_i\le10^{9}$ với mọi $i=1;2;\dots;n$.
> **Input:** Số nguyên $n$ và $n$ dòng tiếp theo có dòng thứ $i$ là thời điểm bắt đầu $A_i$ và kết thúc $B_i$ của cuộc họp thứ $i$.
> **Output:** một dòng gồm số thứ tự ban đầu của các cuộc họp được bố trí, theo thứ tự thời gian.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img5.png)
**Hướng dẫn**:

Sắp xếp các cuộc họp tăng dần theo thời điểm bắt đầu $A_i$. Thế thì cuộc họp $i$ sẽ bố trí được sau cuộc họp $j$ khi và chỉ khi $j<i$ và $B_j \le A_i$. Yêu cầu bố trí được nhiều cuộc họp nhất có thể đưa về việc tìm dãy các cuộc họp dài nhất thoả mãn điều kiện trên.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img6.png)

```cpp
#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

struct Meeting {
    Meeting(int aa = 1, int bb = 1, int nn = 1)
        : a(aa), b(bb), num(nn) {};
    int a;   // Thời điểm bắt đầu cuộc họp
    int b;   // Thời điểm kết thúc cuộc họp
    int num; // Số thứ tự của cuộc họp
};

const int N = 1e3 + 10;
int n, f[N], d[N];
Meeting m[N];

// Hàm so sánh để sắp xếp
bool compare(const Meeting &x, const Meeting &y) {
    return x.a < y.a || (x.a == y.a && x.b < y.b);
}

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++) {
        m[i].num = i;
        cin >> m[i].a >> m[i].b;
    }
    sort(m + 1, m + n + 1, compare);
    // Bước quy hoạch động
    for (int i = 1; i <= n; i++) {
        f[i] = 1;
        for (int j = 1; j < i; j++)
            if (m[j].b <= m[i].a && f[i] < f[j] + 1) {
                f[i] = f[j] + 1;
                d[i] = j;
            }
    }
    // Truy vết
    int t = 1;
    for (int i = 1; i <= n; i++)
        if (f[i] > f[t])
            t = i;
    vector<int> seq;
    while (t) {
        seq.push_back(m[t].num);
        t = d[t];
    }
    for (auto i = seq.rbegin(); i != seq.rend(); i++)
        cout << (*i) << '' '';
}
```


### Cho thuê máy

> *Trung tâm tính toán hiệu năng cao nhận được đơn đặt hàng của $n$ khách hàng. Khách hàng $i$ muốn sử dụng máy trong khoảng thời gian từ $a_i$ đến $b_i$ và trả tiền thuê là $c_i$. Hãy bố trí lịch thuê máy để tổng số tiền thu được là lớn nhất mà thời gian sử dụng máy của 2 khách hàng bất kì được phục vụ đều không giao nhau (cả trung tâm chỉ có một máy cho thuê).*
> **Điều kiện:** $1\le n\le1000$ và $1\le A_i\le B_i\le10^{9}, 1\le c_i\le10^{6}$ với mọi $i=1;2;\dots;n$.

**Hướng dẫn**:

Tương tự như bài toán bố trí phòng họp, nếu sắp xếp các đơn đặt hàng theo thời điểm bắt đầu, ta sẽ đưa được về bài toán **tìm dãy con có tổng lớn nhất**. Bài toán này là biến thể của bài toán tìm dãy con tăng dài nhất, ta có thể cài đặt bằng đoạn chương trình như sau:

```cpp
#include <bits/stdc++.h>
using namespace std;

struct Value {
    Value(int aa = 1, int bb = 1, int cc = 1, int nn = 1)
        : a(aa), b(bb), c(cc), num(nn) {};
    int a;   // Thời điểm bắt đầu thuê
    int b;   // Thời điểm kết thúc thuê
    int c;   // Tiền thuê
    int num; // Số thứ tự
};

const int N = 1e3 + 10;
int n, f[N], d[N];
Value m[N];

bool compare(const Value &x, const Value &y) {
    return x.a < y.a || (x.a == y.a && x.b < y.b);
}
int main() {
    // ...
    sort(m + 1, m + n + 1, compare);
    // Bước quy hoạch động
    for (int i = 1; i <= n; i++) {
        f[i] = m[i].c;
        for (int j = 1; j < i; j++)
            if (m[j].b <= m[i].a && f[i] < f[j] + m[i].c) {
                f[i] = f[j] + m[i].c;
                d[i] = j;
            }
    }
    // ... truy vết
}
```

### Dãy tam giác bao nhau

> *Cho $n$ tam giác trên mặt phẳng. Tam giác $i$ bao tam giác $j$ nếu 3 đỉnh của tam giác $j$ đều nằm trong tam giác $i$ (có thể nằm trên cạnh). Hãy tìm dãy tam giác bao nhau có nhiều tam giác nhất.*
> **Điều kiện:** $1\le n\le 1000$ và tọa độ các đỉnh của các tam giác thuộc đoạn ${-10}^{6}$ đến $10^{6}$.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img7.png)

**Hướng dẫn**:

Sắp xếp các tam giác tăng dần về diện tích. Khi đó tam giác $i$ sẽ bao tam giác $j$ nếu $j<i$ và 3 đỉnh của $j$ nằm trong $i$. Từ đó có thể đưa về bài toán tìm dãy “tăng” dài nhất.

Bài toán có một số biến thể khác như tìm dãy hình tam giác, hình chữ nhật… bao nhau có tổng diện tích lớn nhất.

Việc kiểm tra điểm $M$ có nằm trong tam giác $ABC$ không có thể dựa trên 2 phương pháp sau:

* Tính diện tích: điểm $M$ nằm trong nếu $S(ABC) = S(ABM) + S(ACM) + S(BCM)$.
* Kẻ một tia song song $Ox$ từ $M$ và đếm số giao điểm với $3$ đoạn $AB,BC,CA$. Nếu số giao điểm là số lẻ thì $M$ nằm trong tam giác.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img8.png)

### Dãy đổi dấu

> *Cho dãy số nguyên gồm $n$ phần tử $a_1, a_2,\ldots, a_n$ và các số nguyên dương $L,U$. Hãy tìm dãy con đổi dấu dài nhất của dãy đó.*
> Dãy con của dãy $a$ là dãy thu được bằng cách xóa đi một số phần tử của $a$.
> **Điều kiện:** $1\le L\le n\le1000, 1\le U\le10^{9}$ và $1\le a_1, a_2,\dots, a_n\le10^{9}$.

Dãy con đổi dấu $a_{i_1},a_{i_2},\ldots, a_{i_k}$ phải thoả mãn các điều kiện sau:

- $A_{i_1} < A_{i_2} > A_{i_3} <\ldots$ hoặc $A_{i_1} > A_{i_2} < A_{i_3} >\ldots$
- Các chỉ số phải cách nhau ít nhất $L: i_2 - i_1 \ge L, i_3 - i_2 \ge L, \ldots$
- Chênh lệch giữa 2 phần tử liên tiếp không vượt quá $U:$ $\|A_{i1} - A_{i2}\| \le U,$ $\|A_{i2} - A_{i3}\| \le U, \ldots$

**Hướng dẫn**:

Gọi $Q[i]$ là số phần tử của dãy con đổi dấu có phần tử cuối cùng là $a_i$ và phần tử cuối cùng lớn hơn phần tử đứng trước. Tương tự, $P[i]$ là số phần tử của dãy con đổi dấu có phần tử cuối cùng là $a_i$ và phần tử cuối cùng nhỏ hơn phần tử đứng trước.

Ta dễ dàng suy ra:
- $Q[i] = \max  (1, P[j] + 1)$, với mọi $j$ thỏa mãn: $j \le i-L$ và $A_i - U \le A_j < A_i$.
- $P[i] = \max  (1, Q[j] + 1)$, với mọi $j$ thỏa mãn: $j \le i-L$ và $A_i < A_j \le A_i + U$.

```cpp
#include <iostream>
using namespace std;

const int N = 1e3 + 10;
int a[N], P[N], Q[N], n, U, L;

int main() {
    cin >> n >> U >> L;
    for (int i = 1; i <= n; i++)
        cin >> a[i];
    for (int i = 1; i <= n; i++) {
        P[i] = 1;
        Q[i] = 1;
        for (int j = 1; j <= i - L; j++) {
            if (a[i] - U <= a[j] && a[j] < a[i])
                Q[i] = max(Q[i], P[j] + 1);
            if (a[j] > a[i] && a[j] <= a[i] + U)
                P[i] = max(P[i], Q[j] + 1);
        }
    }
    int mx = Q[1];
    for (int i = 1; i <= n; i++)
        mx = max(mx, max(P[i], Q[i]));
    cout << mx;
}
```

### Dãy số WAVIO

> *Dãy số nguyên $a_1,a_2,a_3,\ldots,a_k$ được gọi là dãy số WAVIO nếu tồn tại số tự nhiên $1\le m\le k$ sao cho:*
> * $a_1\le a_2 \le \ldots \le a_m$
> * $a_k\le a_{k-1} \le \ldots \le a_m$
>
> *Ví dụ dãy số `1 2 3 4 5 2 1` là 1 dãy WAVIO độ dài 7. Cho dãy $a$ gồm $n$ số nguyên, hãy chỉ ra một dãy con Wavio có độ dài lớn nhất trích ra từ dãy đó.*
> **Điều kiện:** $1\le n\le 1000$ và $1\le a_1,a_2,\ldots,a_n\le10^{9}$ với mọi $i=1;2;\ldots;n$.

**Hướng dẫn**:

Ta sẽ quy hoạch động theo phần tử $a_m$ của dãy WAVIO như sau:

* $Q[i]$ là độ dài của dãy con tăng dần dài nhất kết thúc ở $i$
* $P[i]$ là độ dài của dãy con giảm dần dài nhất bắt đầu ở $i$

Khi đó, trong các dãy WAVIO có $i$ là đỉnh thì dãy dài nhất sẽ có độ dài $Q[i]+P[i]-1$. Đến đây, chỉ cần tìm $\max(Q[i]+P[i]-1)$.

# Intermediate

Ở mục này, chúng ta sẽ làm quen với QHĐ hai chiều, ta bắt đầu bằng ví dụ sau:

> *Cho một bảng ô vuông gồm $m$ hàng và $n$ cột. Kí hiệu $(i, j)$ là ô ở hàng $i$, cột $j$. Giả sử $(i, j)$ có $a_{i,j}$ quả táo. Bạn An muốn đi từ $(1, 1)$ đến $(m, n)$. Ở mỗi bước, An đi sang phải hoặc xuống dưới đúng một ô. Khi An ở ô $(i, j)$, An có thể lấy hết các quả táo ở ô đó. Tính số quả táo nhiều nhất mà An có thể lấy được.*
> **Điều kiện:** $1\le mn\le10^{6}$ và $1\le a_{i, j}\le 10^{9}$ với mọi $i,j$.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img9.png)

**Ý tưởng:**

Bài toán này cũng tương tự như các ví dụ trước.

Đầu tiên, trạng thái của bài toán chính là số quả táo nhiều nhất An có thể lấy khi đi từ ô $(1,1)$ đến ô $(i,j)$, gọi là $f[i][j]$.

Đầu tiên ta khởi tạo $f[1][1] = a_{1,1}$.

<!--![Minh họa](/uploads/algo/dp/basic-dynamic-programming-1/table2.png)-->

Với mọi $i,j\ge 2$, để đi từ $(1, 1)$ đến $(i, j)$ An có hai lựa chọn: đi qua $(i - 1, j)$ hoặc đi qua $(i, j - 1)$. An sẽ chọn đường đi thu được nhiều táo nhất, do đó $f[i][j] = a_{i, j} + \max(f[i][j - 1], f[i - 1][j])$.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img10.png)

```cpp
#include <iostream>
using namespace std;

const int N = 1e3 + 10;
int m, n, a[N][N];
long long f[N][N];

int main() {
    cin >> n >> m;
    for (int i = 1; i <= m; i++)
        for (int j = 1; j <= n; j++)
            cin >> a[i][j];
    for (int i = 1; i <= m; i++)
        for (int j = 1; j <= n; j++)
            f[i][j] = max(f[i - 1][j], f[i][j - 1]) + a[i][j];
    cout << f[m][n];
}
```

### Ví dụ khác

[AvoidRoads](https://community.topcoder.com/tc?module=ProblemDetail&rd=4709&pm=1889) - 2003 TCO Semifinals 4
[ChessMetrics](https://community.topcoder.com/tc?module=ProblemDetail&rd=4482&pm=1592) - 2003 TCCC Round 4

QHĐ hai chiều được áp dụng nhiều trong những bài toán phức tạp hơn. Tiêu biểu là lớp bài toán xếp đồ.

## Xếp vali (Knapsack)

## Mô hình

Có $n$ đồ vật, vật thứ $i$ có trọng lượng $A_i$ và giá trị $B_i$. Hãy chọn ra một số các đồ vật, mỗi vật một cái để xếp vào 1 vali có trọng lượng tối đa $W$ sao cho tổng giá trị của vali là lớn nhất.

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img11.png)

## Công thức

Trạng thái bài toán: tổng giá trị lớn nhất của vali nếu khối lượng không vượt quá $i$.

**Nhận xét:** giá trị của vali phụ thuộc vào 2 yếu tố: có bao nhiêu vật đang được xét và trọng lượng của các vật. Do đó bảng phương án sẽ là bảng 2 chiều:

* $L[i,j]$: tổng giá trị lớn nhất của vali khi xét từ vật 1 đến vật $i$ và trọng lượng của vali chưa vượt quá $j$. Chú ý rằng khi xét đến $L[i,j]$ thì các giá trị trên bảng phương án đều đã được tối ưu.

Tính $L[i,j]$: vật đang xét là $A_i$ với trọng lượng của vali không được quá $j$. Có 2 khả năng xảy ra:

- Nếu chọn $A_i$ đưa vào vali, trọng lượng vali trước đó phải không quá $j - A_i$. Vì mỗi vật chỉ được chọn 1 lần nên giá trị lớn nhất của vali lúc đó là $L[i-1, j - A_i] + B_i$.
- Nếu không chọn $A_i$, trọng lượng của vali là như cũ (như lúc trước khi chọn $A_i$): $L[i-1,j]$.

Tóm lại ta có $L[i,j] = \max(L[i-1, j - A_i] + B_i, L[i-1, j])$.

## 2.3. Cài đặt

```cpp
long long L[1010][1010];

for (int i = 1; i <= n; i++)
    for (int j = 1; j <= W; j++)
        if (A[i] <= j)
            L[i][j] = max(L[i - 1][j - A[i]] + B[i], L[i - 1][j]);
        else
            L[i][j] = L[i - 1][j];
```

## 2.4. Một số bài toán khác

### Dãy con có tổng bằng S

> *Cho dãy $A_1,A_2,\ldots, A_N$. Tìm một dãy con của dãy đó có tổng bằng $S$.*
> **Điều kiện:** $1\le n\le 1000$ và $1\le A_1,A_2,\ldots,A_n\le10^{9}$.

**Hướng dẫn**:

Đặt $L[i,t]=1$ nếu có thể tạo ra tổng $t$ từ một dãy con của dãy gồm các phần tử $A_1,A_2,\ldots,A_i$. Ngược lại thì $L[i,t]=0$. Nếu $L[n,S]=1$ thì đáp án của bài toán trên là “có”.

Ta có thể tính $L[i,t]$ theo công thức: $L[i,t]=1$ nếu $L[i-1,t]=1$ hoặc $L[i-1,t-a[i]]=1$.

**Cài đặt**:

Nếu áp dụng luôn công thức trên thì ta cần dùng bảng phương án hai chiều. Ta có thể nhận xét rằng để tính dòng thứ $i$, ta chỉ cần dòng $i-1$. Bảng phương án khi đó chỉ cần 1 mảng 1 chiều $L[0\ldots S]$ và được tính như sau:


```cpp
long long L[1010];

L[0] = 1;
for (int i = 1; i <= n; i++)
    for (int t = S; t >= a[i]; t--)
        if (L[t - a[i]] == 1)
            L[t] = 1;
```

Dễ thấy độ phức tạp bộ nhớ của cách cài đặt trên là $\mathcal{O}(m)$, độ phức tạp thời gian là $\mathcal{O}(nm)$, với $m$ là tổng của $n$ số.

**Bonus:** Hãy thử kiểm tra xem vì sao trong vòng ```for``` thứ hai, $t$ được duyệt từ $S$ về $a[i]$ chứ không phải từ $a[i]$ lên $S$.

### Chia kẹo

> *Cho $n$ gói kẹo, gói thứ $i$ có $a_i$ viên. Hãy chia các gói thành 2 phần sao cho chênh lệch giữa 2 phần là ít nhất.*
> **Điều kiện:** $1\le n\le 300$ và $1\le a_1,a_2,\ldots,a_n\le1000$.

**Hướng dẫn**:

Gọi $T$ là tổng số kẹo của $n$ gói. Chúng ta cần tìm số $S$ lớn nhất thoả mãn:

- $S \le \frac{T}{2}$.
- Có một dãy con của dãy $a$ có tổng bằng $S$.

Khi đó sẽ có cách chia với chênh lệch 2 phần là $T-2S$ là nhỏ nhất và dãy con có tổng bằng $S$ ở trên gồm các phần tử là các gói kẹo thuộc phần thứ nhất. Phần thứ hai là các gói kẹo còn lại. Ta quy hoạch động mảng $L[i,j]$ $(j\le \frac{T}{2})$ như sau: $L[i,j]=\texttt{true}$ nếu tồn tại một số phần tử của dãy $a$ từ $1$ đến $i$ có tổng bằng $j$. Khi đó:
* Nếu $L[i-1,j]=\texttt{true}$ thì $L[i,j] = \texttt{true}$.
* Nếu $L[i-1,j-a[i]]=\texttt{true}$ thì $L[i,j] = \texttt{true}$.

Cuối cùng, ta cần tìm số $j$ lớn nhất không vượt quá $\frac{T}{2}$ sao cho tồn tại số nguyên dương $i$ để $L[i,j]=\texttt{true}$, hay $L[n,j]=\texttt{true}$.
```cpp
#include <iostream>
using namespace std;

const int N = 310;
int n, a[N];
bool L[N][N];

int main() {
    cin >> n;
    int t = 0;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        t += a[i];
    }
    for (int i = 0; i <= n; i++)
        L[i][0] = true;
    for (int i = 1; i <= n; i++)
        for (int j = 1; 2 * j <= t; j++) {
            L[i][j] |= L[i - 1][j];
            if (a[i] <= j)
                L[i][j] |= L[i - 1][j - a[i]];
        }
    int mx = 0;
    for (int i = 1; 2 * i <= t; i++)
        if (L[n][i])
            mx = i;
    cout << mx << '' '' << t - mx;
}
```

### Market (Olympic Balkan 2000)

> *Người đánh cá Clement bắt được $n$ con cá, khối lượng con cá thứ $i$ là $a_i$, đem bán ngoài chợ. Ở chợ cá, người ta không mua cá theo từng con mà mua theo một lượng nào đó. Chẳng hạn $3 kg$, $5kg$...*
>
>***Ví dụ:** có 3 con cá, khối lượng lần lượt là: $3, 2, 4$. Mua lượng $6kg$ sẽ phải lấy con cá thứ 2 và và thứ 3. Mua lượng $3 kg$ thì lấy con thứ nhất. Không thể mua lượng $8 kg$. Nếu bạn là người đầu tiên mua cá, có bao nhiêu lượng bạn có thể chọn?*
>**Điều kiện:** $1\le n\le1000$, $1\le a_i\le1000$.

**Hướng dẫn**

Thực chất bài toán là tìm các số $S$ mà có một dãy con của dãy $a$ có tổng bằng $S$.

Ta có thể dùng phương pháp đánh dấu của bài chia kẹo ở trên rồi đếm các giá trị $t$ mà $L[n, t]=\texttt{true}$.

### Điền dấu

> *Cho $n$ số tự nhiên $A_1,A_2, \ldots,A_n$. Ban đầu các số được đặt liên tiếp theo đúng thứ tự cách nhau bởi dấu "?": `A1 ? A2 ? ... ? AN`. Cho trước số nguyên $S$, có cách nào thay các dấu `?` bằng dấu `+` hay dấu `−` để được một biểu thức số học cho giá trị là $S$ không?*

**Hướng dẫn**:

Đặt $L[i,t]=1$ nếu có thể điền dấu vào $i$ số đầu tiên và cho kết quả bằng $t$. Ta có công thức sau để tính $L$:
- `L[1, a[1]] = 1`
- `L[i, t] = 1` nếu `L[i - 1, t + a[i]] = 1` hoặc `L[i - 1, t - a[i]] = 1`.

Nếu `L[n, S] = 1` thì câu trả lời của bài toán là có.

Khi cài đặt, có thể dùng một mảng 2 chiều (lưu toàn bộ bảng phương án) hoặc 2 mảng một chiều (để lưu dòng $i$ và dòng $i-1$). Chú ý là chỉ số theo $t$ của các mảng phải có cả phần âm (tức là từ $-T$ đến $T$, với $T$ là tổng của $n$ số), vì trong bài này chúng ta dùng cả dấu `-` nên có thể tạo ra các tổng âm.

Bài này có một biến thể là đặt dấu sao cho kết quả là một số chia hết cho $k$. Ta có thuật giải tương tự bài toán trên bằng cách thay các phép cộng, trừ bằng các phép cộng và trừ theo modulo $k$ và dùng mảng đánh dấu với các giá trị từ 0 đến $k-1$ (là các số dư có thể có khi chia cho $k$). Đáp số của bài toán là $L[n,0]$.

### Expression

> *Cho $n$ số nguyên dương. Hãy chia chúng thành 2 nhóm sao cho tích của tổng 2 nhóm là lớn nhất.*

**Hướng dẫn**:

* Gọi $T$ là tổng $n$ số nguyên đó. Giả sử ta chia dãy thành 2 nhóm, gọi $S$ là tổng của một nhóm, tổng nhóm còn lại là $T-S$ và tích của tổng 2 nhóm là $S(T-S)$. Bằng phương pháp đánh dấu ta xác định được mọi số $S$ là tổng của một nhóm (như bài Market) và tìm số $S$ sao cho $S(T-S)$ đạt $\max$.
* Bài toán trên có thể đưa về bài chia kẹo. Không mất tính tổng quát, giả sử $S\le \frac{T}{2}$. Để ý rằng $S+(T-S)=T$, là một số cố định. Có thể chứng minh $S(T-S)$ đạt max khi và chỉ khi $S$ lớn nhất có thể. Khi đó chỉ cần chia các số thành hai nhóm sao cho chênh lệch giữa hai nhóm là ít nhất.

### Farmer (IOI 2004)

> *Một người có $N$ mảnh đất và $M$ dải đất. Các mảnh đất có thể coi là một tứ giác và các dải đất thì coi như một đường thẳng. Dọc theo các dải đất ông ta trồng các cây bách, dải đất thứ $i$ có $A_i$ cây bách. Ông ta cũng trồng các cây bách trên viền của các mảnh đất, mảnh đất thứ $j$ có $B_j$ cây bách. Cả ở trên các mảnh đất và dải đất, xen giữa 2 cây bách ông ta trồng một cây ôliu. Ông ta cho con trai được chọn các mảnh đất và dải đất tuỳ ý với điều kiện tổng số cây bách không vượt quá $Q$. Người con trai phải chọn thế nào để có nhiều cây ôliu (loài cây mà anh ta thích) nhất.*

![](/uploads/algo/dp/basic-dynamic-programming-1/basic-dynamic-programming-1_img12.png)

**Hướng dẫn**

Dễ thấy mảnh đất thứ $i$ có $A_i$ cây ôliu và dải đất thứ $j$ có $B_j-1$ cây ôliu. Coi các mảnh đất và dải đất là các “đồ vật”, đồ vật thứ $k$ có khối lượng $W_k$ và giá trị $V_k$ (nếu $k$ là mảnh đất $i$ thì $W_k=V_k=A_i$, nếu $k$ là dải đất $j$ thì $W_k=B_j,V_k=B_j-1$). Ta cần chọn các “đồ vật”, sao cho tổng “khối lượng” của chúng không vượt $Q$ và tổng “giá trị” là lớn nhất. Đây chính là bài toán xếp balô đã trình bày ở trên.

# Kết

Quy hoạch động là phương pháp tự nhiên và có thể áp dụng được trong rất nhiều bài toán. Khi gặp một bài toán, hãy để ý xem nó có được giải trong thời gian đa thức không. Nếu có, hãy thử xác định trạng thái của nó và mối liên hệ giữa các trạng thái. Đôi khi ta cần phân tích một chút để đưa bài toán về QHĐ như các ví dụ ở trên.

Chúc các bạn học tập tốt!
', '// Tính số cách sắp xếp n cái ghế
int solve(int n) {
    // Trường hợp cơ bản
    if (n == 1)
        return 3;
    if (n == 2)
        return 8;
    // Bước đệ quy
    return 2 * solve(n - 1) + 2 * solve(n - 2);
}', '2026-10-06T10:32:18.051446');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_dp_knapsack', 'Quy hoạch động cái túi (DP Knapsack), phần 1', 'dp', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/dp/dp-knapsack-1.md', '["cái túi", "knapsack", "quy hoạch động cái túi", "balo"]', '---
title: Quy hoạch động cái túi, phần 1
description: 
published: true
date: 2025-12-21T09:16:21.388Z
tags: 
editor: markdown
dateCreated: 2025-11-27T14:24:13.740Z
---', '---
title: Quy hoạch động cái túi, phần 1
description: 
published: true
date: 2025-12-21T09:16:21.388Z
tags: 
editor: markdown
dateCreated: 2025-11-27T14:24:13.740Z
---

# Quy hoạch động cái túi (DP Knapsack), phần 1

**Tác giả:**

- Nguyễn Tấn Minh - Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM.

**Reviewer:**

- Nguyễn Quang Minh - Michigan State University.
- Võ Khắc Triệu - National University of Singapore.
- Võ Đức Đoàn - THPT Chuyên Nguyễn Tất Thành, Quãng Ngãi.
- Nguyễn Minh Hiển - Trường Đại học Công nghệ, ĐHQGHN.

## Giới thiệu

**Quy hoạch động cái túi** hay **DP Knapsack** là thuật ngữ dùng để gọi chung các thuật toán dùng để xử lý lớp bài toán cái túi (knapsack problem), chủ yếu tập trung vào việc xử lý hai dạng bài toán sau:

1. **0/1 Knapsack Problem:** Cho $n$ món đồ và một giới hạn $C$, mỗi món đồ được gán trọng số và giá trị. Tìm một tập con các món đồ sao cho tổng trọng số không quá $C$ và tổng giá trị được cực đại hóa.
2. **Subset sum:** Cho $n$ món đồ và một số nguyên $C$, mỗi món đồ được gán trọng số. Kiểm tra sự tồn tại hoặc đếm số tập con các món đồ có tổng giá trị $C$.

Tùy vào yêu cầu và giới hạn các tham số của từng bài toán, ta có rất nhiều lời giải khác nhau. Trong bài viết này, mình sẽ giới thiệu đến các bạn đọc một vài thuật toán quy hoạch động cái túi tiêu biểu cũng như ứng dụng của chúng trong các bài toán Lập trình thi đấu thực tế.

Trong cả 2 phần của bài viết này, ta sẽ giả sử rằng trọng số và giá trị của các món đồ đều là **số nguyên**.

## Bài toán 0/1 Knapsack

Để bắt đầu, chúng ta cùng tìm hiểu thuật toán quy hoạch động cái túi mà gần như lập trình viên nào cũng được tìm hiểu khi bắt đầu nghiên cứu các thuật toán quy hoạch động cơ bản.

### Bài toán

#### [Đề bài](https://oj.vnoi.info/problem/atcoder_dp_d)

> Cho $n$ món đồ và một giới hạn $C$, mỗi món đồ được gán trọng số $w_i$ và giá trị $v_i$. Tìm một tập con các món đồ sao cho tổng trọng số không quá $C$ và tổng giá trị được cực đại hóa.
> 
> Nói cách khác, tìm $S \subseteq \{1, 2, \dots, n\}$ sao cho $\sum_{i \in S} w_i \leq C$ và $\sum_{i \in S} v_i$ được cực đại hóa.

#### Giới hạn

- $1 \leq n \leq 100$
- $1 \leq w_i \leq C \leq 10^{5}$
- $1 \leq v_i \leq 10^{9}$

### Xây dựng trạng thái quy hoạch động

Để xây dựng trạng thái quy hoạch động cho bài toán trên, ta xác định $3$ tham số cần quan tâm như sau:

- *Tham số chia để trị:* Phạm vi bài toán con hay số món đồ đầu tiên đang xét.
- Tổng trọng số của tập con.
- Tổng giá trị của tập con.

Với giới hạn của bài toán, ta chọn hai tham số đầu tiên để đặt trạng thái và tham số còn lại làm giá trị cần tính. Cụ thể, định nghĩa $\texttt{dp}(i, j)$ là tổng giá trị tối đa của một tập con có tổng trọng số $j$ nếu chỉ xét $i$ món đồ đầu tiên.

### Xây dựng công thức truy hồi & trường hợp cơ sở

Để tính $\texttt{dp}(i, j)$, ta tìm cách rút gọn về bài toán con chỉ xét $i - 1$ món đồ đầu tiên rồi xét riêng việc chọn hay không chọn món đồ thứ $i$. Cụ thể:

- Nếu món đồ thứ $i$ được chọn, nghĩa là tổng trọng số $j$ sẽ được chia thành $2$ phần, tổng trọng số của tập con của $i - 1$ phần tử đầu tiên là $j - w_i$ và trọng số của món đồ thứ $i$ là $w_i$. Tổng giá trị trong trường hợp này là $\texttt{dp}(i - 1, j - w_i) + v_i$.
- Nếu món đồ thứ $i$ không được chọn, nghĩa là tổng trọng số $j$ cũng chính là tổng trọng số của tập con của $i - 1$ phần tử đầu tiên. Tổng giá trị trong trường hợp này là $\texttt{dp}(i - 1, j)$.

Đến đây, ta chọn giá trị lớn hơn làm giá trị cuối cùng cho $\texttt{dp}(i, j)$. Nói cách khác, ta có công thức truy hồi:

$$
\texttt{dp}(i, j) = \max(\texttt{dp}(i - 1, j - w_i) + v_i, \texttt{dp}(i - 1, j))
$$

Trường hợp cơ sở của bài toán trên là $\texttt{dp}(0, 0) = 0$ vì giá trị của một tập rỗng là $0$, $\texttt{dp}(0, j) = -\infty$ với $j > 0$ vì ta không thể chọn một tập rỗng có giá trị khác $0$. Như vậy, công thức đầy đủ cho $\texttt{dp}(i, j)$ là:

$$
\texttt{dp}(i, j) = \begin{cases}
0 & i = j = 0 \\
-\infty & i = 0, j > 0 \\
\texttt{dp}(i - 1, j) & i > 0, j < w_i \\
\max(\texttt{dp}(i - 1, j - w_i) + v_i, \texttt{dp}(i - 1, j)) & i > 0, j \geq w_i \\
\end{cases}
$$

Đáp án cuối cùng cho bài toán là:

$$
\max_{0 \leq j \leq C} \texttt{dp}(n, j)
$$

Như vậy, ta đã đưa ra lời giải cho bài toán quy hoạch động cái túi kinh điển và cơ bản nhất với độ phức tạp $\mathcal{O}(nC)$.

### Cài đặt

Sau đây là code tham khảo cho lời giải trên theo kiểu cài đặt Top-down:

```cpp=
using ll = long long;

bool ready[110][100010];
ll dp[110][100010], w[110], v[110];

ll solve(int i, int j) {
    if (i == 0)
        return (j == 0 ? 0 : LLONG_MIN);
    if (ready[i][j])
        return dp[i][j];

    ready[i][j] = 1, dp[i][j] = solve(i - 1, j);
    if (j >= w[i] && solve(i - 1, j - w[i]) != LLONG_MIN)
        dp[i][j] = max(dp[i][j], solve(i - 1, j - w[i]) + v[i]);
    return dp[i][j];
}
```

Để khử đệ quy và bỏ bảng `ready`, ta có thể chuyển sang kiểu cài đặt Bottom-up:

```cpp=
// khởi tạo bảng dp & trường hợp cơ sở
for (int i = 0; i <= n; i++)
    fill(dp[i], dp[i] + C + 1, LLONG_MIN);
dp[0][0] = 0;

// tính giá trị cho mọi trạng thái
for (int i = 1; i <= n; i++) {
    for (int j = 0; j <= C; j++) {
        dp[i][j] = dp[i - 1][j];
        if (j >= w[i] && dp[i - 1][j - w[i]] != LLONG_MIN)
            dp[i][j] = max(dp[i][j], dp[i - 1][j - w[i]] + v[i]);
    }
}

// tính đáp án cuối cùng
cout << *max_element(dp[n], dp[n] + C + 1);
```

Do sự tiện lợi cũng như hiệu quả về cả mặt thời gian và bộ nhớ, cách cài đặt này thường được ưu tiên hơn so với Top-down.

### Tối ưu bộ nhớ

#### Sử dụng mảng $2C$ phần tử

Phân tích công thức quy hoạch động như trên, ta thấy rằng việc tính toán các giá trị $\texttt{dp}(i, \dots)$ chỉ phụ thuộc vào giá trị của $\texttt{dp}(i - 1, \dots)$. Do đó, ta chỉ cần duy trì giá trị của $2$ dòng liên tiếp của bảng $\texttt{dp}$. Từ đây, ta có thể giảm độ phức tạp bộ nhớ bằng cách chỉ sử dụng bảng $\texttt{dp}$ có $2$ dòng rồi thay phiên nhau đóng vai trò là dòng được tính (dòng thứ $i$) và dòng được truy hồi (dòng thứ $i - 1$).

:::spoiler Code tham khảo 1
```cpp=
for (int i = 0; i < 2; i++)
    fill(dp[i], dp[i] + C + 1, LLONG_MIN);
dp[0][0] = 0;

for (int i = 1; i <= n; i++) {
    int t = i & 1;
    for (int j = 0; j <= C; j++) {
        dp[t][j] = dp[t ^ 1][j];
        if (j >= w[i] && dp[t ^ 1][j - w[i]] != LLONG_MIN)
            dp[t][j] = max(dp[t][j], dp[t ^ 1][j - w[i]] + v[i]);
    }
}

cout << *max_element(dp[n & 1], dp[n & 1] + C + 1);
```
:::

#### Sử dụng mảng $C$ phần tử

Ta thậm chí còn có thể bỏ hẳn một chiều của bảng `dp` bằng cách duyệt biến $j$ ngược từ $C$ về $0$. Lúc này, ta có thể hiểu rằng tại mọi thời điểm, các ô trong khoảng $[j; C]$ của mảng $\texttt{dp}$ lưu giá trị của dòng được tính còn các ô trong khoảng $[0; j - 1]$ lưu giá trị của dòng được truy hồi.

Lưu ý rằng việc duyệt $j$ từ $0$ đến $C$ sẽ cho ra giá trị sai, ta có thể quan sát ví dụ sau: do trạng thái $\texttt{dp}(i, j - w_i)$ đã được xử lý trước nên việc lấy lại ô nhớ thứ $j - w_i$ để cập nhật ô nhớ $j$ lại trở thành lấy $\texttt{dp}(i, j - w_i)$ để tính $\texttt{dp}(i, j)$.

![dp_knapsack_opt_mem_1.png](/uploads/algo/dp/dp-knapsack-1/dp_knapsack_opt_mem_1.png)

Thay vào đó, ta cần lấy $\texttt{dp}(i - 1, j - w_i)$ để tính $\texttt{dp}(i, j)$.

![dp_knapsack_opt_mem_2.png](/uploads/algo/dp/dp-knapsack-1/dp_knapsack_opt_mem_2.png)

:::spoiler Code tham khảo 2
```cpp=
fill(dp, dp + C + 1, LLONG_MIN);
dp[0] = 0; // trường hợp cơ sở

for (int i = 1; i <= n; i++)
    for (int j = C; j >= w[i]; j--)
        if (dp[j - w[i]] != LLONG_MIN)
            dp[j] = max(dp[j], dp[j - w[i]] + v[i]);
cout << *max_element(dp, dp + C + 1);
```
:::

Tuy có cùng độ phức tạp nhưng sau khi áp dụng các tối ưu bộ nhớ, tốc độ của thuật toán cũng được tối ưu một cách đáng kể. Cụ thể, với mấy chấm của VNOJ, độ hiệu quả (theo test có kết quả tệ nhất) của ba cách cài đặt được thể hiện qua bảng sau:

| Tiêu chí đánh giá | Top-down | Bottom-up | Bottom-up có tối ưu bộ nhớ (code tham khảo 2) |
| :-: | :-: | :-: | :-: |
| Thời gian chạy | $0,31$ giây | $0,12$ giây | $0,04$ giây |
| Bộ nhớ | $88,94$ MB | $80,16$ MB | $3,87$ MB |

### Đảo nhãn

Trong trường hợp giới hạn của trọng số lớn nhưng giá trị của các món đồ lại nhỏ (ví dụ như bài [Knapsack 2](https://oj.vnoi.info/problem/atcoder_dp_e)), ta có thể dùng tham số giá trị để đặt trạng thái còn trọng số để tính. Khi đó, hàm Quy hoạch động sẽ là $\texttt{dp}(i, j)$ là trọng số nhỏ nhất nếu chọn ra tập các món đồ có tổng giá trị $j$ từ $i$ món đồ đầu tiên.

Với định nghĩa mới, ta có công thức truy hồi như sau:

$$
\texttt{dp}(i, j) = \begin{cases}
0 & i = j = 0 \\
\infty & i = 0, j > 0 \\
\texttt{dp}(i - 1, j) & i > 0, j < v_i \\
\min(\texttt{dp}(i - 1, j), \texttt{dp}(i - 1, j - v_i) + w_i) & i > 0, j \geq v_i \\
\end{cases}
$$

Cuối cùng, ta tìm giá trị $j$ lớn nhất sao cho $\texttt{dp}(n, j) \leq C$, tức là mức giá trị lớn nhất sao cho tồn tại một cách chọn có tổng trọng số không quá $C$. Độ phức tạp của thuật toán lúc này là $\mathcal{O}(n \cdot \sum v)$.

## Bài toán Subset sum

### Bài toán

#### Đề bài

> Cho $n$ món đồ và một số nguyên $C$, mỗi món đồ được gán trọng số $w_i$. Đếm số tập con các món đồ có tổng đúng bằng $C$, modulo $10^{9} + 7$.
> 
> Nói cách khác, đếm số tập $S \subseteq \{1, 2, \dots, n\}$ sao cho $\sum_{i \in S} w_i = C$, rồi in đáp án modulo $10^{9} + 7$.

#### Giới hạn

- $1 \leq n \leq 100$.
- $1 \leq w_i \leq C \leq 10^{5}$.

### Lời giải Quy hoạch động

Với ý tưởng đặt trạng thái tương tự với bài toán 0/1 Knapsack, ta gọi $\texttt{dp}(i, j)$ là số tập con các món đồ có tổng đúng bằng $j$, nếu chỉ xét $i$ món đồ đầu tiên. Nói cách khác, $\texttt{dp}(i, j)$ là số tập $S \subseteq \{1, 2, \dots, i\}$ sao cho $\sum_{i \in S} w_i = j$. Để tìm công thức truy hồi, ta cũng xét hai trường hợp cho việc chọn hay không chọn món đồ thứ $i$:

- Nếu món đồ thứ $i$ không được chọn, tức toàn bộ tổng $j$ là của $i - 1$ món đồ đầu tiên. Số cách chọn theo trường hợp này là $\texttt{dp}(i - 1, j)$.
- Nếu món đồ thứ $i$ được chọn, tức nó đóng góp $w_i$ đơn vị vào tổng $j$, phần còn lại $j - w_i$ sẽ là của $i - 1$ món đồ đầu tiên. Số cách chọn theo trường hợp này là $\texttt{dp}(i - 1, j - w_i)$.

Kết hợp các trường hợp cơ sở, ta có công thức truy hồi:

$$
\texttt{dp}(i, j) = \begin{cases}
1 & i = j = 0 \\
0 & i = 0, j > 0 \\
\texttt{dp}(i - 1, j) & i > 0, j < w_i \\
\texttt{dp}(i - 1, j) + \texttt{dp}(i - 1, j - w_i) & i >  0, j \geq w_i \\
\end{cases}
$$

Tương tự, nếu bài toán là kiểm tra sự tồn tại của một tập con có tổng là $C$ thay vì đếm số tập, ta có thể thay đổi công thức truy hồi như sau:

$$
\texttt{exist}(i, j) = \begin{cases}
\text{true} & i = j = 0 \\
\text{false} & i = 0, j > 0 \\
\texttt{exist}(i - 1, j) & i > 0, j < w_i \\
\texttt{exist}(i - 1, j) \lor \texttt{exist}(i - 1, j - w_i) & i >  0, j \geq w_i \\
\end{cases}
$$

Với $\lor$ là ký hiệu của phép [bitwise OR](https://en.wikipedia.org/wiki/Bitwise_operation#OR).

Tương tự lời giải cho bài toán 0/1 Knapsack như trên, độ phức tạp của thuật toán này là $\mathcal{O}(nC)$.

### Cài đặt

```cpp=
dp[0] = 1;
for (int i = 1; i <= n; i++)
    for (int j = C; j >= w[i]; j--)
        dp[j] += dp[j - w[i]]; // thêm modulo khi cần
cout << dp[C];
```

### Tối ưu bài toán kiểm tra sự tồn tại

#### Đề bài

> Cho $n$ món đồ và một số nguyên $C$, mỗi món đồ được gán trọng số $w_i$. Kiểm tra sự tồn tại của một tập con các món đồ có tổng đúng bằng $C$.
> 
> Nói cách khác, kiểm tra xem có tồn tại một tập $S \subseteq \{1, 2, \dots, n\}$ sao cho $\sum_{i \in S} w_i = C$ hay không.

#### Giới hạn (thay đổi)

- $1 \leq n \leq 10^{6}$
- $1 \leq w_i \leq 10^{6}$
- $1 \leq C \leq \sum w_i \leq 2 \cdot 10^{6}$

#### Tối ưu 1

Xét các truy hồi trên dòng thứ $i$ của bảng Quy hoạch động, ta thấy mọi ô ở dòng $i$ cột $j$ đều lấy giá trị từ dòng $i - 1$ cột $j$ và $j - w_i$ theo công thức truy hồi $\texttt{exist}(i - 1, j) \lor \texttt{exist}(i - 1, j - w_i)$:

![dp_transition.png](/uploads/algo/dp/dp-knapsack-1/dp_transition.png)

Điều này cũng tương tự với việc dịch chuyển toàn bộ các phần tử của $\texttt{dp}_{i-1}$ sang phải $w_i$ lần, rồi thực hiện bitwise OR với các phần tử ban đầu:

![bitset_transition.png](/uploads/algo/dp/dp-knapsack-1/bitset_transition.png)

Nếu lưu mỗi dòng của bảng Quy hoạch động dưới dạng cấu trúc dữ liệu [`bitset`](http://www.en.cppreference.com/w/cpp/utility/bitset.html), ta có thể biến đổi thao tác dịch chuyển các phần tử thành phép dịch bit sang trái. Khi đó, công thức truy hồi là:

$$
\texttt{dp}_i = \texttt{dp}_{i-1} \mid (\texttt{dp}_{i-1} \mathrel{\texttt{<<}} w_i)
$$

Việc sử dụng cấu trúc dữ liệu `bitset` sẽ giúp giảm cả độ phức tạp thời gian lẫn bộ nhớ xuống $32$ hoặc $64$ lần.

:::spoiler Code tham khảo 3
```cpp=
bitset<2''000''001> exist;
exist.set(0); // gán exsit[0] = 1, trường hợp cơ sở
for (int u : w)
    exist |= (exist << u);
cout << exist[C];
```
:::

#### Tối ưu 2

Xét hai danh sách món đồ $[1, 1, 1, 1, 1, 1, 1]$ ($7$ phần tử) và danh sách $[1, 2, 4]$ ($3$ phần tử), cả hai đều có thể tạo ra mọi số nguyên từ $1$ đến $7$ bằng cách lấy tổng một tập con bất kỳ. Tuy nhiên, danh sách thứ hai lại có số phần tử chưa đến một nửa danh sách đầu tiên.

Từ đó, ta có thể đưa ra ý tưởng rút gọn một số phần tử trong danh sách món đồ mà vẫn không ảnh hưởng kết quả của bài toán. Cụ thể, với một giá trị $w$ bất kỳ xuất hiện $3$ lần, ta thay $3$ phần tử này thành $1$ phần tử $w$ và $1$ phần tử $2w$.

:::spoiler Chứng minh
Với một danh sách $A$ có giá trị $w$ xuất hiện tối thiểu $3$ lần, ta tách chúng ra thành hai danh sách con $A_1 = [w, w, w]$ và danh sách $A_2$ là phần còn lại. Gọi $g(B)$ là tập các tổng tập con của dãy $B$. Dễ thấy

$$
g(A) = g(A_1) + g(A_2)
$$

Với phép $+$ hai tập hợp là ký hiệu của [tổng Minkowski](https://en.wikipedia.org/wiki/Minkowski_addition).

Mặt khác, ta có:

$$
g([w, w, w]) = g([w, 2w]) = \{0, w, 2w, 3w\}
$$

Do đó:

$$
g(A) = g(A_1) + g(A_2) = g([w, 2w]) + g(A_2)
$$
:::

Sau các bước biến đổi, chúng ta còn lại một mảng có độ dài $\mathcal{O}(\sqrt{S})$ với $S = \sum w$.

:::spoiler Chứng minh
Dễ thấy, nếu có một giá trị xuất hiện ít nhất $3$ lần, nghĩa là các bước biến đổi vẫn chưa được thực hiện xong. Do đó, ta có thể chắc chắn rằng một giá trị chỉ xuất hiện ít nhất $2$ lần. Khi đó, tổng của một danh sách món đồ phải có giá trị tối thiểu là:

$$
2 \cdot \left(1 + 2 + 3 + \dots + \frac{n}{2} \right)
$$

Nói cách khác:

$$
\begin{align*}
1 + 2 + 3 + \dots + \frac{n}{2} &\leq \frac{S}{2} \\
\Longleftrightarrow \frac{\frac{n}{2} \cdot (\frac{n}{2} + 1)}{2} &\leq \frac{S}{2} \\
\Longrightarrow \left( \frac{n}{2} \right)^{2} &\leq S \\
\Longrightarrow n &\leq 2 \sqrt{S}
\end{align*}
$$

Do đó, cận trên của độ dài mảng là $2 \sqrt{S}$.
:::

Để thực hiện thao tác biến đổi danh sách món đồ thuận tiện hơn, ta sử dụng thuật toán sau: Ta duy trì mảng thống kê $f$ của dãy $w$ rồi duyệt mọi mức trọng lượng từ $1$ đến $S$. Với mức trọng lượng $i$ nào đó, đặt:

$$
\Delta = \left\lfloor \frac{f_i - 1}{2} \right\rfloor
$$

Ta thực hiện xóa đi $2\Delta$ phần tử có trọng lượng $i$ rồi thêm $\Delta$ phần tử có trọng lượng $2i$, sau đó, đưa các phần tử có trọng lượng $i$ còn lại vào danh sách món đồ mới.

:::spoiler Code tham khảo 4
```cpp=
// chuẩn bị mảng thống kê
for (int u : components)
    cnt[u]++;
exist.set(0);

for (int i = 1; i <= S; i++) {
    if (!cnt[i])
        continue;
    int delta = (cnt[i] - 1) / 2;
    cnt[i] -= (delta * 2);
    if (i * 2 <= S)
        cnt[i * 2] += delta;
    for (int j = 0; j < cnt[i]; j++)
        exist |= (exist << i);
}
```
:::

Như vậy, ta đã có thuật toán Quy hoạch động tối ưu với độ phức tạp $\mathcal{O} \left( \frac{C \sqrt{S}}{64} \right)$.

### Bỏ phần tử với bài toán đếm

Giả sử ta cần xử lý bài toán Subset Sum theo dạng "online" với ba loại truy vấn sau:

1. Thêm một phần tử có trọng số $w$ vào cái túi.
2. Bỏ một phần tử có trọng số $w$ khỏi cái túi.
3. Cho biết số tập con có tổng đúng bằng $j \leq C$.

Với thao tác thêm, ta thực hiện tương tự ý tưởng Quy hoạch động cái túi được trình bày như trên:

```cpp=
for (int j = C; j >= weight; j--)
    dp[j] += dp[j - weight]; // thêm modulo khi cần
```

Đối với thao tác bỏ phần, để ý rằng thứ tự thêm các món đồ vào cái túi không ảnh hưởng đến kết quả bài toán, do đó, ta giả sử phần tử cần bỏ cũng là phần tử cuối cùng được thêm. Khi đó, ta chỉ cần thiết kế thao tác "undo" -- hủy bỏ thay đổi của vòng lặp trên:

```cpp=
for (int j = weight; j <= C; j++)
    dp[j] -= dp[j - weight]; // thêm modulo khi cần
```

> **Lưu ý khi cài đặt**
>
> Đối với các bài toán đếm liên quan đến Subset Sum, ta thường được yêu cầu in ra đáp án modulo một số nguyên tố (như $10^{9} + 7$ hoặc $998\,244\,353$). Do đó, quá trình tính toán Quy hoạch động sẽ gọi toán tử modulo rất nhiều. Điều này có thể làm chậm tốc độ của chương trình.
>
> Ta thường phải khử phép modulo bằng cách:
> - Viết hàm `add(a, b)` và `sub(a, b)` để tính $(a + b) \bmod \texttt{MOD}$ và $(a - b) \bmod \texttt{MOD}$ với $0 \leq a, b < \texttt{MOD}$ (chỉ sử dụng phép cộng/trừ và `if`/`else`).
> - Sử dụng `ModInt`, bạn đọc có thể tham khảo [template này](https://github.com/ngthanhtrung23/ACM_Notebook_new/blob/master/Math/modint.h).

## Bài tập ứng dụng

### [Singapore NOI 2018 - Knapsack](https://oj.uz/problem/view/NOI18_knapsack) (0/1 Knapsack có bản sao)

#### Đề bài

> Cho $n$ loại món đồ và một giới hạn $C$, loại thứ $i$ có trọng lượng $w_i$, giá trị $v_i$ và số lượng $k_i$. Tìm một tập con các món đồ sao cho tổng trọng số không quá $C$ và tổng giá trị đạt cực đại.
> 
> Nói cách khác, tìm một dãy $a_1, a_2, \dots, a_n$ sao cho $0 \leq a_i \leq k_i$ với mọi $1 \leq i \leq n$, $\sum_{1 \leq i \leq n} a_i \cdot w_i \leq C$ và $\sum_{1 \leq i \leq n} a_i \cdot v_i$ đạt cực đại.

#### Giới hạn

- $1 \leq n \leq 10^{5}$
- $1 \leq w_i \leq C \leq 2000$
- $1 \leq v_i \leq 10^{6}$
- $1 \leq k_i \leq 10^{9}$

*(Lưu ý, biến $S$ trong đề bài gốc đã được thay thế thành biến $C$ để đồng nhất với cách đặt tên biến trong bài viết này)*

#### Lời giải quy về quy hoạch động cái túi kinh điển

Nhận xét rằng với mỗi mức cân nặng $w$, ta chỉ có thể chọn tối đa $\left\lfloor \frac{C}{w} \right\rfloor$ món đồ. Hơn nữa, khi đã cố định các một mức cân nặng, ta chỉ việc tham lam chọn món đồ có giá trị lớn nhất. Nói cách khác, với mỗi mức cân nặng $w$, món đồ có giá trị lớn thứ $\left\lfloor \frac{C}{w} \right\rfloor + 1$ trở đi sẽ không bao giờ được chọn vào tập tối ưu.

Dựa vào nhận xét trên, ta "lọc" lại các món đồ và chỉ xét các *món đồ tiềm năng*, tức $\left\lfloor \frac{C}{w} \right\rfloor$ món đồ có giá trị lớn nhất với mỗi mức cân nặng $w$. Khi đó, số món đồ ta cần xét chỉ còn:

$$
\left\lfloor \frac{C}{1} \right\rfloor + \left\lfloor \frac{C}{2} \right\rfloor + \left\lfloor \frac{C}{1} \right\rfloor + \dots + \left\lfloor \frac{C}{C} \right\rfloor = \mathcal{O}(C \log C)
$$

Khi đó, nếu thực hiện quy hoạch động trên tập *món đồ tiềm năng*, độ phức tạp thời gian sẽ là $\mathcal{O}(C^{2} \log C)$.

:::spoiler Code tham khảo 5
```cpp=
#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using ld = long double;
using pl = pair<ll, ll>;
using pii = pair<int, int>;
using tpl = tuple<int, int, int>;

#define all(a) a.begin(), a.end()
#define filter(a) a.erase(unique(all(a)), a.end())

const int mn = 1e5 + 5;
ll V[mn], W[mn], K[mn], dp[2020], used[2020];

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    int S, n;
    cin >> S >> n;
    for (int i = 1; i <= n; i++)
        cin >> V[i] >> W[i] >> K[i];

    vector<int> ord(n);
    iota(ord.begin(), ord.end(), 1);
    sort(all(ord), [&](int a, int b) { return V[a] > V[b]; });

    int t = 0, counter = 0;
    for (int i : ord) {
        for (int iter = 0; iter < K[i]; iter++) {
            if (used[W[i]] * W[i] > S)
                break;
            for (int j = S; j >= W[i]; j--)
                dp[j] = max(dp[j], dp[j - W[i]] + V[i]);
            used[W[i]]++;
        }
    }
    cout << dp[S];

    return 0;
}
```
:::

#### Lời giải sử dụng deque trick

Tuy nhiên, trong trường hợp giới hạn của $C$ lớn (ví dụ, $1 \leq C \leq 10^{5}$ và $1 \leq n \leq 200$), cách làm như trên là chưa hợp lý. Thay vào đó, ta có thể xử lý bài toán trên với lời giải thứ hai đó là sử dụng kỹ thuật [tìm max-min trong đoạn tịnh tiến](https://wiki.vnoi.info/vi/algo/data-structures/deque-min-max) hay deque trick.

Vẫn giữ nguyên cách đặt trạng thái $\texttt{dp}(i, j)$ là tổng giá trị lớn nhất có thể đạt được nếu chọn tập có tổng trọng lượng $j$ và chỉ xét $i$ loại đồ đầu tiên. Nếu chọn $a$ (với $1 \leq a \leq k_i$) món đồ cho loại đồ thứ $i$, tổng giá trị tối đa mà ta có là $\texttt{dp}(i - 1, j - w_i \cdot a) + v_i \cdot a$. Do đó, công thức truy hồi trong trường hợp này là:

$$
\texttt{dp}(i, j) = \max_{1 \leq a \leq k_i} \left( \texttt{dp}(i - 1, j - w_i \cdot a) + v_i \cdot a \right)
$$

Để đơn giản hóa bài toán, ta tạm bỏ qua giới hạn $k_i$. Khi đó, với mỗi trạng thái $(i, j)$ trên bảng quy hoạch động, ta truy hồi về các trạng thái trên dòng $i - 1$, cột $j - w_i, j - 2w_i, j - 3w_i, \dots$ tức các cột có chỉ số đồng dư với $j$ theo modulo $w_i$.

![dp_transition_2.png](/uploads/algo/dp/dp-knapsack-1/dp_transition_2.png)

Như vậy, ta có thể biến đổi công thức lại thành:

$$
\texttt{dp}(i, j) = \max_{\substack{u \equiv j \pmod {w_i} \\ u \leq j}} \left( \texttt{dp}(i - 1, u) + v_i \cdot \left( \left\lfloor \frac{j}{w_i} \right\rfloor - \left\lfloor \frac{u}{w_i} \right\rfloor \right) \right)
$$

Tách công thức độc lập theo $j, u$, ta có:

$$
\texttt{dp}(i, j) = v_i \cdot \left\lfloor \frac{j}{w_i} \right\rfloor + \max_{\substack{u \equiv j \pmod {w_i} \\ u \leq j}} \left( \texttt{dp}(i - 1, u) - v_i \cdot \left\lfloor \frac{u}{w_i} \right\rfloor \right)
$$

Như vậy, ý tưởng chung của thuật toán là với mọi $i$, ta chia các trạng thái quy hoạch động ở dòng $i - 1$ thành $w_i$ theo modulo $w_i$. Ở nhóm thứ $j$, ta tạo dãy gồm các giá trị $\delta_{i-1}(t)$ sao cho $t \equiv j \pmod {w_i}$ và:

$$
\delta_i(t) = \texttt{dp}(i, t) - v_{i+1} \cdot \left\lfloor \frac{t}{w_{i+1}} \right\rfloor
$$

Để tính $\texttt{dp}(i, j)$, xét nhóm thứ $j \bmod w_i$, ta tính giá trị $\delta$ nhỏ nhất của đoạn con liên tiếp có độ dài $k_i + 1$ kết thúc tại phần tử có chỉ số (theo cột của bảng quy hoạch động) là $j$. Để hỗ trợ tính toán giá trị nhỏ nhất của các đoạn tịnh tiến, ta sử dụng deque trick giúp truy vấn trong $\mathcal{O}(1)$.

Như vậy, ta đã có một lời giải khác cho bài toán nêu trên có độ phức tạp $\mathcal{O}(nC)$.

:::spoiler Code tham khảo 6
Lưu ý, đây chỉ là lời giải đạt $73$ điểm trên nền tảng oj.uz do giới hạn của bài tập không thích hợp với độ phức tạp thuật toán.

```cpp=
#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using ld = long double;
using pl = pair<ll, ll>;
using pii = pair<int, int>;
using tpl = tuple<int, int, int>;

#define all(a) a.begin(), a.end()
#define filter(a) a.erase(unique(all(a)), a.end())

const int mn = 1e5 + 5;
ll V[mn], W[mn], K[mn], dp[2][2020], used[2020];

struct dqTrick {
    deque<ll> dq;

    void push(ll x) {
        while (dq.size() && dq.back() < x)
            dq.pop_back();
        dq.push_back(x);
    }

    void pop(ll x) {
        if (dq.size() && dq.front() == x)
            dq.pop_front();
    }

    ll best() {
        return (dq.empty() ? LLONG_MIN : dq.front());
    }
};

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    int S, n;
    cin >> S >> n;
    for (int i = 1; i <= n; i++)
        cin >> V[i] >> W[i] >> K[i];

    vector<int> ord(n);
    iota(ord.begin(), ord.end(), 1);
    sort(all(ord), [&](int a, int b) { return V[a] > V[b]; });

    int t = 0;
    for (int i : ord) {
        if (used[W[i]] * W[i] > S)
            continue;
        vector<dqTrick> opt(W[i]);
        for (int j = 0; j <= S; j++) {
            int R = j % W[i], D = j / W[i];
            opt[R].push(dp[t ^ 1][j] - D * V[i]);
            if (j >= W[i] * (K[i] + 1))
                opt[R].pop(dp[t ^ 1][j - W[i] * (K[i] + 1)] - (D - K[i] - 1) * V[i]);

            dp[t][j] = opt[R].best() + D * V[i];
        }
        t ^= 1, used[W[i]] += K[i];
    }
    cout << dp[t ^ 1][S];

    return 0;
}
```
:::

### [Codeforces 755F - PolandBall and Gifts](https://codeforces.com/contest/755/problem/F)

#### Giới hạn

Cho một hoán vị $p$ độ dài $n$ và một số nguyên $k$, đảm bảo $p_i \neq i$ với mọi $1 \leq i \leq n$. Biết rằng sẽ có $k$ phần tử bị xóa đi (không đánh số lại các phần tử chưa bị xóa). Ta gọi phần tử thứ $i$ là đặc biệt khi thỏa đồng thời:

- Phần tử thứ $i$ chưa bị xóa.
- Phần tử thứ $x$ thỏa $p_x = i$ chưa bị xóa.

Đếm số phần tử **không** đặc biệt **ít nhất** và **nhiều nhất** ($2$ yêu cầu riêng biệt) khi xóa $k$ phần tử của hoán vị $p$.

#### Giới hạn

- $2 \leq n \leq 10^{6}$
- $0 \leq k \leq n$

#### Biến đổi thành đồ thị

Với mọi phần tử $i$, ta dựng cạnh có hướng $i \rightarrow p_i$. Khi đó, ta có một đồ thị mà mỗi thành phần liên thông là một chu trình. Do sự độc lập giữa các thành phần liên thông, với cả hai yêu cầu, ta sẽ xử lý riêng từng thành phần liên thông rồi kết hợp các kết quả lại với nhau.

Lúc này, bài toán của chúng ta là cho một chu trình gồm $n$ đỉnh. Tìm cách xóa $k$ cạnh sao cho số đỉnh không có cạnh vào/ra là ít nhất và nhiều nhất.

#### Bài toán cực đại hóa

Ta sẽ lần lượt giải quyết từng yêu cầu của bài toán, bắt đầu với yêu cầu cực đại hóa số đỉnh không có cạnh vào/ra. Dễ thấy, ta có thể tham lam xóa/giữ các cạnh xen kẽ nhau để có phương án tối ưu.

Ví dụ, với chu trình gồm $7$ đỉnh, thứ tự xóa cạnh sau là tối ưu:

![del_edge.png](/uploads/algo/dp/dp-knapsack-1/del_edge.png)

Cụ thể hơn, xét một chu trình gồm $n$ đỉnh, khi xóa $\left\lfloor \frac{n}{2} \right\rfloor$ cạnh đầu tiên, ta xóa được $2$ đỉnh đặc biệt cho mỗi cạnh. Với $n \bmod 2$ cạnh tiếp theo, ta xóa được $1$ đỉnh đặc biệt cho mỗi cạnh. Các cạnh còn lại không đóng góp gì vào đáp án.

Gọi cạnh loại $x$ là cạnh mà khi xóa đi sẽ kéo theo $x$ đỉnh đặc biệt bị xóa. Ta thống kê được số cạnh loại $1$ và $2$ cho cả đồ thị và đặt là $c_1, c_2$. Sau đó, tiếp tục sử dụng tham lam và xóa $\min(k, c_2)$ cạnh loại $2$ và $\min(c_1, k - \min(k, c_2))$ cạnh loại $1$.

Như vậy, yêu cầu này có thể được xử lý trong $\mathcal{O}(n)$.

#### Bài toán cực tiểu hóa

Đối với bài toán cực tiểu hóa, ta lại dùng ý tưởng tham lam nhưng lần này, ta sẽ xóa các cạnh liên tiếp. Với chiến lược đó, mỗi thành phần liên thông sẽ có đúng $1$ cạnh loại $2$, $n - 2$ cạnh loại $1$ và có $1$ cạnh loại $0$.

Một nhận xét quan trọng đó là một khi đã bắt đầu xóa cạnh cho một thành phần liên thông nào đó, ta sẽ tiến hành xóa tại thành phần liên thông đó cho đến khi hết cạnh. Lý do là số đỉnh đặc biệt bị xóa đi không tăng lên khi ta tiếp tục xóa tại một thành phần liên thông nào đó.

Như vậy, ta xét hai trường hợp:
- Nếu xóa được hết các cạnh thuộc các thành phần liên thông mà ta chọn để xóa, đáp án sẽ là $k$.
- Nếu có một thành phần liên thông đang bị xóa dang dở, đáp án sẽ là $k + 1$.

Để kiểm tra trường hợp, ta lại quy bài toán đồ thị thành bài toán cái túi: mỗi thành phần liên thông được xem như một món đồ có trọng số bằng số đỉnh của nó. Nhiệm vụ của chúng ta là kiểm tra xem tồn tại một tập các thành phần liên thông có tổng số đỉnh là $k$ hay không.

Với thuật toán kết hợp hai tối ưu đã được trình bày ở phần Subset Sum, ta có thể xử lý yêu cầu này trong $\mathcal{O}\left( n + \frac{k \sqrt{n}}{64} \right)$.

#### Cài đặt

Để dễ dàng tách biệt các code xử lý hai yêu cầu khác nhau, mình sẽ sử dụng `namespace`. Ở mỗi `namespace`, mình cài đặt một hàm `solve` nhận vào danh sách kích thước các thành phần liên thông và trả về đáp án.

:::spoiler Code tham khảo 7
```cpp=
#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using ld = long double;
using pl = pair<ll, ll>;
using pii = pair<int, int>;
using tpl = tuple<int, int, int>;

#define all(a) a.begin(), a.end()
#define filter(a) a.erase(unique(all(a)), a.end())

const int mn = 1e6 + 6;
bool vis[mn];
int p[mn], n, k;

namespace solveMin {
bitset<mn> exist;
int cnt[mn];

int solve(const vector<int> &components) {
    for (int u : components)
        cnt[u]++;
    exist.set(0);

    for (int i = 1; i <= n; i++) {
        if (!cnt[i])
            continue;
        int merged = (cnt[i] - 1) >> 1;
        cnt[i] -= (merged << 1);
        if ((i << 1) <= n)
            cnt[i << 1] += merged;
        for (int j = 0; j < cnt[i]; j++)
            exist |= (exist << i);
    }

    return k + (exist[k] == 0);
}
}; // namespace solveMin

namespace solveMax {
int solve(const vector<int> &components) {
    vector<int> cnt(3);
    for (int u : components)
        cnt[2] += u >> 1, cnt[1] += u & 1;

    int pickTwo = min(cnt[2], k);
    return (pickTwo << 1) + min(cnt[1], k - pickTwo);
}
}; // namespace solveMax

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> n >> k;
    for (int i = 1; i <= n; i++)
        cin >> p[i];

    // thực hiện DFS khử đệ quy trên đồ thị hàm
    vector<int> components;
    for (int i = 1; i <= n; i++) {
        if (vis[i])
            continue;
        int counter = 0;
        for (int node = i; !vis[node]; node = p[node])
            counter++, vis[node] = 1;
        components.push_back(counter);
    }

    cout << solveMin::solve(components) << " "
         << solveMax::solve(components) << "\n";

    return 0;
}
```
:::


## Phụ lục

### Luyện tập thêm

- [VNOJ, Cái túi 2](https://oj.vnoi.info/problem/dttui2)
- [MarisaOJ, Knapsack](https://marisaoj.com/problem/554)
- [2016 USP Try-outs, The Knapsack Problem](https://codeforces.com/gym/101064/problem/L)
- [AtCoder Beginner Contest 221, Jumping Sequence](https://atcoder.jp/contests/abc221/tasks/abc221_g)
- [VNOI Cup 2024, Round 2, Love Charm](https://oj.vnoi.info/problem/vnoicup24_r2_d)
- [JOI 2019, Growing Vegetable is Fun 3](https://oj.uz/problem/view/JOI19_ho_t3)
- [USACO Platinum, Exercise](https://usaco.org/index.php?page=viewproblem2&cpid=1045)


### Tài liệu tham khảo

- [Ashley Khoo (errorgorn). [Tutorial] Knapsack, Subset Sum and the (max, +) Convolution, 2022.](https://codeforces.com/blog/entry/98663)
- [Võ Khắc Triệu. DeMen Blog #2: Bài toán Knapsack và các biến thể (Phần 1). 2023.](https://hackmd.io/@DeMen100ms/DeMenBlog2)
- [Bùi Minh Hoạt, Nguyễn Châu Khanh. Hàng đợi hai đầu (deque) và Bài toán tìm max-min trong đoạn tịnh tiến (VNOI). 2023.](https://wiki.vnoi.info/vi/algo/data-structures/deque-min-max)


', 'Để khử đệ quy và bỏ bảng `ready`, ta có thể chuyển sang kiểu cài đặt Bottom-up:', '2026-10-06T10:32:18.475003');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_dp_bitmask', 'Quy hoạch động Bitmask', 'dp', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/dp/dp-bitmask.md', '["dp bitmask", "quy hoạch động bitmask", "trạng thái bit"]', '---
title: Quy hoạch động bitmask
description: 
published: true
date: 2024-09-06T04:35:48.793Z
tags: 
editor: markdown
dateCreated: 2024-09-02T08:40:16.714Z
---', '---
title: Quy hoạch động bitmask
description: 
published: true
date: 2024-09-06T04:35:48.793Z
tags: 
editor: markdown
dateCreated: 2024-09-02T08:40:16.714Z
---

# Quy hoạch động Bitmask

### Người viết:
* Nguyễn Đức Kiên, Trường Đại học Công nghệ, ĐHQGHN

### Reviewer:
* Phạm Công Minh - Trường THPT chuyên Khoa học Tự nhiên, ĐHQGHN
* Cao Thanh Hậu - Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM

# Giới thiệu 

Khi giải các bài toán về Quy hoạch động (QHĐ), chúng ta đã làm quen với các trạng thái là vị trí hoặc giá trị. Ví dụ, trong bài toán [Knapsack](https://en.wikipedia.org/wiki/Knapsack_problem), chúng ta đã gọi $dp[i][j]$ là giá trị lớn nhất thu được khi đến vị trí thứ $i$, thu được khối lượng là $j$. 
Với việc sử dụng biểu diễn nhị phân (bitmask), chúng ta hoàn toàn có thể sử dụng phương pháp QHĐ với trạng thái là các tập hợp.

## Kiến thức cần biết

Để đọc hiểu bài viết sau một cách hiệu quả, bạn đọc nên có sẵn các kiến thức về:
- [Quy hoạch động cơ bản](https://wiki.vnoi.info/algo/dp/basic-dynamic-programming-1.md)
- [Các phép toán với bit](https://wiki.vnoi.info/algo/basic/bitwise-operators.md)

## Biểu diễn nhị phân và các phép toán trên bit
Đầu tiên, ta nhắc lại đôi chút về các [phép toán bit](https://wiki.vnoi.info/algo/basic/bitwise-operators.md).
Như chúng ta đã biết, mọi số nguyên trong hệ thập phân đều có thể biểu diễn được dưới dạng [nhị phân](https://en.wikipedia.org/wiki/Binary_number). Với các số nhị phân này, ta có thêm một số phép toán bên cạnh các phép toán thông thường như `AND` (`&` trong C++), `OR` (`|` trong C++), `XOR` (`^` trong C++), dịch trái (`<<` trong C++), dịch phải (`>>` trong C++), … Khi sử dụng C++, ngôn ngữ này hỗ trợ chúng ta thêm một số hàm liên quan đến dãy bit như `__builtin_popcount()` (đếm số bit $1$), `__builtin_ctz()` (đếm số bit $0$ ở tận cùng bên phải), ...

Sử dụng các phép toán trên, chúng ta có thể dễ dàng thực hiện các thao tác:
- Xác định giá trị của bit thứ $i$: `(mask >> i) & 1`
- Lật ngược (flip) giá trị của bit thứ $i$: `mask ^= (1 << i)`
- Đếm số bit $1$ trong một số được biểu diễn nhị phân

Có thể thấy các thao tác này có những điểm tương đồng với việc thao tác trên các tập hợp: kiểm tra một phần tử có nằm trong tập hợp hay không, thêm/bớt một phần tử trong tập hợp, đếm số phần tử của tập hợp. Điều đó cho ta ý tưởng về việc dùng biểu diễn nhị phân để biểu diễn các tập hợp con của một tập hợp.

## Biểu diễn các tập hợp bằng bitmask
Ta có thể biểu diễn một tập con của một tập hợp bằng một xâu nhị phân, trong đó bit thứ $i$ bằng $0$/$1$ khi phần tử thứ $i$ không/có nằm trong tập hợp. Xâu nhị phân này được gọi là **bitmask**.

Giả sử có một tập hợp $S=\{a_0,a_1,a_2, \ldots,a_{n-1}\}$.  Xét một tập con $T=\{a_{i_1},a_{i_2}, \ldots,a_{i_k}\}$. của $S$. Khi đó ta có thể biểu diễn $T$ bằng một xâu nhị phân độ dài $n$, với bit thứ $i$ (ở đây là bit có giá trị cao thứ $i$ hay bit thứ $i$ từ phải sang) bằng $1$ nếu $a_i$ nằm trong tập $T$:
$$
mask_T=000 \ldots 010 \ldots 010 \ldots 010 \ldots 000
$$
với các vị trí bằng $1$ là $i_1,i_2, \ldots,i_k$.

Do $mask_T$ là một xâu nhị phân, ta có thể biểu diễn nó bằng một số ở dạng thập phân. Ví dụ:
$12=(1100)_2$ biểu diễn tập con $T=\{a_2,a_3 \}$ của $S=\{a_0,a_1,a_2,a_3 \}$
$17=(010001)_2$ biểu diễn tập con $T=\{a_0,a_4 \}$ của $S=\{a_0,a_1,a_2,a_3,a_4,a_5 \}$
$0=(000)_2$ biểu diễn tập con $T=\emptyset$ của $S=\{a_0,a_1,a_2\}$

Khi duyệt tất cả các số từ $0$ đến $2^{n-1}$, ta sẽ duyệt qua mọi xâu nhị phân độ dài $n$, và cũng là duyệt qua tất cả các tập con của $S=\{a_0,a_1, \ldots,a_n\}$. Công việc duyệt này có độ phức tạp thời gian là $\mathcal{O}(2^{n})$.

Bạn đọc có thể làm thử [bài này](https://codeforces.com/contest/550/problem/B) để hiểu rõ hơn về biểu diễn tập hợp bằng bitmask.

## Phương pháp QHĐ Bitmask

### Bài toán

**Đề bài**: [Codeforces - 100589G](https://codeforces.com/gym/100589/problem/G)

Cho hai số nguyên dương $N$ và số tự nhiên $K$ ($N \leq 15, K \leq N$). Một hoán vị của dãy $[a_1, \ldots, a_n]$ là một cách sắp xếp lại dãy $a$ sao cho mọi phần tử của dãy đều xuấ hiện chính xác một lần. Đếm số hoán vị độ dài $N$ của dãy $[1, 2, \ldots, N]$ mà trong hoán vị đó, hai phần tử liên tiếp chênh lệch nhau không quá $K$. 
Ví dụ, với $N = 4, K = 2$, $[1, 3, 2, 4]$ là một hoán vị thoả mãn, còn $[4, 1, 2, 3]$ là một hoán vị không thoả mãn do $4 - 1 = 3 > 2$.

### Phân tích

Cách làm tự nhiên nhất đối với bài toán trên là sinh ra mọi hoán vị có thể của dãy $[1, 2, \ldots, N]$ (tạm gọi là dãy $a$) bằng cách sử dụng thuật toán quay lui. Độ phức tạp thời gian là $\mathcal{O}(N!)$; với $N \leq 15$ thì ta không thể sử dụng cách này.

Ta thử áp dụng tư tưởng quy hoạch động. Nếu xét theo vị trí, ta thấy phần tử ở vị trí $i$ phải sai khác phần tử ở $i-1$ của $a$ một khoảng không quá $K$. Cách này đưa ta tới cách gọi $dp[i][p]$ là số lượng dãy hoán vị sao cho phần tử thứ $i$ là $p$ và dễ dàng biểu diễn nó theo $dp[i - 1][p]$. Tuy nhiên, cách gọi này không đảm bảo được tính chất quan trọng của hoán vị: tất cả các phần tử trong dãy ban đầu phải xuất hiện chính xác một lần.

Để có được tính chất này, thay vì chỉ dùng vị trí, ta dùng hẳn một tập hợp để lưu lại tất cả các vị trí đã được thêm vào dãy trước đó. Gọi $dp[X][p]$ là số lượng dãy là hoán vị của $X \subset A$ và có phần tử cuối cùng được thêm vào $X$ là $p$. Khi thêm một phần tử $q$ vào $X$, ta cần chắc chắn rằng $q\notin X$, và $|q - p| \leq K$. Như vậy: 

$$
\forall q\notin X, dp[X\cup\{q\}][q] = \sum_{\substack{p\in  X,\\|q-p|\leq K}}dp[X][p].
$$

Với trường hợp cơ sở, ta có thể chọn $dp[\emptyset][\infty] = 1$. Dĩ nhiên, ta không thể biểu diễn $\infty$ trong mảng khi cài đặt được; trong trường hợp này ta có thể thay thế nó bằng $0$ và chấp nhận mọi trường hợp thêm $q$ vào $X$ nếu xuất hiện $p = 0$. Kết quả của bài toán là tổng số dãy được tạo ra từ dãy $a$ ban đầu với đầy đủ phần tử ở mọi trường hợp phần tử cuối cùng, tức $\sum\limits_{p=1}^{N} dp[a][p]$.

Còn để biểu diễn tập hợp $X$ khi cài đặt, ta sử dụng bitmask như đã nói ở trên.
- Mọi tập con $X$ của $a$ đều có thể được biểu diễn bằng một dãy nhị phân độ dài $N$, tương đương một số nguyên dương. Chẳng hạn, với $N = 4$, $dp[\{0, 2\}][1]$ được biểu diễn thành $dp[5][1]$, do $(0101)_2=5$.  Gọi biểu diễn nhị phân này là `mask`.
- Biểu diễn nhị phân của $X$ khi $X = a$ là `mask = (1 << N) - 1`
- Biểu diễn của $q\notin X$ là `((mask >> q) & 1) != 1` (tức là bit thứ $q$ của `mask` khác $1$)
- Biểu diễn của $X\cup \{q\}$ là `mask | (1 << q)`. 
- Để duyệt qua mọi trạng thái của tập $X$, ta duyệt mọi số nguyên tương ứng từ $0$ đến $2^{N}-1$ cho giá trị của `mask`.

Trong bài toán này, hoán vị phải được tạo thành bởi các số từ $1$ đến $N$. Nếu sử dụng cách biểu diễn trên, bit ở vị trí thứ $0$ không biểu diễn cái gì cả, hơn nữa phải dùng $N + 1$ bit mới biểu diễn hết được $N$ số này. Vì vậy, thay vì dùng bit thứ $q$ để biểu diễn việc $q$ có thuộc $X$ hay không, ta dùng bit thứ $q - 1$. Bằng cách này, ta chỉ cần đúng $N$ bit để biểu diễn tập hợp mà không lãng phí bit nào.

### Cài đặt

```cpp=
#include <bits/stdc++.h>
using namespace std;

const int MAXN = (1 << 15) + 1;

int n, k;
long long dp[MAXN][16];

//Lấy bit thứ k của số x
int getBit(int x, int k) {
    return (x >> k) & 1;
}

int solve(int n, int k) {
    for (int mask = 0; mask < (1 << n); mask++)
        for (int k = 0; k <= n; k++)
            dp[mask][k] = 0;

    //base case
    dp[0][0] = 1;

    for (int mask = 0; mask < (1 << n); mask++)
        for (int q = 1; q <= n; q++) {
            //check q nằm trong tập hợp (biểu diễn bằng mask)
            if (getBit(mask, q - 1))
                continue;
            for (int p = 0; p <= n; p++) {
                //check chênh lệch của q và p
                if (p != 0 && abs(q - p) > k)
                    continue;

                //thêm q vào tập hợp
                int newMask = mask | (1 << (q - 1));

                dp[newMask][q] += dp[mask][p];
            }
        }

    long long res = 0;
    int fullMask = (1 << n) - 1;
    for (int k = 1; k <= n; k++)
        res += dp[fullMask][k];
    return res;
}
```

Độ phức tạp về thời gian của cách cài đặt trên là $\mathcal{O}(N^{2}\times 2^{N})$, còn độ phức tạp về không gian là $\mathcal{O}(N\times 2^{N})$.

## Chú ý thêm

Ta thấy rằng nếu $m$ lớn, thuật toán cũng sẽ mất rất nhiều thời gian để chạy. Vì vậy, để thực hiện được phương pháp này thì $m$ cần phải đủ nhỏ, thường là $m \le 20$ nếu thuật toán chỉ yêu cầu ta phải duyệt qua các tập hợp.

Việc sử dụng biểu diễn bitmask của tập hợp và QHĐ bitmask giúp chúng ta kiểm tra được mọi tập hợp con của một tập hợp lớn hơn. Do vậy, trong nhiều trường hợp, đây là phương pháp đơn giản và đáng để thử khi muốn kiếm điểm một cách hiệu quả từ các subtask bé, cũng như có một code chắc chắn để làm tiếp với các subtask lớn hơn

## Bài tập tương tự
- [CSES - Counting Tilings](https://cses.fi/problemset/task/2181)
- [VNOJ - Atcoder Educational DP Contest U - Grouping
](https://oj.vnoi.info/problem/atcoder_dp_u)
- [Codeforces 453B - Little Pony and Harmony Chest](https://codeforces.com/problemset/problem/453/B)
- [Codeforces 165E - Compatible Numbers](https://codeforces.com/problemset/problem/165/E)
- [VOI 06 Bài 1 - QBSELECT](https://oj.vnoi.info/problem/qbselect)
- [VOI 23 Bài 4 - WHOME](https://oj.vnoi.info/problem/voi23_whome) (Subtask 1)
- [Bài tập trên USACO](https://usaco.guide/gold/dp-bitmasks?lang=cpp)
', '', '2026-10-06T10:32:19.011539');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_bfs', 'BFS (Breadth-first search)', 'graph', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/graph-theory/breadth-first-search.md', '["bfs", "tìm kiếm theo chiều rộng", "đường đi ngắn nhất không trọng số", "queue bfs"]', 'Thuật toán **duyệt đồ thị ưu tiên chiều rộng** *(Breadth-first search - BFS)* là một trong những thuật toán tìm kiếm cơ bản và thiết yếu trên đồ thị. Mà trong đó, những đỉnh nào gần đỉnh xuất phát hơn sẽ được duyệt trước.', '# BFS (Breadth-first search)

**Nguồn:** [CP-Algorithms](https://cp-algorithms.com/graph/breadth-first-search.html), [Giải thuật và lập trình - Lê Minh Hoàng](/algo/basic/Tai-Lieu-Thuat-Toan)

**Biên soạn:**
- Nguyễn Châu Khanh - VNU University of Engineering and Technology (VNU-UET)

**Reviewer:**
- Trần Quang Lộc - ITMO University
- Hoàng Xuân Nhật - VNUHCM-University of Science
- Trần Xuân Bách - HUS High School for Gifted Students

# Thuật toán duyệt đồ thị ưu tiên chiều rộng

Thuật toán **duyệt đồ thị ưu tiên chiều rộng** *(Breadth-first search - BFS)* là một trong những thuật toán tìm kiếm cơ bản và thiết yếu trên đồ thị. Mà trong đó, những đỉnh nào gần đỉnh xuất phát hơn sẽ được duyệt trước.

Ứng dụng của $\texttt{BFS}$ có thể giúp ta giải quyết tốt một số bài toán trong thời gian và không gian **tối thiểu**. Đặc biệt là bài toán tìm kiếm đường đi ngắn nhất từ một đỉnh gốc tới tất cả các đỉnh khác. Trong đồ thị không có trọng số hoặc tất cả trọng số bằng nhau, thuật toán sẽ luôn trả ra đường đi ngắn nhất có thể. Ngoài ra, thuật toán này còn được dùng để tìm các thành phần liên thông của đồ thị, hoặc kiểm tra đồ thị hai phía, ...

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_img1.png)

## Ý tưởng

Với đồ thị không trọng số và đỉnh nguồn $s$. Đồ thị này có thể là đồ thị có hướng hoặc vô hướng, điều đó **không quan trọng** đối với thuật toán.

Có thể hiểu thuật toán như một ngọn lửa lan rộng trên đồ thị:

- Ở bước thứ $0$, chỉ có đỉnh nguồn $s$ đang cháy.
- Ở mỗi bước tiếp theo, ngọn lửa đang cháy ở mỗi đỉnh lại lan sang tất cả các đỉnh kề với nó.

Trong mỗi lần lặp của thuật toán, "vòng lửa" lại lan rộng ra theo chiều rộng. Những đỉnh nào gần $s$ hơn sẽ bùng cháy trước.

Chính xác hơn, thuật toán có thể được mô tả như sau:

- Đầu tiên ta thăm đỉnh nguồn $s$.
- Việc thăm đỉnh $s$ sẽ phát sinh thứ tự thăm các đỉnh $(u_1, u_2, \ldots u_p)$ kề với $s$ (những đỉnh gần $s$ nhất). Tiếp theo, ta thăm đỉnh $u_1$, khi thăm đỉnh $u_1$ sẽ lại phát sinh yêu cầu thăm những đỉnh $(v_1, v_2, \ldots, v_q)$ kề với $u_1$. Nhưng rõ ràng những đỉnh $v$ này “xa” $s$ hơn những đỉnh $u$ nên chúng chỉ được thăm khi tất cả những đỉnh $u$ đều đã được thăm. Tức là thứ tự thăm các đỉnh sẽ là: $s, u_1, u_2, \ldots, u_p, v_1, v_2, \ldots, v_q, \ldots$

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_img2.png)

Thuật toán tìm kiếm theo chiều rộng sử dụng một danh sách để chứa những đỉnh đang “chờ” thăm. Tại mỗi bước, ta thăm một đỉnh đầu danh sách, loại nó ra khỏi danh sách và cho những đỉnh kề với nó chưa được thăm xếp hàng vào cuối danh sách. Thuật toán sẽ kết thúc khi danh sách rỗng.

## Thuật toán

Thuật toán sử dụng một cấu trúc dữ liệu hàng đợi *(queue)* để chứa các đỉnh sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

**Bước 1:** Khởi tạo
- Các đỉnh đều ở trạng thái chưa được đánh dấu. Ngoại trừ đỉnh nguồn $s$ đã được đánh dấu.
- Một hàng đợi ban đầu chỉ chứa $1$ phần tử là $s$.

**Bước 2:** Lặp lại các bước sau cho đến khi hàng đợi rỗng:
- Lấy đỉnh $u$ ra khỏi hàng đợi.
- Xét tất cả những đỉnh $v$ kề với $u$ mà chưa được đánh dấu, với mỗi đỉnh $v$ đó:
    * Đánh dấu $v$ đã thăm.
    * Lưu lại vết đường đi từ $u$ đến $v$.
    * Đẩy $v$ vào trong hàng đợi (đỉnh $v$ sẽ chờ được duyệt tại những bước sau).

**Bước 3:** Truy vết tìm đường đi.

## Mô tả

- Xét đồ thị sau đây, với đỉnh nguồn $s=1$ :

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_img3.png)
![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_img4.png)

- **Quá trình:**

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_gif1.gif)

## Cài đặt

**Cấu trúc dữ liệu:**

- Biến `maxN` - Kích thước mảng.
- Mảng `d[]` - Mảng lưu lại khoảng cách từ đỉnh nguồn đến mọi đỉnh.
- Mảng `par[]` - Mảng lưu lại vết đường đi.
- Mảng `visit[]` - Mảng đánh dấu các đỉnh đã thăm.
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh.
- Hàng đợi `q` - Chứa các đỉnh sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
int n; // Số lượng đỉnh của đồ thị
int d[maxN], par[maxN];
bool visit[maxN];
vector<int> g[maxN];

void bfs(int s) { // Với s là đỉnh xuất phát (đỉnh nguồn)
    fill_n(d, n + 1, 0);
    fill_n(par, n + 1, -1);
    fill_n(visit, n + 1, false);

    queue<int> q;
    q.push(s);
    visit[s] = true;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (auto v : g[u]) {
            if (!visit[v]) {
                d[v] = d[u] + 1;
                par[v] = u;
                visit[v] = true;
                q.push(v);
            }
        }
    }
}
```

### **Truy vết**

- Cài đặt truy vết đường đi từ đỉnh nguồn $s$ đến đỉnh $u$ :

```cpp
if (!visit[u])
    cout << "No path!";
else {
    vector<int> path;
    for (int v = u; v != -1; v = par[v])
        path.push_back(v);
    reverse(path.begin(), path.end());

    cout << "Path: ";
    for (auto v : path)
        cout << v << '' '';
}
```

## Các đặc tính của thuật toán

Nếu sử dụng một ngăn xếp *(stack)* thay vì hàng đợi *(queue)* thì ta sẽ thu được **thứ tự duyệt đỉnh** của thuật toán **tìm kiếm theo chiều sâu** *(Depth First Search – DFS)*. Đây chính là **phương pháp khử đệ quy** của $\texttt{DFS}$ để cài đặt thuật toán trên các ngôn ngữ không cho phép đệ quy.

**Định lí:** Thuật toán $\texttt{BFS}$ cho ta độ dài đường đi ngắn nhất từ đỉnh nguồn tới mọi đỉnh (với khoảng cách tới đỉnh $u$ bằng $d[u]$).
Trong thuật toán $\texttt{BFS}$, nếu đỉnh $u$ xa đỉnh nguồn hơn đỉnh $v$, thì $u$ sẽ được thăm trước.

- **Chứng minh:** Trong $\texttt{BFS}$, từ một đỉnh hiện tại, ta luôn đi thăm tất cả các đỉnh kề với nó trước, sau đó thăm tất cả các đỉnh cách nó một đỉnh, rồi các đỉnh cách nó hai đỉnh, v.v... Như vậy, nếu từ một đỉnh $u$ khi ta chạy $\texttt{BFS}$, quãng đường đến đỉnh $v$ luôn là quãng đường đi qua ít cạnh nhất.

## Định lý Bắt tay (Handshaking lemma)

**Định lý:** Trong một đồ thị bất kỳ, tổng số [bậc](https://vi.wikipedia.org/wiki/B%E1%BA%ADc_(l%C3%BD_thuy%E1%BA%BFt_%C4%91%E1%BB%93_th%E1%BB%8B)) của tất cả các đỉnh bằng **gấp đôi** số cạnh của đồ thị.

- **Mô tả:** Cho đồ thị $G=(V,E)$ gồm $\|V\|$ đỉnh và $\|E\|$ cạnh. Khi đó, tổng tất cả các bậc của đỉnh trong $G$ bằng $2 \times \|E\|$ .
    Với $\deg(v)$ là số bậc của đỉnh $v$, ta có: $\displaystyle\sum_{v \in V}\deg(v) = 2 \times \|E\|$
    - **Ví dụ:** Cho đồ thị sau với $\|V\| = 8$ và $\|E\| = 7$

        ![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_img5.png)

        - $\displaystyle\sum_{v \in V}\deg(v) = 2 \times \|E\| = 2 \times 7 = 14$

- **Chứng minh:** Vì mỗi một cạnh nối với đúng hai đỉnh của đồ thị, nên một cạnh sẽ đóng góp $2$ đơn vị vào tổng số bậc của tất cả các đỉnh.

**Hệ quả:** Trong đồ thị, số lượng **đỉnh bậc lẻ** luôn là một số chẵn.
- **Chứng minh:** Gọi $L$ và $C$ lần lượt là tập các đỉnh bậc lẻ và bậc chẵn của đồ thị $G=(V, E)$. Ta có:
    $2 \times \|E\| = \displaystyle\sum_{v \in V}\deg(v) = \displaystyle\sum_{v \in L}\deg(v) + \displaystyle\sum_{v \in C}\deg(v)$

    - $2 \times \|E\|$ chẵn
    - $\displaystyle\sum_{v \in C}\deg(v)$ chẵn

    $\Rightarrow$ $\displaystyle\sum_{v \in L}\deg(v)$ chẵn

**Nhận xét:**
- Trong quá trình duyệt đồ thị được biểu diễn bằng **danh sách kề**, mỗi cạnh sẽ được duyệt chính xác hai lần đối với **đồ thị vô hướng** (vì mỗi cạnh sẽ được lưu trong $2$ danh sách kề của $2$ đỉnh). Còn đối với **đồ thị có hướng**, mọi cạnh của đồ thị chỉ được duyệt chính xác một lần.

**Tham khảo:** [Handshaking_lemma](https://en.wikipedia.org/wiki/Handshaking_lemma)

## Độ phức tạp thuật toán

### **Độ phức tạp thời gian**

Gọi $\|V\|$ là số lượng đỉnh và $\|E\|$ là số lượng cạnh của đồ thị.

Trong quá trình $\texttt{BFS}$, cách biểu diễn đồ thị có ảnh hưởng lớn tới chi phí về thời gian thực hiện giải thuật :
- Nếu đồ thị biểu diễn bằng **danh sách kề** (vector `g[]`) :
    - Ta có thể thực hiện thuật toán này một cách **tối ưu nhất** về mặt thời gian nhờ khả năng duyệt qua các đỉnh kề của mỗi đỉnh một cách **hiệu quả**.
    - Vì ta sử dụng mảng `visit[]` để ngăn việc đẩy một đỉnh vào hàng đợi nhiều lần nên mỗi đỉnh sẽ được thăm **chính xác một lần** duy nhất. Do đó, ta mất độ phức tạp thời gian $\mathcal{O}(\|V\|)$ dành cho việc thăm các đỉnh.
    - Bất cứ khi nào một đỉnh được thăm, mọi cạnh kề với đỉnh đó đều được duyệt, với thời gian dành cho mỗi cạnh là $\mathcal{O}(1)$. Từ phần nhận xét của **định lý Bắt tay *(Handshaking lemma)***, ta sẽ mất độ phức tạp thời gian $\mathcal{O}(\|E\|)$ dành cho việc duyệt các cạnh.
    - Nhìn chung, độ phức tạp thời gian của thuật toán này là $\mathcal{O}(\|V\|+\|E\|)$. Đây là cách cài đặt tốt nhất.
- Nếu đồ thị được biểu diễn bằng **ma trận kề** :
    - Ta cũng sẽ mất độ phức tạp thời gian $\mathcal{O}(\|V\|)$ dành cho việc thăm các đỉnh *(giải thích tương tự như trên)*.
    - Với mỗi đỉnh được thăm, ta sẽ phải duyệt qua toàn bộ các đỉnh của đồ thị để kiểm tra đỉnh kề với nó. Do đó, thuật toán sẽ mất độ phức tạp $\mathcal{O}(\|V\|^2)$.

### **Độ phức tạp không gian**

Tại mọi thời điểm, trong hàng đợi (queue `q`) có không quá $\|V\|$ phần tử. Do đó, độ phức tạp bộ nhớ là $\mathcal{O}(\|V\|)$.

# Ứng dụng BFS để xác định thành phần liên thông

## **Bài toán 1**

[BDFS - Đếm số thành phần liên thông](http://lequydon.ntucoder.net/Problem/Details/4601)

### **Đề bài**

Cho đơn đồ thị vô hướng gồm $n$ đỉnh và $m$ cạnh $(1 \le n, m \le 10^{5})$, các đỉnh được đánh số từ $1$ tới $n$. Tìm số [thành phần liên thông](https://vi.wikipedia.org/wiki/Th%C3%A0nh_ph%E1%BA%A7n_li%C3%AAn_th%C3%B4ng) của đồ thị.

### **Ý tưởng**

Một đồ thị có thể liên thông hoặc không liên thông. Nếu đồ thị liên thông thì số thành phần liên thông của nó là $1$. Điều này tương đương với phép duyệt theo thủ tục $\texttt{BFS}$ được gọi đến **đúng một lần**. Nếu đồ thị không liên thông (số thành phần liên thông lớn hơn $1$) ta có thể tách chúng thành những **đồ thị con liên thông**. Điều này cũng có nghĩa là trong phép duyệt đồ thị, số thành phần liên thông của nó bằng số lần gọi tới thủ tục $\texttt{BFS}$.

### **Thuật toán**

Thuật toán ứng dụng $\texttt{BFS}$ để xác định thành phần liên thông:
- **Bước 0:** Khởi tạo số lượng thành phần liên thông bằng $0$.
- **Bước 1:** Xuất phát từ một đỉnh chưa được đánh dấu của đồ thị. Ta đánh dấu đỉnh xuất phát, tăng số thành phần liên thông thêm $1$.
- **Bước 2:** Từ một đỉnh $i$ đã đánh dấu, ta đánh dấu tất cả các đỉnh $j$ kề với $i$ mà $j$ chưa được đánh dấu.
- **Bước 3:** Thực hiện bước $2$ cho đến khi không còn thực hiện được nữa.
- **Bước 4:** Nếu số số đỉnh đánh dấu bằng $n$ (mọi đỉnh đều được đánh dấu) kết thúc thuật toán và trả về số thành phần liên thông, ngược lại quay về bước $1$.

### **Mô tả**

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_gif2.gif)

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `maxN = 100007`.
- Biến `components` - Số lượng thành phần liên thông.
- Mảng `visit[]` - Mảng đánh dấu các đỉnh đã thăm.
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh.
- Hàng đợi `q` - Chứa các đỉnh sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 1e5 + 7;

int n, m, components = 0;
bool visited[maxN];
vector<int> g[maxN];

void bfs(int s) {
    ++components;
    queue<int> q;
    q.push(s);
    visited[s] = true;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (auto v : g[u]) {
            if (!visited[v]) {
                visited[v] = true;
                q.push(v);
            }
        }
    }
}

int main() {
    cin >> n >> m;
    while (m--) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(v);
        g[v].push_back(u);
    }

    fill_n(visited, n + 1, false);
    for (int i = 1; i <= n; ++i)
        if (!visited[i])
            bfs(i);
    cout << components;
}
```

### **Đánh giá**

Ta cũng có thể sử dụng  thuật toán tìm kiếm theo chiều sâu *(Depth First Search – DFS)* để xác định thành phần liên thông.

**Độ phức tạp**

Độ phức tạp của thuật toán là $\mathcal{O}(n + m)$.

## Thuật toán loang (Flood Fill)

**Thuật toán loang *(thuật toán vết dầu loang)*** là một kĩ thuật sử dụng $\texttt{BFS}$ để tìm tất cả các điểm có thể đi tới. Điểm khác biệt giữa **Loang** so với đa số những bài $\texttt{BFS}$ là ta không phải tìm chi phí nhỏ nhất.

Thuật toán loang được dùng khá nhiều trong tin học, điển hình là **thuật toán loang trên ma trận** được ứng dụng để đếm số **thành phần liên thông** trên ma trận. Ngoài ra, nó còn ứng dụng trong các **bài toán thực tế** như các bài toán tìm đường đi, game dò mìn, game line98,...

Gọi là thuật toán loang vì nguyên lí của thuật toán này rất giống với hiện tượng loang của chất lỏng. Khi ta nhỏ dầu xuống một mặt phẳng, vết dầu có thể loang ra những khu vực xung quanh. Tương tự, thuật toán loang trên ma trận cũng vậy, ta sẽ duyệt một ô trên ma trận và sau đó duyệt các điểm xung quanh nó và loang dần ra để giải quyết bài toán.

## **Bài toán 2**

[UCV2013H - Slick](https://www.spoj.com/problems/UCV2013H/)

### **Đề bài**

Một tai nạn hàng hải đã khiến dầu tràn ra biển. Để có được thông tin về mức độ nghiêm trọng của thảm họa này, người ta phải phân tích các hình ảnh chụp từ vệ tinh, từ đó tính toán chi phí khắc phục cho phù hợp. Đối với điều này, số lượng vết dầu loang trên biển và kích thước của mỗi vết loang phải được xác định. Vết loang là một mảng dầu nổi trên mặt nước.

Để tiện cho việc xử lí, hình ảnh được chuyển đổi thành một ma trận nhị phân kích thước $N \times M$ $(1 \le N, M \le 250)$. Với $1$ là ô bị nhiễm dầu, và $0$ là ô không bị nhiễm dầu. Vết dầu loang là tập hợp của một số ô bị nhiễm dầu có chung cạnh.

Họ đã thuê bạn để giúp họ xử lí hình ảnh. Công việc của bạn là đếm số lượng vết loang trên biển và kích thước tương ứng của từng vết.

### **Ý tưởng**

Ta xây dựng một **mô hình đồ thị** của bài toán như sau:
- Gọi mỗi đỉnh của đồ thị tương ứng với mỗi ô $1$ *(ô bị nhiễm dầu)* của ma trận.
- Tồn tại một cạnh nối giữa cặp đỉnh $(u, v)$ khi và chỉ khi ô tương ứng với đỉnh $u$ kề cạnh với ô tương ứng với đỉnh $v$ và cả hai ô đều là ô $1$.

Khi đó, bài toán quy về thành bài toán **xác định thành phần liên thông của đồ thị**. Trong đó, mỗi thành phần liên thông tương ứng với mỗi một vết dầu loang.

Nghĩa là, số lượng thành phần liên thông của đồ thị chính là số lượng vết dầu loang. Và số lượng đỉnh nằm trong cùng một thành phần liên thông là kích thước của vết loang tương ứng.

### **Thuật toán**

Áp dụng **thuật toán loang trên ma trận** để xác định thành phần liên thông:
- Khởi tạo số lượng vết dầu bằng $0$.
- Duyệt dần từng ô của ma trận, nếu ô đang xét là một ô bị nhiễm dầu (ô $1$) và chưa được đánh dấu:
    * Đánh dấu lại ô đó.
    * Tăng số lượng vết dầu thêm $1$.
    * Thực hiện thủ tục $\texttt{BFS}$ xuất phát từ ô đó để loang ra các ô xung quanh như sau:
        * Khởi tạo kích thước của vết dầu đang xét là $1$.
        * Tiếp tục thực hiện công việc sau cho đến khi không còn thực hiện được nữa: Từ một ô đã đánh dấu, ta đánh dấu tất cả các ô bị nhiễm dầu kề cạnh với ô đó mà chưa được đánh dấu. Mỗi lần đánh dấu lại một ô thì ta tăng kích thước của vết dầu thêm $1$.
        * Sử dụng $1$ mảng để lưu lại kích thước của từng vết loang.
- Nếu tất cả các ô bị nhiễm dầu đều đã được đánh dấu, trả ra kết quả và kết thúc thuật toán.

### **Mô tả**

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_gif3.gif)

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `maxN = 300`.
- Mảng `visit[][]` - Mảng đánh dấu các ô đã duyệt.
- Vector `slicks` - Lưu kích thước của mỗi vết dầu loang.
- Hàng đợi `q` - Chứa các ô sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 300;

int n, m;
bool a[maxN][maxN], visited[maxN][maxN];
vector<int> slicks;
int moveX[] = {0, 0, 1, -1};
int moveY[] = {1, -1, 0, 0};

// Thủ tục cài đặt lại cấu trúc dữ liệu sau mỗi bộ test
void reset() {
    slicks.clear();
    for (int i = 1; i <= n; ++i)
        fill_n(visited[i], m + 1, false);
}

int bfs(int sx, int sy) {
    int sizeSlicks = 1; // Biến đếm số lượng đỉnh thuộc thành phần liên thông
    queue<pair<int, int>> q;
    q.push({sx, sy});
    visited[sx][sy] = true;
    while (!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int u = x + moveX[i];
            int v = y + moveY[i];

            if (u > n || u < 1)
                continue;
            if (v > m || v < 1)
                continue;

            if (a[u][v] && !visited[u][v]) {
                ++sizeSlicks;
                visited[u][v] = true;
                q.push({u, v});
            }
        }
    }
    return sizeSlicks;
}

int main() {
    while (cin >> n >> m) {
        if (!n && !m)
            return 0;

        for (int i = 1; i <= n; ++i)
            for (int j = 1; j <= m; ++j)
                cin >> a[i][j];

        for (int i = 1; i <= n; ++i)
            for (int j = 1; j <= m; ++j)
                if (a[i][j] && !visited[i][j])
                    slicks.push_back(bfs(i, j));

        cout << slicks.size() << ''\n'';

        sort(slicks.begin(), slicks.end());
        slicks.push_back(1e9);
        int number = 0, pre = slicks[0];
        for (auto v : slicks)
            if (v != pre) {
                cout << pre << '' '' << number << ''\n'';
                pre = v;
                number = 1;
            } else
                ++number;

        reset();
    }
}
```

### **Đánh giá**

Ta sử dụng $2$ mảng `moveX[]` và `moveY[]` để có thể dễ dàng duyệt qua tất cả các ô kề cạnh với ô đang xét.

**Độ phức tạp**

Với mỗi bộ test:
- Vì mỗi ô của ma trận được duyệt đúng duy nhất $1$ lần nên ta sẽ mất độ phức tạp $\mathcal{O}(N \times M)$.
- Ta sẽ mất thêm $\mathcal{O}(4 \times N \times M)$ vì ta phải duyệt qua $4$ ô kề cạnh với mỗi ô của ma trận.

Nhìn chung, độ phức tạp của thuật toán là $\mathcal{O}(t \times (N \times M + 4 \times N \times M))$. Với $t$ là số lượng bộ test.

## **Bài tập áp dụng**

[BCDAISY - Chú bò hư hỏng](https://www.spoj.com/PTIT/problems/BCDAISY/)

[BCLKCOUN - Đếm số ao](https://www.spoj.com/PTIT/problems/BCLKCOUN/)

[BCISLAND - Nước biển](https://www.spoj.com/PTIT/problems/BCISLAND/)

[MTNTRAI - Nông Trại](https://www.spoj.com/THPTCBT/problems/MTNTRAI/)

[NKGUARD - Bảo vệ nông trang](https://oj.vnoi.info/problem/nkguard)

[Damage - Động đất](https://oj.vnoi.info/problem/damage)

[KOZE - Sheep](https://www.spoj.com/problems/KOZE/)

[CSES - Counting Rooms](https://cses.fi/problemset/task/1192)

# Ứng dụng BFS để tìm đường đi ngắn nhất trong đồ thị không trọng số

Những bài sử dụng $\texttt{BFS}$ thường yêu cầu tìm số bước ít nhất (hoặc đường đi ngắn nhất) từ điểm đầu đến điểm cuối. Bên cạnh đó, đường đi giữa $2$ điểm bất kì thường có chung trọng số (và thường là $1$). Phổ biến nhất là dạng bài cho bảng $N \times M$, có những ô đi qua được và những ô không đi qua được. Bảng này có thể là mê cung, sơ đồ, các thành phố hoặc các thứ các thứ tương đương. Có thể nói đây là những bài toán $\texttt{BFS}$ kinh điển.

Hãy xem xét bài toán sau đây:

## **Bài toán 3**

[Vmunch - Gặm cỏ](https://oj.vnoi.info/problem/vmunch)

### **Đề bài**

Cho một bảng hình chữ nhật chia thành lưới ô vuông kích thước $R \times C$ ($1 \le R, C \le 100$). Mỗi ô mang $1$ trong $4$ giá trị sau : `.` , `*` , `B` , `C`. Cô bò Bessie đang đứng ở ô `C` và cần đi đến ô `B`. Mỗi bước đi Bessie có thể đi từ $1$ ô vuông sang $4$ ô vuông khác kề cạnh nhưng không được đi vào ô `*` hay đi ra khỏi bảng. Hãy tìm số bước đi ít nhất để Bessie đến được ô `B`.

Đảm bảo chỉ có duy nhất $1$ ô `B` và $1$ ô `C` trong bảng, và luôn tồn tại đường đi từ `C` đến `B`.

### **Phân tích**

Theo mối quan hệ được xây dựng trong đề bài, Bessie có thể di chuyển từ $1$ ô vuông sang $4$ ô vuông khác kề cạnh. Từ đó, ta có thể xây dựng một **mô hình đồ thị** của bài toán:
- Gọi mỗi đỉnh của đồ thị tương ứng với mỗi ô trong lưới ô vuông.
- Tồn tại một cạnh nối giữa cặp đỉnh $(u, v)$ khi và chỉ khi từ ô tương ứng với đỉnh $u$ có thể di chuyển đến ô tương ứng với đỉnh $v$ (đồng nghĩa, ô tương ứng với đỉnh $u$ kề cạnh với ô tương ứng với đỉnh $v$ và cả $2$ ô đều **không phải** là ô `*` ).

Sau khi xây dựng được đồ thị, bài toán quy về như sau: Tìm đường đi ngắn nhất từ đỉnh tương ứng với ô `C` đến đỉnh tương ứng với ô `B`. Độ dài đường đi ngắn nhất đó chính là số bước ít nhất mà Bessie cần thực hiện.

Vậy để tìm được kết quả bài toán, ta sẽ áp dụng thuật toán $\texttt{BFS}$.

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `maxN = 110`.
- Mảng `d[][]` - Mảng lưu số bước ít nhất để đi từ ô xuất phát đến mỗi ô khác.
- Mảng `visit[][]` - Mảng đánh dấu các ô đã đi qua.
- Hàng đợi `q` - Chứa các ô sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 110;

int r, c;
char a[maxN][maxN];
int d[maxN][maxN];
bool visited[maxN][maxN];
int moveX[] = {0, 0, 1, -1};
int moveY[] = {1, -1, 0, 0};

void bfs(int sx, int sy) {
    for (int i = 1; i <= r; ++i) {
        fill_n(d[i], c + 1, 0);
        fill_n(visited[i], c + 1, false);
    }

    queue<pair<int, int>> q;
    q.push({sx, sy});
    visited[sx][sy] = true;
    while (!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();

        // Nếu gặp được ô B thì kết thúc thủ tục BFS
        if (a[x][y] == ''B'')
            return;

        for (int i = 0; i < 4; ++i) {
            int u = x + moveX[i];
            int v = y + moveY[i];

            if (u > r || u < 1)
                continue;
            if (v > c || v < 1)
                continue;
            if (a[u][v] == ''*'')
                continue;

            if (!visited[u][v]) {
                d[u][v] = d[x][y] + 1;
                visited[u][v] = true;
                q.push({u, v});
            }
        }
    }
}

int main() {
    int sx, sy, tx, ty;
    cin >> r >> c;
    for (int i = 1; i <= r; ++i)
        for (int j = 1; j <= c; ++j) {
            cin >> a[i][j];
            if (a[i][j] == ''C'') {
                sx = i;
                sy = j;
            }
            if (a[i][j] == ''B'') {
                tx = i;
                ty = j;
            }
        }

    bfs(sx, sy);
    cout << d[tx][ty];
}
```

### **Đánh giá**

Ta sử dụng $2$ mảng `moveX[]` và `moveY[]` để có thể dễ dàng duyệt qua tất cả các ô kề cạnh với ô đang xét.

**Độ phức tạp**

Giống như $\texttt{BFS}$ thông thường, độ phức tạp của bài toán là $\mathcal{O}(\|V\| + \|E\|)$ (với $\|V\|$ là số đỉnh và $\|E\|$ là số cạnh của đồ thị). Trong đó, số đỉnh của đồ thị bằng số lượng ô vuông của bảng (nghĩa là $\|V\| = R \times C$ ). Trong **trường hợp tệ nhất**, tại mỗi ô đều có thể đi sang $4$ ô kề cạnh, nên đồ thị sẽ có khoảng $4 \times \|V\|$ cạnh.

Mặc dù trong quá trình $\texttt{BFS}$, khi gặp được ô `B` thì thủ tục $\texttt{BFS}$ kết thúc luôn nên độ phức tạp thực tế có thể ít hơn so với tính toán. Nhưng trong **trường hợp tệ nhất** là ta phải đi hết tất cả các ô khác xong mới đến được ô `B`. Nên nhìn chung, độ phức tạp của thuật toán là $\mathcal{O}(R \times C + 4 \times R \times C)$.

## **Bài toán 4**

[ELEVTRBL - Elevator Trouble](https://www.spoj.com/problems/ELEVTRBL/)

### **Đề bài**

Trong một tòa nhà có $f$ tầng, các tầng được đánh số từ $1$ đến $f$, hiện tại bạn đang đứng tại tầng $s$ và cần đi đến tầng $g$. Tại mỗi tầng, thang máy chỉ có $2$ nút là "UP u" và "DOWN d" :
- Nút "UP u" có thể đưa bạn lên đúng $u$ tầng nếu như có đủ số tầng phía trên.
- Nút "DOWN d" có thể đưa bạn xuống đúng $d$ tầng nếu như có đủ số tầng phía dưới.

Trường hợp không có đủ số tầng thì thang máy sẽ không lên hoặc không xuống. Hãy tính số lần phải bấm nút ít nhất để có thể đến được tầng $g$.

$$
1 \le s, g \le f \le 10^{6}; 0 \le u, d \le 10^{6}.
$$

### **Phân tích**

**Ghi chú:** Từ ứng dụng **tìm đường đi ngắn nhất trong đồ thị không trọng số**, ta có thể áp dụng để giải quyết các vấn đề hoặc trò chơi có số lần di chuyển ít nhất, nếu mỗi trạng thái của nó có thể được biểu diễn bằng một đỉnh của đồ thị và việc chuyển đổi từ trạng thái này sang trạng thái khác là các cạnh của đồ thị.

Với bài toán này ta **không thể** sử dụng thuật toán vét cạn, hay quay lui có điều kiện vì số lượng tầng ở đây có thể lên đến $10^{6}$ dẫn tới việc chương trình có thể **chạy quá thời gian**.

Thay vào đó, ta sẽ sử dụng thuật toán $\texttt{BFS}$. Tư tưởng ở đây là ta sẽ đi tính số lần bấm nút nhỏ nhất để đến được mỗi tầng.

Từ mối quan hệ được xây dựng trong bài toán, ta có thể xây dựng một **mô hình đồ thị** như sau:
- Gọi mỗi đỉnh của đồ thị tương ứng với mỗi tầng của tòa nhà.
- Nếu từ tầng $x$ ta có thể đến được tầng $y$ bằng một lần bấm nút thì tồn tại cạnh nối $1$ chiều từ đỉnh $x$ đến đỉnh $y$. Tương đương với việc tồn tại cạnh $x \rightarrow (x + u)$ (nếu $(x + u) \le f$ ) và cạnh $x \rightarrow (x - d)$ (nếu $(x - d) \ge 1$ ).

Sau khi xây dựng được đồ thị, đường đi ngắn nhất từ đỉnh $s$ đến đỉnh $g$ chính là số lần bấm nút ít nhất cần thực hiện.

Vậy để tìm được kết quả bài toán, ta sẽ áp dụng thuật toán $\texttt{BFS}$.

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `maxN = 1000007`.
- Mảng `number[]` - Mảng lưu lại số lần bấm nút ít nhất để đến được mỗi tầng.
- Mảng `visit[]` - Mảng đánh dấu lại các tầng đã đến.
- Hàng đợi `q` - Chứa các tầng sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 1e6 + 7;

int f, s, g, u, d;
int visited[maxN], number[maxN];

void bfs() {
    fill_n(number, f + 1, 0);
    fill_n(visited, f + 1, false);

    queue<int> q;
    q.push(s);
    visited[s] = true;
    while (!q.empty()) {
        int x = q.front();
        q.pop();

        // Nếu gặp được tầng đích thì kết thúc thủ tục BFS
        if (x == g)
            return;

        for (int y : {x + u, x - d}) {
            if (y > f || y < 1)
                continue;

            if (!visited[y]) {
                visited[y] = true;
                number[y] = number[x] + 1;
                q.push(y);
            }
        }
    }

    // Kết thúc quá trình BFS mà ko đến được tầng đích
    number[g] = -1;
}

int main() {
    cin >> f >> s >> g >> u >> d;
    bfs();
    if (number[g] != -1)
        cout << number[g];
    else
        cout << "use the stairs";
}
```

### **Đánh giá**

**Độ phức tạp**

Độ phức tạp của bài toán là $\mathcal{O}(\|V\| + \|E\|)$ (với $\|V\|$ là số đỉnh và $\|E\|$ là số cạnh của đồ thị). Trong đó, số đỉnh của đồ thị bằng số tầng của tòa nhà (nghĩa là $\|V\| = f$ ). Đa số mỗi tầng đều có thể đi đến $2$ tầng khác, nên đồ thị sẽ có khoảng $2 \times \|V\|$ cạnh.

Nhìn chung, độ phức tạp của thuật toán là $\mathcal{O}(f + 2 \times f)$.

## Bài toán 5

[cjpaysballas - CJ thanh toán BALLAS](https://lqdoj.edu.vn/problem/cjpaysballas)

### **Đề bài**

Cho một đồ thị có hướng gồm $N$ đỉnh và $M$ cạnh $(1 \le N \le 10^{5}; 1 \le M \le 10^{6})$. Các đỉnh được đánh số từ $1$ đến $N$. Hãy tìm đường đi ngắn nhất xuất phát tại đỉnh $s$ và kết thúc tại đỉnh $t$. Nếu có nhiều đường đi ngắn nhất thỏa mãn, thì chỉ ra đường đi có **thứ tự từ điển nhỏ nhất** trong số đó.

Đảm bảo luôn tồn tại ít nhất một đường đi từ $s$ đến $t$.

### **Phân tích**

**Định lí:** Nếu ta sắp xếp các **danh sách kề** của mỗi đỉnh theo **thứ tự tăng dần** thì thuật toán $\texttt{BFS}$ luôn trả về đường đi có **thứ tự từ điển nhỏ nhất** trong số những đường đi ngắn nhất.

- **Chứng minh:** Trong quá trình $\texttt{BFS}$, nếu các đỉnh được đưa vào hàng đợi *(queue)* theo thứ tự từ điển tăng dần thì theo cơ chế hoạt động $\texttt{FIFO}$ *(First In - First Out)*, các đỉnh có thứ tự từ điển nhỏ hơn sẽ được thăm trước.

Từ **định lí** trên, ta sẽ sắp xếp lại thứ tự đỉnh kề theo thứ tự tăng dần để đảm bảo đường đi được in ra theo thứ tự từ điển. Sau đó sử dụng $\texttt{BFS}$ kết hợp với truy vết để giải quyết bài toán.

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Mảng `par[]` - Mảng lưu lại vết đường đi.
- Mảng `visit[]` - Mảng đánh dấu các đỉnh đã thăm.
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh.
- Hàng đợi `q` - Chứa các đỉnh sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 1e5 + 7;

int n, m, s, t;
int par[maxN];
bool visited[maxN];
vector<int> g[maxN];

void bfs(int s) {
    fill_n(par, n + 1, -1);
    fill_n(visited, n + 1, false);

    queue<int> q;
    q.push(s);
    visited[s] = true;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (auto v : g[u]) {
            if (!visited[v]) {
                par[v] = u;
                visited[v] = true;
                q.push(v);
            }
        }
    }
}

int main() {
    cin >> n >> m >> s >> t;
    while (m--) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(v);
    }

    // Sắp xếp danh sách kề
    for (int i = 1; i <= n; ++i)
        sort(g[i].begin(), g[i].end());

    bfs(s);

    // Truy vết
    vector<int> path;
    for (int v = t; v != -1; v = par[v])
        path.push_back(v);
    reverse(path.begin(), path.end());

    for (auto v : path)
        cout << v << '' '';
}
```

### **Đánh giá**

**Độ phức tạp**
- Độ phức tạp của thuật toán là $\mathcal{O}(N + M)$.

## **Bài tập áp dụng**

[BFS - BFS Cơ bản](https://lqdoj.edu.vn/problem/bfs)

[Kandp - Mã và tốt](https://oj.vnoi.info/problem/kandp)

[NAKANJ - Minimum Knight moves !!!](https://www.spoj.com/problems/NAKANJ/)

[DIGOKEYS - Find the Treasure](https://www.spoj.com/problems/DIGOKEYS/)

[MICEMAZE - Mice and Maze](https://www.spoj.com/problems/MICEMAZE/)

[INVESORT - Inversion Sort](https://www.spoj.com/problems/INVESORT/)

[ONEZERO - Ones and zeros](https://www.spoj.com/problems/ONEZERO/en/)

[CATM - The Cats and the Mouse](https://www.spoj.com/problems/CATM/)

[NATALIAG - Natalia Plays a Game](https://www.spoj.com/problems/NATALIAG/)

[MULTII - Yet Another Multiple Problem](https://www.spoj.com/problems/MULTII/)

[Cycle in Maze - 769C Codeforces](https://codeforces.com/contest/769/problem/C)

[Okabe and City - 821D Codeforces](https://codeforces.com/contest/821/problem/D)

[Police Stations - 796D Codeforces](https://codeforces.com/contest/796/problem/D)

[CSES - Labyrinth](https://cses.fi/problemset/task/1193)

[CSES - Message Route](https://cses.fi/problemset/task/1667/)

[CSES - Monsters](https://cses.fi/problemset/task/1194)

# Ứng dụng BFS để tìm chu trình ngắn nhất trong đồ thị có hướng không trọng số

## **Bài toán 6**

<!-- [ADACYCLE - Ada and Cycle](https://www.spoj.com/problems/ADACYCLE/) -->

### **Đề bài**

Ada đang có một chuyến đi ở Bugindia. Ở đó có nhiều thành phố và những con đường một chiều nối giữa chúng. Ada rất băn khoăn về việc tìm con đường ngắn nhất bắt đầu tại một thành phố và kết thúc ở cùng một thành phố. Vì Ada thích những chuyến đi ngắn, cô ấy đã nhờ bạn tìm độ dài của con đường như vậy cho mỗi thành phố ở Bugindia.

**Input**

- Dòng đầu tiên chứa số $N$ $(0 < N \le 200)$ là số lượng thành phố.
- $N$ dòng tiếp theo, mỗi dòng chứa $N$ số nguyên $H_{ij}$ $(0 \le H_{ij} \le 1)$ . Nghĩa là, nếu $H_{ij} = 1$ thì tồn tại một con đường nối từ thành phố $i$ đến thành phố $j$. Ngược lại, nếu $H_{ij} = 0$ thì không tồn tại con đường.

**Output**

- Gồm $N$ dòng: Dòng thứ $i$ in ra độ dài của con đường ngắn nhất bắt đầu từ thành phố $i$ và kết thúc ở thành phố $i$. Nếu không tồn tại con đường nào như vậy, hãy in ra "**NO WAY**" để thay thế.

### **Phân tích**

Theo yêu cầu đề bài, với mỗi thành phố, ta phải tìm độ dài con đường ngắn nhất bắt đầu và kết thúc ở cùng một thành phố đó.

Ta coi các thành phố là các đỉnh của đồ thị và các con đường $1$ chiều là các cạnh có hướng của đồ thị.

Đồng nghĩa với việc, với mỗi đỉnh của đồ thị, ta phải tìm độ dài của **chu trình ngắn nhất** chứa đỉnh đó. Vì thứ tự duyệt các đỉnh của thuật toán $\texttt{BFS}$ luôn bắt đầu duyệt từ các đỉnh gần đỉnh nguồn nhất cho đến các đỉnh nằm ở xa đỉnh nguồn. Do đó, ta có thể áp dụng **tính chất** này của $\texttt{BFS}$ để có thể tìm ra đỉnh $u$ nằm gần đỉnh nguồn nhất sao cho có cạnh nối từ $u$ đến đỉnh nguồn.

Đường đi ngắn nhất từ đỉnh nguồn đến đỉnh $u$, rồi từ $u$ trở lại đỉnh nguồn bằng $1$ cạnh có hướng, chính là **chu trình ngắn nhất** chứa đỉnh nguồn.

### **Mô tả**

- Thực hiện $\texttt{BFS}$ bắt đầu tại đỉnh $S$ :

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_gif4.gif)

### **Thuật toán**

Với mỗi đỉnh của đồ thị, ta thực hiện $\texttt{BFS}$ bắt đầu từ đỉnh đó.

Trong quá trình $\texttt{BFS}$, ghi nhận khoảng cách từ đỉnh nguồn đến đỉnh đang duyệt, nếu gặp lại đỉnh nguồn thì đó là **chu trình ngắn nhất** chứa đỉnh nguồn. Lúc này, ta in ra độ dài chu trình và kết thúc $\texttt{BFS}$, rồi bắt đầu thực hiện một $\texttt{BFS}$ mới từ đỉnh tiếp theo.

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `maxN = 210`.
- Mảng `visit[]` - Mảng đánh dấu các đỉnh đã thăm.
- Mảng `d[]` - Mảng lưu lại khoảng cách từ đỉnh nguồn đến mọi đỉnh.
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh.
- Hàng đợi `q` - Chứa các đỉnh sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 210;

int n;
int visited[maxN], d[maxN];
vector<int> g[maxN];

int bfs(int s) {
    fill_n(d, n + 1, 0);
    fill_n(visited, n + 1, false);

    queue<int> q;
    q.push(s);
    visited[s] = true;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (auto v : g[u]) {
            // Nếu gặp lại đỉnh nguồn, trả ra độ dài chu trình và kết thúc BFS
            if (v == s)
                return d[u] + 1;

            if (!visited[v]) {
                d[v] = d[u] + 1;
                visited[v] = true;
                q.push(v);
            }
        }
    }
    return 0;
}

int main() {
    cin >> n;
    for (int i = 1; i <= n; ++i)
        for (int j = 1; j <= n; ++j) {
            int h;
            cin >> h;
            if (h)
                g[i].push_back(j);
        }

    for (int i = 1; i <= n; ++i) {
        int ans = bfs(i);
        if (ans)
            cout << ans << ''\n'';
        else
            cout << "NO WAY\n";
    }
}
```

### **Đánh giá**

Từ bài toán này, ta có thể áp dụng để **tìm chu trình ngắn nhất trong đồ thị có hướng không trọng số** bằng cách lấy ra chu trình ngắn nhất trong tất cả các chu trình chứa mỗi đỉnh (nhiều nhất một chu trình từ mỗi $\texttt{BFS}$ bắt đầu từ $1$ đỉnh).

**Độ phức tạp**

Theo đề bài, đồ thị ban đầu được biểu diễn bằng **ma trận kề**. Nên để tối ưu về mặt thời gian, ta sẽ chuyển đổi cách biểu diễn đồ thị thành **danh sách kề**.

Theo cách tính toán độ phức tạp thông thường, hàm $\texttt{BFS}$ sẽ mất $\mathcal{O}(N + \|E\|)$. Với $\|E\|$ là số cạnh của đồ thị. Trong **trường hợp xấu nhất**, mỗi đỉnh đều có cạnh nối tới tất cả các đỉnh của đồ thị (đồng nghĩa, $H_{ij} = 1$ với $1 \le i, j \le N$), khi đó, số lượng cạnh của đồ thị là $N^{2}$.

Vì với mỗi đỉnh của đồ thị, ta phải gọi lại hàm $\texttt{BFS}$. Nên nhìn chung, độ phức tạp của thuật toán là $\mathcal{O}(N^{3})$.

# Ứng dụng BFS để tìm đường đi ngắn nhất trong đồ thị có trọng số 0 hoặc 1

## **Bài toán 7**

[REVERSE - Chef and Reversing](https://www.codechef.com/problems/REVERSE)

### **Đề bài**

Cho một đồ thị có hướng $N$ đỉnh và $M$ cạnh $(1 \le N, M \le 10^{5})$. Tìm số cạnh ít nhất cần phải đảo chiều để tồn tại đường đi từ đỉnh $1$ cho đến đỉnh $N$.

Các đỉnh được đánh số từ $1$ đến $N$. Đồ thị có thể có nhiều cạnh nối giữa một cặp đỉnh. Và có thể tồn tại cạnh nối từ một đỉnh đến chính nó *(đồ thị có thể có khuyên)*.

### **Phân tích**

Gọi đồ thị ban đầu là $G$.

Ta sẽ thêm các **cạnh ngược** của mỗi cạnh ban đầu trong đồ thị $G$ (nghĩa là, với mỗi cạnh $u \to v$ của đồ thị, ta sẽ thêm cạnh $v \to u$ vào). Cho các **cạnh ngược** có trọng số bằng $1$ và tất cả các cạnh ban đầu có trọng số bằng $0$. Khi đó, ta sẽ có được đồ thị mới là đồ thị $G ''$.

Độ dài của đường đi ngắn nhất từ đỉnh $1$ cho đến đỉnh $N$ trong đồ thị $G''$ chính là đáp án của bài toán.
 - **Chứng minh:** Trong đồ thị $G ''$, xét từng cạnh trên một đường đi từ $1$ đến $N$. Nếu cạnh đó có trọng số là $0$ thì đã tồn tại cạnh đó trên đồ thị $G$ ban đầu, còn nếu trọng số là $1$ thì cạnh ngược lại của nó tồn tại trong đồ thị $G$. Khi đó ta sẽ phải đảo chiều cạnh đó. Nhận thấy sau khi xét toàn bộ các cạnh, ta sẽ thu được một đường đi từ $1$ đến $N$, và số cạnh ta phải đảo chiều chính là số cạnh $1$ trong đường đi đó.

Ta sử dụng **kĩ thuật 0-1 BFS** :
- Nó có tên gọi như vậy vì **kĩ thuật 0-1 BFS** thường được sử dụng để tìm đường đi ngắn nhất trong đồ thị có trọng số $0$ hoặc $1$.
- Khi trọng số của các cạnh bằng $0$ hoặc $1$, thuật toán $\texttt{BFS}$ thông thường sẽ trả ra kết quả **sai**, vì thuật toán $\texttt{BFS}$ thông thường chỉ **đúng** trong đồ thị có trọng số của các cạnh **bằng nhau**.

Ta có thể chỉnh sửa một chút từ thuật toán $\texttt{BFS}$ để có được **kĩ thuật 0-1 BFS** :
- Trong kĩ thuật này, thay vì sử dụng mảng *bool* để đánh dấu lại các đỉnh đã duyệt, ta sẽ kiểm tra điều kiện **khoảng cách ngắn nhất**. Nghĩa là, trong quá trình $\texttt{BFS}$, với mỗi đỉnh $v$ kề với $u$, đỉnh $v$ chỉ được đẩy vào hàng đợi khi và chỉ khi đường đi đi ngắn nhất từ đỉnh nguồn đến $v$ lớn hơn đường đi ngắn nhất từ đỉnh nguồn đến $u$ cộng với trọng số cạnh $u \to v$ (khoảng cách được giảm bớt khi sử dụng cạnh này) .
- Ta sẽ sử dụng một [hàng đợi hai đầu](/algo/data-structures/Deque) *(deque)* thay cho hàng đợi *(queue)* để lưu trữ các đỉnh.  Trong quá trình $\texttt{BFS}$, nếu ta gặp một cạnh có trọng số bằng $0$ thì đỉnh sẽ được đẩy vào **phía trước** của hàng đợi hai đầu. Ngược lại, nếu ta gặp một cạnh có trọng số bằng $1$ thì đỉnh sẽ được đẩy vào **phía sau** của hàng đợi hai đầu.
    - **Giải thích:** Ta *push* đỉnh kết nối bởi cạnh có trọng số $0$ vào đầu *deque* để giữ cho hàng đợi luôn được sắp xếp theo khoảng cách từ đỉnh nguồn tại mọi thời điểm. Bởi vì, các đỉnh ở gần đầu *queue/deque* hơn thì nó phải có khoảng cách từ gốc gần hơn, mà đỉnh ta *push* vào đầu có khoảng cách bằng chính khoảng cách đỉnh vừa *pop* ra, nên *deque* lúc này thỏa mãn tính chất của *queue* trong $\texttt{BFS}$.
    - Từ tính chất trên, ta có nhận xét sau: **Kĩ thuật 0-1 BFS** vẫn đúng cho trường hợp đồ thị có trọng số cạnh là $0$ hoặc $x$ $(x \ge 0)$.

Cách tiếp cận của **kĩ thuật 0-1 BFS** khá giống với thuật toán $\texttt{BFS}$ + [Dijkstra](/algo/graph-theory/shortest-path.md#2-thu%E1%BA%ADt-to%C3%A1n-dijkstra).

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `inf = 1000000000`.
- Hằng số `maxN = 100007`.
- Mảng `d[]` - Mảng lưu lại khoảng cách ngắn nhất từ đỉnh nguồn đến mỗi đỉnh.
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh.
- Hàng đợi hai đầu `q` - Chứa các đỉnh sẽ được duyệt theo thứ tự.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int inf = 1e9;
const int maxN = 1e5 + 7;

int n, m;
int d[maxN];
vector<pair<int, int>> g[maxN];

void bfs(int s) {
    fill_n(d, n + 1, inf);
    deque<int> q;
    q.push_back(s);
    d[s] = 0;
    while (!q.empty()) {
        int u = q.front();
        q.pop_front();

        if (u == n)
            return;

        for (auto edge : g[u]) {
            int v = edge.second;
            int w = edge.first;

            if (d[v] > d[u] + w) {
                d[v] = d[u] + w;
                if (w)
                    q.push_back(v);
                else
                    q.push_front(v);
            }
        }
    }
    d[n] = -1;
}

int main() {
    cin >> n >> m;
    while (m--) {
        int u, v;
        cin >> u >> v;
        g[u].push_back({0, v});
        g[v].push_back({1, u});
    }
    bfs(1);
    cout << d[n];
}
```

### **Đánh giá**

Ta cũng có thể giải quyết bài toán này bằng thuật toán $\texttt{Dijkstra}$ với độ phức tạp $\mathcal{O}(M \times \log N)$.

Trong khi sử dụng $\texttt{BFS}$, độ phức tạp sẽ là $\mathcal{O}(N + M)$. Nó tuyến tính và hiệu quả hơn thuật toán $\texttt{Dijkstra}$.

## **Bài tập áp dụng**

[KATHTHI - KATHTHI](https://www.spoj.com/problems/KATHTHI/)

[Chamber of Secrets - 173B](https://codeforces.com/problemset/problem/173/B)

[Three States - 590C Codeforces](https://codeforces.com/problemset/problem/590/C)

[Olya and Energy Drinks - 877D Codeforces](https://codeforces.com/problemset/problem/877/D)

[UVA - Ocean Currents](https://onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=2620)

[UVA - Colliding Traffic](https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&problem=2621)

[Tram](https://www.e-olymp.com/en/contests/16775/problems/173743)

[Jailbreak](https://www.e-olymp.com/en/contests/16775/problems/173746)

[Minimum Cost to Make at Least One Valid Path in a Grid](https://leetcode.com/problems/minimum-cost-to-make-at-least-one-valid-path-in-a-grid/)

# Ứng dụng BFS để kiểm tra đồ thị hai phía (Bipartite graph)

## **Định nghĩa**

Trong *Lý thuyết đồ thị*, **đồ thị hai phía** (**đồ thị lưỡng phân** hay **đồ thị hai phần** - *Bipartite graph*) là một đồ thị đặc biệt, trong đó tập hợp các đỉnh của đồ thị có thể được chia làm hai tập hợp **không** giao nhau thỏa mãn điều kiện **không** có cạnh nối hai đỉnh bất kỳ thuộc cùng một tập.

Có rất nhiều tình huống thực tế có thể mô phỏng bằng đồ thị hai phía:
- **Ví dụ:** Muốn biểu diễn mối quan hệ giữa một nhóm học sinh và một nhóm các trường học, ta có thể xây dựng một đồ thị với mỗi một học sinh và mỗi trường học là một đỉnh. Giữa một người $A$ và một trường $X$ sẽ có một cạnh nếu như $A$ đã hoặc đang đi học ở trường $X$. Kiểu đồ thị này sẽ là một **đồ thị hai phần**, với một nhóm đỉnh là người và nhóm kia là trường; sẽ không có cạnh nối giữa hai người hoặc giữa hai trường.

Một tính chất thú vị của đồ thị hai phía là ta có thể tô màu các đỉnh đồ thị với hai màu sao cho không có hai đỉnh nào cùng màu kề nhau.

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_img6.png)

Bạn có thể tìm hiểu thêm về **đồ thị hai phía** tại [**đây**](https://vi.wikipedia.org/wiki/%C4%90%E1%BB%93_th%E1%BB%8B_hai_ph%C3%ADa).

## **Bài toán 8**

[Bicoloring - UVA 10004](https://onlinejudge.org/index.php?option=onlinejudge&Itemid=8&page=show_problem&problem=945)

### **Đề bài**

Cho một đồ thị vô hướng liên thông gồm $n$ đỉnh $(0 < n < 200)$. Các đỉnh được đánh số từ $0$ đến $n-1$. Và không tồn tại cạnh nối từ một đỉnh đến chính nó *(đồ thị không có khuyên)*.

Bạn hãy kiểm tra xem đồ thị có thể được tô bằng $2$ màu hay không. Nghĩa là ta có thể gán màu (từ một bảng gồm $2$ màu) cho mỗi đỉnh của đồ thị theo cách sao cho không có $2$ đỉnh nào kề cạnh nhau có cùng màu.

### **Phân tích**

Theo đề bài, ta phải kiểm tra xem $1$ đồ thị có thể được tô bằng $2$ màu sao cho không có $2$ đỉnh nào kề cạnh nhau có cùng màu hay không. Điều đó tương đương với việc kiểm tra xem đồ thị đã cho có phải là **đồ thị hai phía** hay không.

Ta có thể dùng thuật toán $\texttt{BFS}$ để kiểm tra xem một đồ thị có phải đồ thị hai phía, bằng cách tìm kiếm từ một đỉnh bất kì và tô màu cho các đỉnh được xem xét. Nghĩa là, ta tô **màu đen** cho đỉnh gốc, tô **màu xanh** cho tất cả các đỉnh kề đỉnh gốc, tô **màu đen** cho tất cả các đỉnh kề với một đỉnh kề đỉnh gốc, và tiếp tục như vậy. Nếu ở một bước nào đó, hai đỉnh kề nhau có cùng màu, thì đồ thị **không phải** là hai phía. Nếu quá trình tìm kiếm kết thúc mà điều này **không** xảy ra thì đồ thị là hai phía.

Thuật toán này đúng với đồ thị liên thông. Với đồ thị gồm nhiều thành phần liên thông thì ta phải duyệt từng thành phần liên thông một như thuật toán tìm số thành phần liên thông và áp dụng thủ tục $\texttt{BFS}$ tương ứng.

### **Mô tả**

- Ví dụ mô tả đồ thị **không phải** là đồ thị hai phía:

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_gif5.gif)

- Ví dụ mô tả **đồ thị hai phía**:

![](/uploads/algo/graph-theory/breadth-first-search/breadth-first-search_gif6.gif)

### **Thuật toán**

Để tô màu đồ thị, ta sẽ sử dụng $1$ mảng để lưu trạng thái của mỗi đỉnh. Có $3$ trạng thái:
- **Trạng thái -1:** Đỉnh vẫn chưa được tô màu *(đỉnh chưa được duyệt)*.
- **Trạng thái 0:** Đỉnh được tô màu đen.
- **Trạng thái 1:** Đỉnh được tô màu xanh.

Ban đầu, tất cả các đỉnh của đồ thị đều ở **trạng thái -1**.

Ta sử dụng $\texttt{BFS}$ để tô màu đồ thị:
- Bắt đầu từ một đỉnh bất kỳ và tô màu đen cho đỉnh đó.
- Với mỗi đỉnh $v$ kề với đỉnh đang xét $u$, nếu đỉnh $v$ chưa được duyệt, ta sẽ tô màu $v$ ngược với màu của $u$ (nếu $u$ là màu xanh, ta sẽ tô $v$ màu đen và ngược lại).
- Nếu $u$ đã được thăm trước đó và có cùng màu với $v$, ta sẽ dừng thuật toán và kết luận đồ thị **không phải** đồ thị hai phía.

Cuối cùng, nếu ta có thể tô màu tất cả các đỉnh mà **không** vi phạm quy tắc tô màu, ta có thể kết luận đồ thị là hai phía.

### **Cài đặt**

**Cấu trúc dữ liệu:**

- Hằng số `maxN = 210`.
- Mảng `color[]` - Mảng lưu trạng thái tô màu của mỗi đỉnh.
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh.
- Hàng đợi `q` - Chứa các đỉnh sẽ được duyệt theo thứ tự ưu tiên chiều rộng.

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 210;

int n, l;
int color[maxN];
vector<int> g[maxN];

bool checkBipartiteGraph() {
    fill_n(color, n + 1, -1);

    queue<int> q;
    q.push(0);
    color[0] = 0;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (auto v : g[u]) {
            if (color[v] == color[u])
                return false;
            if (color[v] == -1) {
                color[v] = !color[u];
                q.push(v);
            }
        }
    }
    return true;
}

int main() {
    while (cin >> n) {
        if (!n)
            return 0;

        cin >> l;
        while (l--) {
            int u, v;
            cin >> u >> v;
            g[u].push_back(v);
            g[v].push_back(u);
        }
        if (!checkBipartiteGraph())
            cout << "NOT ";
        cout << "BICOLORABLE.\n";

        for (int i = 0; i < n; ++i)
            g[i].clear();
    }
}
```

### **Đánh giá**

Ta cũng có thể sử dụng  thuật toán tìm kiếm theo chiều sâu *(Depth First Search – DFS)* để kiểm tra đồ thị hai phía.

**Độ phức tạp**

Độ phức tạp của thuật toán là $\mathcal{O}(t \times (n + l))$. Với $t$ là số lượng bộ test.
', 'int n; // Số lượng đỉnh của đồ thị
int d[maxN], par[maxN];
bool visit[maxN];
vector<int> g[maxN];

void bfs(int s) { // Với s là đỉnh xuất phát (đỉnh nguồn)
    fill_n(d, n + 1, 0);
    fill_n(par, n + 1, -1);
    fill_n(visit, n + 1, false);

    queue<int> q;
    q.push(s);
    visit[s] = true;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (auto v : g[u]) {
            if (!visit[v]) {
                d[v] = d[u] + 1;
                par[v] = u;
                visit[v] = true;
                q.push(v);
            }
        }
    }
}', '2026-10-06T10:32:19.541993');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_dfs_tree', 'Cây DFS (Depth-First Search Tree) và ứng dụng', 'graph', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/algo/graph-theory/Depth-First-Search-Tree.md', '["dfs", "tìm kiếm theo chiều sâu", "cây dfs", "khớp cầu", "thành phần liên thông"]', '---
title: Cây DFS (Depth-First Search Tree) và ứng dụng
description: 
published: true
date: 2024-09-25T15:35:52.974Z
tags: 
editor: markdown
dateCreated: 2023-12-25T11:02:59.451Z
---', '---
title: Cây DFS (Depth-First Search Tree) và ứng dụng
description: 
published: true
date: 2024-09-25T15:35:52.974Z
tags: 
editor: markdown
dateCreated: 2023-12-25T11:02:59.451Z
---

# Cây DFS (Depth-First Search Tree) và ứng dụng

**Tác giả:**
- **Nguyễn Châu Khanh** - THPT Chuyên Hùng Vương - Phú Thọ
- **Bùi Minh Hoạt** - THPT Chuyên Hùng Vương - Phú Thọ
- **Trần Thế Hưng** - THPT Chuyên Biên Hòa - Hà Nam

**Reviewer:**
- **Đỗ Đình Đắc** - Đại học Bách Khoa Hà Nội

# Mở đầu
- Bài viết này sẽ giúp bạn tìm hiểu về cây $\texttt{DFS}$ *(Depth First Search Tree – DFS Tree)*. Cây $\texttt{DFS}$ là một ứng dụng quan trọng có được từ kỹ thuật duyệt đồ thị ưu tiên chiều sâu, giúp giải các bài toán tìm khớp cầu và thành phần liên thông mạnh.

# Cây duyệt chiều sâu DFS (cây DFS)

- Trong quá trình $\texttt{DFS}$, với mỗi đỉnh $u$ ta có đỉnh $\texttt{par}[u]$ là số hiệu của đỉnh mà từ đỉnh đó thủ tục $\texttt{DFS}$ gọi đệ quy đến $u$. Xây dựng đồ thị con với các cạnh là $(\texttt{par}[u], u)$ ta có được một cây. Cây này được gọi là **cây *DFS***.
- Các cạnh thuộc cây $\texttt{DFS}$ được gọi là các “cạnh nét liền”.
- Các cạnh còn lại không thuộc cây $\texttt{DFS}$ được gọi là các “cạnh nét đứt".

![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img1.png)

- Trong đồ thị có hướng, xét các cung được thăm và không được thăm bởi $\texttt{DFS}$, ta có $4$ loại cung sau:
	* Cung của cây $\texttt{DFS}$ ***(Tree edge)***:  là các cung thuộc cây $\texttt{DFS}$ được định hướng theo chiều từ cha đến con. (ví dụ cạnh $(u,v)$ thuộc cây $\texttt{DFS}$ mà $u$ được thăm trước $v$ hay $u$ là cha của $v$ thì ta có cung $u \rightarrow v$ là cung của cây $\texttt{DFS}$). _$<$ Các cung của cây $\texttt{DFS}$ được đánh dấu là các cạnh màu đen trong hình bên dưới $>$_
	* Cung xuôi ***(Forward edge)***: là các cung không thuộc cây $\texttt{DFS}$ và có dạng $u \rightarrow v$ trong đó $u$ là tổ tiên của $v$ trong cây $\texttt{DFS}$. _$<$ Các cung xuôi được đánh dấu là các cạnh màu xanh lá trong hình bên dưới $>$_
	* Cung ngược ***(Back edge)***: là các cung không thuộc cây $\texttt{DFS}$ và có dạng $v \rightarrow u$ trong đó $u$ là tổ tiên của $v$ trong cây $\texttt{DFS}$. _$<$ Các cung ngược được đánh dấu là các cạnh màu đỏ trong hình bên dưới $>$_
	* Cung chéo ***(Cross edge)***: là các cung không thuộc cây $\texttt{DFS}$ có dạng $u \rightarrow v$ trong đó $u$ và $v$ thuộc hai nhánh khác nhau của cùng một cây $\texttt{DFS}$. _$<$ Các cung chéo được đánh dấu là các cạnh màu xanh dương trong hình bên dưới $>$_

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img2.png)

- Trong đồ thị vô hướng:
    * Không tồn tại cung chéo. Vì khi đỉnh $u$ được duyệt trong hàm $\texttt{DFS}$ ta sẽ duyệt tất cả các đỉnh $v$ kề $u$ mà $v$ chưa được thăm. Như vậy nếu tồn tại một cung chéo $(u, v)$ chứng tỏ khi duyệt đến đỉnh $u$ hoặc đỉnh $v$ ta đã không duyệt cạnh $(u, v)$.
    * Vì các cạnh trên đồ thị vô hướng không được định chiều nên không thể định nghĩa $2$ loại cung xuôi và cung ngược như ở đồ thị có hướng. Do đó, ở đồ thị vô hướng, cung xuôi và cung ngược sẽ được định nghĩa như sau:
        * Cung xuôi ***(Forward edge)***: là các cung thuộc cây $\texttt{DFS}$. Hay còn có cách gọi khác là "cạnh nét liền" hoặc "cung của cây $\texttt{DFS}$".
        * Cung ngược ***(Back edge)***: là các cung không thuộc cây $\texttt{DFS}$. Hay còn có cách gọi khác là "cạnh nét đứt".
    * Như vậy trên đồ thị vô hướng lúc này chỉ còn $2$ loại cung là cung ngược và cung xuôi (cung của cây $\texttt{DFS}$).

**Một số mảng quan trọng trong cây DFS :**

- Mảng $\texttt{num}$[]: cho biết thứ tự duyệt $\texttt{DFS}$ của các đỉnh (thứ tự mà mỗi đỉnh bắt đầu duyệt).
- Mảng $\texttt{low}$[]: Với mỗi đỉnh $u$, $\texttt{low}[u]$ cho biết thứ tự (giá trị $\texttt{num}$) nhỏ nhất có thể đi đến được từ $u$ bằng cách đi xuôi xuống theo các cạnh nét liền (các cung trên cây $\texttt{DFS}$) và kết thúc đi ngược lên không quá $1$ lần theo cạnh nét đứt. Ngoài ra ta cũng có thể hiểu ý nghĩa của $\texttt{low}[u]$ là thứ tự thăm của đỉnh có thứ tự thăm sớm nhất nằm trong cây con gốc $u$ hoặc kề cạnh với $1$ đỉnh bất kì nằm trong cây con gốc $u$.
- Mảng $\texttt{tail}$[]: cho biết thời điểm kết thúc duyệt $\texttt{DFS}$ của mỗi đỉnh cũng là thời điểm duyệt xong của đỉnh đó .

**Nhận xét :** Các đỉnh có thứ tự thăm nằm trong khoảng từ $\texttt{num}[u]$ đến $\texttt{tail}[u]$ chính là các đỉnh nằm trong cây con gốc $u$ trong cây $\texttt{DFS}$.

**Cách tính mảng low[], num[], tail[] :**

- **Ý tưởng chính :** Mảng $\texttt{num}[],\texttt{tail}[]$ ta có thể tính dễ dàng bằng cách $\texttt{DFS}$ xác định thời điểm duyệt tới và thời điểm duyệt xong của các đỉnh. Với mảng $\texttt{low}[]$ ta có:
    * Trước hết, với $1$ đỉnh $u$ bất kì có thể tự đi tới chính nó nên ta gán $\texttt{low}[u]=\texttt{num}[u]$.
    * Từ $u$ có thể đến các đỉnh $v$ kề $u$ bằng $1$ cạnh nét đứt nên ta có $\texttt{low}[u]=\min(\texttt{low}[u],\texttt{num}[v])$ với $(u,v)$ là một cạnh nét đứt.
    * Ngược lại, nếu $(u,v)$ là một cạnh nét liền và $v$ không phải cha $u$ ta có $\texttt{low}[u]=\min(\texttt{low}[u],\texttt{low}[v])$ do từ $u$ ta có thể đi xuống $v$ sau đó đi theo con đường đã xác định ở đỉnh $v$ để tới đỉnh có thứ tự thăm là $\texttt{low}[v]$.
- ***Chú ý***: Giá trị thực sự của $\texttt{num}[u]$ được xác định khi duyệt tới đỉnh $u$ còn giá trị thực sự của $\texttt{low}[u],$ $\texttt{tail}[u]$ chỉ được xác định khi đã duyệt xong đỉnh $u$. Thời điểm duyệt tới của một đỉnh $u$ luôn diễn ra trước thời điểm duyệt tới của các đỉnh trong cây con gốc $u$ của cây $\texttt{DFS}$ , thời điểm duyệt xong của đỉnh $u$ luôn diễn ra sau thời điểm duyệt xong của các đỉnh trong cây con gốc $u$.
- **Cách thực hiện :**
    * Đầu tiên ta sẽ bắt đầu duyệt $\texttt{DFS}$ từ đỉnh gốc. Khi duyệt tới đỉnh $u$ ta sẽ cập nhật thời điểm duyệt tới. Lúc này $\texttt{low}[u] = \texttt{num}[u] =$ **thứ tự duyệt *DFS***. Ta sẽ duyệt tất cả các con $v$ trong gốc $u$.
    * **Trường hợp 1:** Nếu đỉnh $v$ chưa được thăm thì sau khi hoàn thành $\texttt{DFS}$ của $v$ thì ta sẽ cập nhật lại giá trị của $\texttt{low} [u]$: $\texttt{low} [u] = \min (\texttt{low}[u], \texttt{low}[v]);$
    * **Trường hợp 2:** Nếu đỉnh $v$ đã được thăm, thì ta sẽ cập nhật lại giá trị cho $\texttt{low}[u]$: $\texttt{low} [u] = \min (\texttt{low} [u], \texttt{num}[v]);$
        * Ở trường hợp này ta không thể cập nhật $\texttt{low}[u] = \min(\texttt{low}[u], \texttt{low}[v])$ được. Vì khi ta thăm đến đỉnh $u$ mà đỉnh $v$ đã được thăm thì tức là $(u,v)$ là một cạnh nét đứt, do đó khi đi từ $u$ tới $v$ ta đã sử dụng $1$ cạnh nét đứt nên không thể tiếp tục di chuyển nữa (theo định nghĩa của mảng $\texttt{low}[]$ ) suy ra ta chỉ cập nhật $\texttt{low}[u]=\min(\texttt{low}[u],\texttt{num}[v])$.
    * *****Chú ý : Nếu v là cha trực tiếp của u thì ta bỏ qua không xét đến.*****
    * Khi đã duyệt xong đỉnh $u$ và các nút trong cây con $\texttt{DFS}$ gốc $u$ ta sẽ tiến hành cập nhật giá trị $\texttt{tail}[u]=$ **thời gian duyệt *DFS* hiện tại**.
- **Cài đặt :**

```cpp
int timeDfs = 0; // Thứ tự duyệt DFS

void dfs(int u, int pre) {
    num[u] = low[u] = ++timeDfs;
    for (int v : g[u]) {
        if (v == pre)
            continue;
        if (!num[v]) {
            dfs(v, u);
            low[u] = min(low[u], low[v]);
        } else
            low[u] = min(low[u], num[v]);
    }
    tail[u] = timeDfs;
}
```

- **Ví dụ minh họa :**

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img3.png)

- **Mô tả quá trình :**

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_gif1.gif)

# Ứng dụng cây DFS trong bài toán tìm khớp, cầu
## Định nghĩa

- Trong đồ thị vô hướng, một đỉnh được gọi là đỉnh khớp nếu như loại bỏ đỉnh này và các cạnh liên thuộc với nó ra khỏi đồ thị thì số thành phần liên thông của đồ thị tăng lên.
- Trong đồ thị vô hướng, một cạnh được gọi là cạnh cầu nếu như loại bỏ cạnh này ra khỏi đồ thị thì số thành phần liên thông của đồ thị tăng lên.

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img4.png)

## Bài toán 1

[GRAPH_ - Tìm khớp và cầu (Cơ bản)](https://oj.vnoi.info/problem/graph_)

### **Đề bài**
Xét đơn đồ thị vô hướng $G=(V, E)$ có $N$ $(1 \le N \le 10000)$ đỉnh và $M$ $(1 \le M \le 50000)$ cạnh. Người ta định nghĩa một đỉnh gọi là khớp nếu như xoá đỉnh đó sẽ làm tăng số thành phần liên thông của đồ thị. Tương tự như vậy, một cạnh được gọi là cầu nếu xoá cạnh đó sẽ làm tăng số thành phần liên thông của đồ thị.

Vấn đề đặt ra là cần phải đếm tất cả các khớp và cầu của đồ thị $G$.

**Input**

- Dòng đầu: chứa hai số tự nhiên $N, M$.
- $M$ dòng sau mỗi dòng chứa một cặp số $(u, v)$ $(u$ khác $v$, $1 \le u \le N, 1 \le v \le N)$ mô tả một cạnh của $G$.

**Output**

- Gồm một dòng duy nhất ghi hai số, số thứ nhất là số khớp, số thứ hai là số cầu của $G$.

**Example**

**Input**
```text
10 12
1 10
10 2
10 3
2 4
4 5
5 2
3 6
6 7
7 3
7 8
8 9
9 7
```
**Output**
```text
4 3
```

**Note**

- Các cạnh màu đỏ là cạnh cầu.
- Các đỉnh màu xanh lá là đỉnh khớp.

![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img5.png)

### **Phân tích**
#### **Tìm cạnh cầu**

- Dễ thấy rằng cạnh cầu của đồ thị không thể là cạnh nét đứt vì việc bỏ đi cạnh nét đứt sẽ không ảnh hưởng đến tính liên thông giữa các đỉnh của đồ thị. Do vậy cạnh cầu chỉ có thể là cạnh nét liền.
- Ta sẽ xét riêng từng thành phần liên thông của đồ thị. Xét vùng liên thông $G$ như sau:
    * Xét cây con gốc $v$ trong cây $\texttt{DFS}$ của $G$ có $u$ là cha trực tiếp của $v$. Gọi tập hợp các đỉnh thuộc cây con gốc $v$ là $A$, tập hợp các đỉnh không thuộc cây con gốc $v$ là $B$. Khi xoá đi cạnh $(u, v)$ thì giữa $2$ đỉnh bất kì thuộc cùng $1$ tập hợp vẫn có thể đến với nhau bằng các cạnh nét liền. Một đỉnh thuộc $A$ với một đỉnh thuộc $B$ muốn đi đến với nhau bằng các **cạnh nét liền** thì đều phải thông qua cạnh $(u, v)$.
        * **Ví dụ minh họa:** Xét cạnh nét liền $(7, 9)$ với đỉnh $9$ là con trực tiếp của đỉnh $7$ trên cây $\texttt{DFS}$. Tập đỉnh $A$ là các đỉnh được đánh dấu màu hồng. Tập đỉnh $B$ là các đỉnh được đánh dấu màu vàng. Đỉnh $11$ thuộc tập $A$ muốn đi đến đỉnh $6$ thuộc tập $B$ bằng các cạnh nét liền thì đều phải thông qua cạnh $(7, 9)$.

        ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img6.png)

    * Giả sử không có cạnh nét đứt nào nối giữa $1$ đỉnh thuộc $A$ với $1$ đỉnh thuộc $B$ thì khi xoá cạnh $(u, v)$, $G$ sẽ tách ra thành $2$ vùng liên thông $A$ và $B$. Ngược lại nếu tồn tại cạnh nét đứt nối giữa $1$ đỉnh thuộc $A$ và $1$ đỉnh thuộc $B$ đồ thị vẫn liên thông . Do đó ta chỉ cần xét xem có tồn tại cạnh nét đứt nối giữa $A$ và $B$ hay không để kết luận $(u, v)$ có phải cầu không?
    * Ta có từ $v$ có thể đi đến một đỉnh $p$ nào đó có $\texttt{num}[p]=\texttt{low}[v]$ bằng cách đi theo các cung của cây $\texttt{DFS}$ và đi qua không quá $1$ cạnh nét đứt và $p$ có thứ tự thăm sớm nhất khi $\texttt{DFS}$. Nếu $p$ nằm trong $B$ thì $p$ phải là tổ tiên của $v$ cũng đồng nghĩa với việc $\texttt{num}[p]<\texttt{num}[v]$ hay $\texttt{low}[v]<\texttt{num}[v]$ **(vì đồ thị không có cung chéo)**, nghĩa là tồn tại $1$ cạnh nét đứt nối giữa $1$ đỉnh thuộc $A$ với $1$ đỉnh thuộc $B$ (vì nếu chỉ đi bằng các cung của cây $\texttt{DFS}$ thì $v$ không thể tới một tổ tiên của nó).
    * Do đó nếu $\texttt{low}[v] \ge \texttt{num}[v]$ chắc chắn đỉnh $p$ thuộc cây con gốc $v$ hay $p$ thuộc tập hợp $A$ khi đó không tồn tại cạnh nét đứt nối giữa $1$ đỉnh thuộc $A$ với $1$ đỉnh thuộc $B$. Tuy nhiên, ta dễ dàng nhận thấy $\texttt{low}[v] \le \texttt{num}[v]$ vì đỉnh $v$ luôn tới được chính nó.
- **Kết luận:** Nếu $\texttt{low}[v] = \texttt{num}[v]$ thì $(u, v)$ là một cạnh cầu trong đồ thị.

#### **Tìm đỉnh khớp**
- Ta sẽ xét riêng từng thành phần liên thông của đồ thị. Xét vùng liên thông $G$ như sau:
    * Xét cây con gốc $u$ trong cây $\texttt{DFS}$ của $G$, nếu mọi nhánh con của $u$ đều có cung ngược lên tới tổ tiên của $u$ ($\texttt{low}[v] < \texttt{num}[u]$, với $v$ là tất cả các con trực tiếp của $u$ trên cây $\texttt{DFS}$) thì đỉnh $u$ không thể là đỉnh khớp. Bởi trong đồ thị ban đầu, nếu ta loại bỏ đỉnh $u$ đi thì từ mỗi đỉnh bất kỳ thuộc nhánh con vẫn có thể đi lên một tổ tiên của $u$, rồi đi sang nhánh con khác hoặc đi sang tất cả những đỉnh còn lại của cây nên số thành phần liên thông của đồ thị không thay đổi.
        * **Ví dụ minh họa:** Xét đỉnh $9$ không phải là đỉnh khớp vì cả $2$ nhánh con của nó là cây con gốc $10$ và cây con gốc $13$ trong cây $\texttt{DFS}$ đều có cung ngược lên tới đỉnh $7$ là tổ tiên của đỉnh $9$.

        ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img7.png)

    * Nếu $u$ không phải là đỉnh gốc của cây $\texttt{DFS}$, và tồn tại ít nhất một nhánh con trong cây con gốc $u$ không có cung ngược lên một tổ tiên của $u$ ($\texttt{low}[v] \ge \texttt{num}[u]$, với $v$ là một con trực tiếp bất kì của $u$ trên cây $\texttt{DFS}$) thì đỉnh $u$ là đỉnh khớp. Bởi khi đó, tất cả những cung xuất phát từ nhánh con đó chỉ có thể đi tới những đỉnh thuộc cây con gốc $u$ mà thôi, trên đồ thị ban đầu, không tồn tại cạnh nối từ những đỉnh thuộc nhánh con đó tới một tổ tiên của $u$. Vậy nên từ một đỉnh bất kì thuộc nhánh con đó muốn đi lên một tổ tiên của $u$ thì bắt buộc phải đi qua $u$ nên việc loại bỏ đỉnh $u$ ra khỏi đồ thị sẽ làm tăng số thành phần liên thông của đồ thị.
        * **Ví dụ minh họa:** Xét đỉnh $2$ là đỉnh khớp vì tồn tại $1$ nhánh con của nó là cây con gốc $4$ không có cung ngược lên tới tổ tiên của đỉnh $2$.

        ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img8.png)

    * Nếu $u$ là đỉnh gốc của cây $\texttt{DFS}$, thì $u$ là đỉnh khớp khi và chỉ khi $u$ có ít nhất $2$ nhánh con. Vì đồ thị không có cung chéo nên khi $u$ có $2$ nhánh con thì đường đi giữa hai đỉnh thuộc hai nhánh con đó bắt buộc phải đi qua $u$. Việc loại bỏ đỉnh $u$ ra khỏi đồ thị sẽ làm tăng số thành phần liên thông của đồ thị.
        * **Ví dụ minh họa:** Xét đỉnh $1$ là đỉnh khớp vì đỉnh $1$ là đỉnh gốc của cây $\texttt{DFS}$ và có tới $3$ nhánh con.

        ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img9.png)

- **Kết luận:** Đỉnh $u$ là đỉnh khớp khi:
    * Đỉnh $u$ không phải là gốc của cây $\texttt{DFS}$ và $\texttt{low}[v] \ge \texttt{num}[u]$ (với $v$ là một con trực tiếp bất kì của $u$ trong cây $\texttt{DFS}$).

    **Hoặc**

    * Đỉnh $u$ là gốc của cây $\texttt{DFS}$ và có ít nhất $2$ con trực tiếp trong cây $\texttt{DFS}$.

### **Cài đặt**

**Cấu trúc dữ liệu:**
- Hằng số `maxN = 10010`
- Biến `timeDfs` - Thứ tự $\texttt{DFS}$
- Biến `bridge` - Số lượng cạnh cầu
- Mảng `low[], num[]`
- Mảng `joint[]` - Đánh dấu đỉnh khớp
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 10010;

int n, m;
bool joint[maxN];
int timeDfs = 0, bridge = 0;
int low[maxN], num[maxN];
vector<int> g[maxN];

void dfs(int u, int pre) {
    int child = 0; // Số lượng con trực tiếp của đỉnh u trong cây DFS
    num[u] = low[u] = ++timeDfs;
    for (int v : g[u]) {
        if (v == pre)
            continue;
        if (!num[v]) {
            dfs(v, u);
            low[u] = min(low[u], low[v]);
            if (low[v] == num[v])
                bridge++;
            child++;
            if (u == pre) { // Nếu u là đỉnh gốc của cây DFS
                if (child > 1)
                    joint[u] = true;
            } else if (low[v] >= num[u])
                joint[u] = true;
        } else
            low[u] = min(low[u], num[v]);
    }
}

int main() {
    cin >> n >> m;
    for (int i = 1; i <= m; i++) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    for (int i = 1; i <= n; i++)
        if (!num[i])
            dfs(i, i);

    int cntJoint = 0;
    for (int i = 1; i <= n; i++)
        cntJoint += joint[i];

    cout << cntJoint << '' '' << bridge;
}
```
### **Đánh giá**
- Độ phức tạp của bài toán là $\mathcal{O}(N + M)$.

## Bài toán 2

[NKPOLICE - Police](https://oj.vnoi.info/problem/nkpolice)

### **Đề bài**
Để truy bắt tội phạm, cảnh sát xây dựng một hệ thống máy tính mới. Bản đồ khu vực bao gồm $N$ thành phố và $M$ đường nối $2$ chiều. Các thành phố được đánh số từ $1$ đến $N$.

Cảnh sát muốn bắt các tội phạm di chuyển từ thành phố này đến thành phố khác. Các điều tra viên, theo dõi bản đồ, phải xác định vị trí thiết lập trạm gác. Hệ thống máy tính mới phải trả lời được $2$ loại truy vấn sau:

- $1$. Đối với hai thành phố $A$, $B$ và một đường nối giữa hai thành phố $G1$, $G2$; hỏi tội phạm có thể di chuyển từ $A$ đến $B$ nếu đường nối này bị chặn (nghĩa là tên tội phạm không thể sử dụng con đường này) không?
- $2$. Đối với $3$ thành phố $A$, $B$, $C$; hỏi tội phạm có thể di chuyển từ $A$ đến $B$ nếu như toàn bộ thành phố $C$ bị kiểm soát (nghĩa là tên tội phạm không thể đi vào thành phố này) không?

**Input**
- Dòng đầu tiên chứa $2$ số nguyên $N$ và $M$ $(2 \le N \le 100000, 1 \le M \le 500000)$, số thành phố và số đường nối.
- Mỗi dòng trong số $M$ dòng tiếp theo chứa $2$ số nguyên phân biệt thuộc phạm vi $[1, N]$ - cho biết nhãn của hai thành phố nối với nhau bởi một con đường. Giữa hai thành phố có nhiều nhất một đường nối.
- Dòng tiếp theo chứa số nguyên $Q$ $(1 \le Q \le 300000)$, số truy vấn được thử nghiệm trên hệ thống.
- Mỗi dòng trong $Q$ dòng tiếp theo chứa $4$ hoặc $5$ số nguyên. Số đầu tiên cho biết loại truy vấn $1$ hoặc $2$.
	* Nếu loại truy vấn là $1$, tiếp theo trên cùng dòng là $4$ số nguyên $A$, $B$, $G1$, $G2$ với ý nghĩa như đã mô tả. $A$ khác $B$; $G1$, $G2$ mô tả một con đường có sẵn.
	* Nếu loại truy vấn là $2$, tiếp theo trên cùng dòng là $3$ số nguyên $A$, $B$, $C$ với ý nghĩa như đã mô tả. $A$, $B$, $C$ đôi một khác nhau.

Dữ liệu được cho sao cho ban đầu luôn có cách di chuyển giữa hai thành phố bất kỳ.

**Output**
- Gồm $Q$ dòng, mỗi dòng chứa câu trả lời cho một truy vấn. Nếu câu trả lời là khẳng định, in ra "yes". Nếu câu trả lời là phủ định, in ra "no".

**Example**

**Input**
```text
13 15
1 2
2 3
3 5
2 4
4 6
2 6
1 4
1 7
7 8
7 9
7 10
8 11
8 12
9 12
12 13
5
1 5 13 1 2
1 6 2 1 4
1 13 6 7 8
2 13 6 7
2 13 6 8
```

**Output**
```text
yes
yes
yes
no
yes
```

**Note**

![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img10.png)

### **Phân tích**
- Để tồn tại ít nhất một cách di chuyển từ thành phố $A$ đến thành phố $B$ thì cả $2$ thành phố $A$ và $B$ phải cùng thuộc một thành phần liên thông.

#### **Truy vấn 1**
- Dễ thấy rằng, nếu đường nối giữa $2$ thành phố $G1,$ $G2$ không phải là cạnh cầu thì việc loại bỏ nó đi sẽ không ảnh hưởng đến tính liên thông giữa thành phố $A$ và $B$.
- Ngược lại, nếu đường nối giữa $2$ thành phố $G1,$ $G2$ là cạnh cầu thì ta phải kiểm tra xem $2$ thành phố $A$ và $B$ có thuộc cùng một thành phần liên thông sau khi loại bỏ cạnh $(G1,G2)$ hay không?
-  Mỗi khi loại bỏ một cạnh cầu của đồ thị vô hướng thì số thành phần liên thông của đồ thị sẽ tăng thêm $1$. Nghĩa là khi ta loại bỏ cạnh cầu $(G1,G2)$ (với $G2$ là con trực tiếp của $G1$) thì đồ thị sẽ chia ra làm $2$ thành phần liên thông:
    * Thành phần liên thông thứ nhất là tập hợp các đỉnh thuộc cây con gốc $G2$ của cây $\texttt{DFS}$.
    * Thành phần liên thông thứ nhất là tập hợp các đỉnh còn lại không thuộc cây con gốc $G2$ của cây $\texttt{DFS}$.
- **Ví dụ minh họa:** Loại bỏ cạnh cầu $(1,7)$ (với đỉnh $7$ là con trực tiếp của đỉnh $1$)

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img11.png)

- Bây giờ, ta có thể xác định vị trí của $2$ đỉnh $A,$ $B$ có nằm trong cây con gốc $G2$ hay không.
    * Nếu chỉ có đúng duy nhất $1$ trong $2$ đỉnh nằm trong cây con gốc $G2$ thì $2$ thành phố $A$ và $B$ không thuộc cùng một thành phần liên thông sau khi loại bỏ cạnh $(G1,G2)$.
    * Ngược lại, nếu cả $2$ đỉnh cùng nằm trong cây con gốc $G2$ hoặc cả $2$ đỉnh đều không nằm trong cây con gốc $G2$ thì $2$ thành phố $A$ và $B$ đều thuộc cùng một thành phần liên thông sau khi loại bỏ cạnh $(G1,G2)$.
- **Nhắc lại:** Nếu $\texttt{num}[u] \le \texttt{num}[v] \le \texttt{tail}[u]$ thì đỉnh $v$ nằm trong cây con gốc $u$ của cây $\texttt{DFS}$.

#### **Truy vấn 2**
- Dễ thấy rằng, nếu thành phố $C$ không phải là đỉnh khớp thì việc loại bỏ nó đi sẽ không ảnh hưởng đến tính liên thông giữa thành phố $A$ và $B$.
- Ngược lại, nếu thành phố $C$ là đỉnh khớp thì ta phải kiểm tra xem $2$ thành phố $A$ và $B$ có thuộc cùng một thành phần liên thông sau khi loại bỏ đỉnh $C$ và các cạnh liên thuộc với nó đi hay không?
- Vì đồ thị không có cung chéo nên khi loại bỏ đỉnh khớp $C$ ra khỏi đồ thị thì số thành phần liên thông của đồ thị tăng thêm một lượng bằng số lượng đỉnh $v$ là con trực tiếp của $C$ trong cây $\texttt{DFS}$ sao cho không tồn tại cung ngược (cạnh nét đứt) từ một đỉnh thuộc cây con gốc $v$ trong cây $\texttt{DFS}$ nối lên tổ tiên của $C$ (đồng nghĩa với việc $\texttt{low}[v] \ge \texttt{num}[C]$). Nghĩa là khi ta loại bỏ đỉnh khớp $C$ ra khỏi đồ thị thì đồ thị sẽ chia ra làm các thành phần liên thông:
    * Một số thành phân liên thông, mỗi thành phần liên thông là $1$ tập hợp các đỉnh thuộc cây con gốc $v$ với $v$ là con trực tiếp của $C$ trong cây $\texttt{DFS}$ và $\texttt{low}[v] \ge \texttt{num}[C]$.
    * Một thành phần liên thông là tập hợp tất cả các đỉnh còn lại (bao gồm các đỉnh là tổ tiên của của $C$ và các đỉnh thuộc các cây con gốc $u$ với $u$ là các con trực tiếp của $C$ trong cây $\texttt{DFS}$ và $\texttt{low}[u] < \texttt{num}[C]$).
- **Ví dụ minh họa:** Loại bỏ đỉnh khớp $8$. Đỉnh $11$ và $12$ là các con trực tiếp của đỉnh $8$ trong cây $\texttt{DFS}$. Nhưng chỉ có cây con gốc $11$ là tách riêng ra thành $1$ thành phần liên thông riêng biệt. Còn cây con gốc $12$ thì có $1$ cung ngược nối lên đỉnh $7$ (tổ tiên của đỉnh $8$) nên số lượng thành phần liên thông của cả đồ thị chỉ tăng thêm $1$.

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img12.png)

- Với mỗi đỉnh $v$ là con trực tiếp của $C$ trong cây $\texttt{DFS}$ và $\texttt{low}[v] \ge \texttt{num}[C]$, ta kiểm tra xem nếu chỉ có đúng duy nhất $1$ trong $2$ đỉnh nằm trong cây con gốc $v$ thì $2$ thành phố $A$ và $B$ không thuộc cùng một thành phần liên thông sau khi loại bỏ đỉnh $C$ và các cạnh liên thuộc với đỉnh $C$ đi.
- Ngược lại, với $v$ là các con trực tiếp của $C$ trong cây $\texttt{DFS}$ và $\texttt{low}[v] \ge \texttt{num}[C]$, nếu cả $2$ đỉnh $A$ và $B$ cùng nằm trong $1$ cây con gốc $v$ hoặc cả $2$ đỉnh $A$ và $B$ đều không nằm trong bất cứ $1$ cây con gốc $v$ nào cả (đồng nghĩa với việc cả $2$ đỉnh $A,$ $B$ sẽ cùng nằm trong thành phần liên thông còn lại) thì $2$ thành phố $A$ và $B$ đều thuộc cùng một thành phần liên thông sau khi loại bỏ đỉnh $C$ và các cạnh liên thuộc với đỉnh $C$ đi.
- **Tuy nhiên theo thuật toán trên thì với mỗi truy vấn ta sẽ phải duyệt hết tất cả các con trực tiếp của đỉnh *C* nên khi xử lí các truy vấn sẽ mất độ phức tạp là *$\mathcal{O}(Q \cdot \text{bậc của } C)$*. Trong trường hợp tệ nhất thì đỉnh *C* có thể lên đến *N - 1* con trực tiếp *(100000 - 1)* với số lượng truy vấn *Q = 300000*, khiến cho thuật toán trên sẽ bị quá thời gian. Bây giờ ta cần phải cải tiến thuật toán :**
- Thay vì duyệt hết tất cả các con trực tiếp của $C$ để xác định được tổ tiên của $A$, tổ tiên của $B$. Ta có thể sử dụng $\texttt{Sparse Table}$ để tìm ra tổ tiên của đỉnh $A$ (hoặc $B$) là con trực tiếp của đỉnh $C$ nếu $A$ (hoặc $B$) nằm trong cây con $\texttt{DFS}$ gốc $C$.
**Bạn có thể tìm hiểu thêm về *Sparse Table* và ứng dụng của nó tại [đây](/translate/topcoder/Range-Minimum-Query-and-Lowest-Common-Ancestor)**.
- Gọi đỉnh $\texttt{pa}$ là tổ tiên của đỉnh $A$ và là con trực tiếp của đỉnh $C$.
- Gọi đỉnh $\texttt{pb}$ là tổ tiên của đỉnh $B$ và là con trực tiếp của đỉnh $C$.
- $A$ và $B$ thuộc cùng một thành phần liên thông sau khi loại bỏ đỉnh $C$ và các cạnh liên thuộc với đỉnh $C$ đi khi thỏa mãn một trong số các điều kiện sau:
	* Nếu cả $2$ đỉnh $A$ và $B$ đều **không** nằm trong cây con $\texttt{DFS}$ gốc $C$.
	* Nếu $\texttt{pa} = \texttt{pb}$ (nghĩa là cả $2$ đỉnh $A$ và $B$ đều nằm trong cây con $\texttt{DFS}$ gốc $\texttt{pa}$ ).
	* Nếu $A$ **không** nằm trong cây con $\texttt{DFS}$ gốc $C$ và $B$ nằm trong cây con $\texttt{DFS}$ gốc $C$ sao cho $\texttt{low}[\texttt{pb}] < \texttt{num}[C]$ (nghĩa là có tồn tại cung ngược nối từ cây con $\texttt{DFS}$ gốc $\texttt{pb}$ lên tổ tiên của $C$ ).
	* Nếu $B$ **không** nằm trong cây con $\texttt{DFS}$ gốc $C$ và $A$ nằm trong cây con $\texttt{DFS}$ gốc $C$ sao cho $\texttt{low}[\texttt{pa}] < \texttt{num}[C]$ (nghĩa là có tồn tại cung ngược nối từ cây con $\texttt{DFS}$ gốc $\texttt{pa}$ lên tổ tiên của $C$ ).
	* Nếu cả $2$ đỉnh $A$ và $B$ đều nằm trong cây con $\texttt{DFS}$ gốc $C$ và  $\texttt{low}[\texttt{pa}] < \texttt{num}[c]$ và $\texttt{low}[\texttt{pb}] < \texttt{num}[c]$ (nghĩa là cả $2$ cây con $\texttt{DFS}$ gốc $\texttt{pa}$ và cây con $\texttt{DFS}$ gốc $\texttt{pb}$ đều có cung ngược nối lên tổ tiên của $C$ )
- Ngược lại, nếu không thỏa mãn tất cả các điều kiện trên thì $A$ và $B$ không thuộc cùng một thành phần liên thông sau khi loại bỏ đỉnh $C$ và các cạnh liên thuộc với đỉnh $C$ đi.
- Lúc này, độ phức tạp để xử lí các truy vấn sẽ là $\mathcal{O}(Q \cdot \log N)$.

### **Cài đặt**

**Cấu trúc dữ liệu:**
- Hằng số `maxN = 100010`
- Biến `timeDfs` - Thứ tự $\texttt{DFS}$
- Mảng `low[], num[], tail[]`
- Mảng `depth[]` - Lưu chiều sâu của mỗi đỉnh trong cây $\texttt{DFS}$
- Mảng `p[][]` - Mảng ứng dụng $\texttt{Sparse Table}$ với $p[i][j]$ là tổ tiên thứ $2^{j}$ của $i$ trong cây $\texttt{DFS}$
- Mảng `joint[]` - Đánh dấu đỉnh khớp
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 100010;

int n, m, q;
int timeDfs = 0;
int low[maxN], num[maxN], tail[maxN];
int depth[maxN], p[maxN][20];
bool joint[maxN];
vector<int> g[maxN];

/* Tính mảng p */
void calP() {
    p[1][0] = 1;
    for (int j = 1; j <= 19; j++)
        for (int i = 1; i <= n; i++)
            p[i][j] = p[p[i][j - 1]][j - 1];
}

/* Tìm tổ tiên của đỉnh u là con trực tiếp của đỉnh par */
int findParent(int u, int par) {
    for (int i = 19; i >= 0; i--)
        if (depth[p[u][i]] > depth[par])
            u = p[u][i];
    return u;
}

/* Tìm khớp cầu */
void dfs(int u, int pre) {
    int child = 0;
    num[u] = low[u] = ++timeDfs;
    for (int v : g[u]) {
        if (v == pre)
            continue;
        if (!num[v]) {
            child++;
            p[v][0] = u;
            depth[v] = depth[u] + 1;
            dfs(v, u);
            low[u] = min(low[u], low[v]);
            if (u == pre) {
                if (child > 1)
                    joint[u] = true;
            } else if (low[v] >= num[u])
                joint[u] = true;
        } else
            low[u] = min(low[u], num[v]);
    }
    tail[u] = timeDfs;
}

/* Kiểm tra xem đỉnh u có nằm trong cây con DFS gốc root hay không? */
bool checkInSubtree(int u, int root) {
    return num[root] <= num[u] && num[u] <= tail[root];
}

/* Xử lí truy vấn 1 */
bool solve1(int a, int b, int g1, int g2) {
    /* Vì ta coi g2 là con trực tiếp của g1 nên khi g1 là con của g2,
    ta phải đổi chỗ 2 giá trị g1 và g2 cho nhau */
    if (num[g1] > num[g2])
        swap(g1, g2);

    /* Kiểm tra nếu cạnh (g1, g2) không phải là cầu */
    if (low[g2] != num[g2])
        return true;

    if (checkInSubtree(a, g2) && !checkInSubtree(b, g2))
        return false;
    if (checkInSubtree(b, g2) && !checkInSubtree(a, g2))
        return false;
    return true;
}

/* Xử lí truy vấn 2 */
bool solve2(int a, int b, int c) {
    if (!joint[c])
        return true;
    int pa = 0, pb = 0;
    if (checkInSubtree(a, c))
        pa = findParent(a, c);
    if (checkInSubtree(b, c))
        pb = findParent(b, c);

    if (!pa && !pb)
        return true;
    if (pa == pb)
        return true;
    if (!pa && low[pb] < num[c])
        return true;
    if (!pb && low[pa] < num[c])
        return true;
    if (pa && pb && low[pa] < num[c] && low[pb] < num[c])
        return true;

    return false;
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cin >> n >> m;
    for (int i = 1; i <= m; i++) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    depth[1] = 1;
    dfs(1, 1);
    calP();
    cin >> q;
    while (q--) {
        int type, a, b, c, g1, g2;
        cin >> type;
        if (type == 1) {
            cin >> a >> b >> g1 >> g2;
            cout << (solve1(a, b, g1, g2) ? "yes\n" : "no\n");
        } else {
            cin >> a >> b >> c;
            cout << (solve2(a, b, c) ? "yes\n" : "no\n");
        }
    }
}
```

### **Đánh giá**
- Độ phức tạp của bài toán là $\mathcal{O}(N + M + Q \cdot \log N)$

## Bài toán 3

[KBUILD - Sửa cầu](https://oj.vnoi.info/problem/kbuild)

### **Đề bài**

Cho $N$ hòn đảo và $N - 1$ cây cầu, mỗi cây cầu nối hai hòn đảo lại với nhau. Đảm bảo rằng từ một đảo bất kì luôn có thể đến được hết mọi đảo còn lại. Pirate đưa ra một lịch trình như sau: vào mỗi ngày sẽ đi kiểm tra mọi cây cầu trên đường đi từ đảo $a$ đến đảo $b$. Hỏi sau khi Pirate thực hiện xong lịch trình đó, thì còn có bao nhiêu cây cầu chưa được kiểm tra?

**Input**
- Dòng thứ nhất: số nguyên $N$ - số lượng hòn đảo.
- $N - 1$ dòng tiếp theo: mỗi dòng chứa $2$ số nguyên $a$ và $b$ - có một cây cầu nối đảo $a$ và $b$.
- Dòng thứ $N + 1$: Số nguyên $M$ - số ngày kiểm tra.
- $M$ dòng tiếp theo: mỗi dòng chứa $2$ số nguyên $a$ và $b$ - ngày hôm đó, Pirate sẽ đi kiểm tra mọi cây cầu trên đường đi từ đảo $a$ đến đảo $b$.

$1 \le N, M \le 200000$

**Output**
- Một số nguyên duy nhất thể hiện số cây cầu chưa được kiểm tra.

**Input**

```text
6
1 2
2 3
2 4
4 5
4 6
2
3 6
5 6
```

**Output**

```text
1
```

**Note**
- Ngày thứ nhất, Pirate kiểm tra các cây cầu $(2, 3), (2, 4)$ và $(4, 6)$. Ngày thứ hai, anh kiểm tra các cây cầu $(5, 4)$ và $(4, 6)$. Cây cầu duy nhất chưa được kiểm tra là $(1, 2)$.

### **Phân tích**

Vì đồ thị ban đầu liên thông và có $N - 1$ cạnh nên đây là đồ thị dạng [cây](https://vi.wikipedia.org/wiki/C%C3%A2y_(l%C3%BD_thuy%E1%BA%BFt_%C4%91%E1%BB%93_th%E1%BB%8B)).

Để tối ưu việc đánh dấu các cạnh "đã kiểm tra" thuộc đường đi từ đỉnh $u$ đến đỉnh $v$ trên cây, ta sẽ thêm một cạnh $(u,v)$ vào đồ thị. Khi đó, các cạnh thuộc đường đi từ $u \rightarrow v$ trên cây sẽ nằm trong $1$ chu trình. Từ đó, bài toán sẽ quy về thành bài toán đếm số lượng cạnh cầu của đồ thị.
- **Ví dụ minh họa:** Để dánh dấu đường đi từ đỉnh $3 \rightarrow 6$ và đường đi từ đỉnh $5 \rightarrow 6$, ta thêm cạnh $(3, 6)$, $(5, 6)$ vào đồ thị. Khi đó, đồ thị có một cạnh cầu là cạnh $(1, 2)$.

    ![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img13.png)
    
Tuy nhiên, có một trường hợp cần chú ý: cạnh thêm vào có thể đã có sẵn trong đồ thị. Khi đó, ta cần tìm cạnh cầu trong một đa đồ thị, ta sẽ phải đánh dấu nếu cạnh đó đã sử dụng.

### **Cài đặt**

**Cấu trúc dữ liệu:**
- Hằng số `maxN = 200010`
- Biến `timeDfs` - Thứ tự $\texttt{DFS}$
- Biến `bridge` - Số lượng cạnh cầu
- Mảng `low[], num[]`
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh

```cpp
#include <bits/stdc++.h>
using namespace std;

const int maxN = 2e5 + 10;

struct edge {
    int u, v;
    bool used;
    int other(int x) {
        return u ^ v ^ x;
    }
};

int n, m, timeDfs = 0, bridge = 0;
int low[maxN], num[maxN];
vector<int> g[maxN];
edge E[maxN * 2];

void minimize(int &a, int b) {
    if (a > b)
        a = b;
}

void dfs(int u) {
    num[u] = low[u] = ++timeDfs;
    for (int i : g[u]) {
        edge &e = E[i];
        if (e.used)
            continue;
        e.used = true;
        int v = e.other(u);
        if (!num[v]) {
            dfs(v);
            minimize(low[u], low[v]);
            if (low[v] > num[u])
                bridge++;
        } else {
            minimize(low[u], num[v]);
        }
    }
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    cin >> n;
    for (int i = 1; i < n; i++) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(i);
        g[v].push_back(i);
        E[i] = {u, v};
    }

    cin >> m;
    m += n - 1;
    for (int i = n; i <= m; i++) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(i);
        g[v].push_back(i);
        E[i] = {u, v};
    }

    dfs(1);
    cout << bridge;
}
```

### **Đánh giá**
- Độ phức tạp của bài toán là $\mathcal{O}(2N + M)$.

# Ứng dụng cây DFS trong bài toán liệt kê thành phần liên thông mạnh
## Định nghĩa

- Một đồ thị có hướng là liên thông mạnh nếu như từ một đỉnh bất kì luôn tồn tại ít nhất một đường đi đến bất kì đỉnh nào khác.
- Một thành phần liên thông mạnh của một đồ thị có hướng là một đồ thị con tối đại liên thông mạnh. Nếu mỗi thành phần liên thông mạnh được co lại thành một đỉnh, thì đồ thị sẽ trở thành một đồ thị có hướng không có chu trình.
- Thuật toán $\texttt{Kosaraju}$, thuật toán $\texttt{Tarjan}$, và thuật toán $\texttt{Gabow}$ đều có thể tìm các thành phần liên thông mạnh của một đồ thị cho trước trong thời gian tuyến tính. Tuy nhiên, các thuật toán của $\texttt{Tarjan}$  thường được sử dụng nhiều hơn do chúng chỉ cần thực hiện tìm kiếm theo chiều sâu một lần trong khi thuật toán của $\texttt{Kosaraju}$ cần hai lần.

![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img14.png)

## Một số định lý quan trọng

- **Định lý 1:** Nếu $a$, $b$ là hai đỉnh thuộc thành phần liên thông mạnh $C$ thì với mọi đường đi từ $a$ tới $b$ cũng như từ $b$ tới $a$. Tất cả đỉnh trung gian trên đường đi đó đều phải thuộc $C$.
**Chứng minh:** Nếu $a$ và $b$ là hai đỉnh thuộc $C$ thì tức là có một đường đi từ $a$ đến $b$ và một đường khác đi từ $b$ về $a$. Suy ra với một đỉnh $v$ nằm trên đường đi từ $a$ tới $b$ thì $a$ tới được $v$, $v$ tới được $b$, mà $b$ có đường tới $a$ nên $v$ cũng tới được $a$. Vậy $v$ nằm trong thành phần liên thông mạnh chứa $a$ tức là $v$ thuộc $C$. Tương tự với một đỉnh nằm trên đường đi từ $b$ tới $a$.

- **Định lý 2:** Với một thành phần liên thông mạnh $C$ bất kỳ, tồn tại một đỉnh $r$ thuộc $C$ sao cho mọi đỉnh của $C$ đều thuộc cây con gốc $r$ trong cây $\texttt{DFS}$.
**Chứng minh:** Trước hết, nhắc lại một thành phần liên thông mạnh là một đồ thị con liên thông mạnh của đồ thị ban đầu thoả mãn tính chất **tối đại** tức là việc thêm vào thành phần đó một tập hợp đỉnh khác sẽ làm mắt đi tính liên thông mạnh.

	Trong số các đỉnh của $C$, chọn $r$ là đỉnh được thăm đầu tiên theo thuật toán tìm kiếm theo chiều sâu. Ta sẽ chứng minh $C$ nằm trong nhánh $\texttt{DFS}$ gốc $r$. Thật vậy, với một đỉnh $v$ bất kỳ của $C$, do $C$ liên thông mạnh nên phải tồn tại một đường đi từ $r$ tới $v$: $(r = x_0, x_1, \ldots, x_k = v)$

	Từ định lý $1$, tất cả các đỉnh $x_1, x_2, \ldots, x_k$ đều thuộc $C$ nên chúng sẽ phải thăm sau đỉnh $r$. Khi thủ tục $\texttt{DFS}(r)$ được gọi thì tất cả các đỉnh $x_1, x_2, \ldots, x_k$ đều chưa thăm; vì thủ tục $\texttt{DFS}(r)$ sẽ liệt kê tất cả những đỉnh chưa thăm đến được từ $r$ bằng cách xây dựng nhánh gốc $r$ của cây $\texttt{DFS}$, nên các đỉnh $x_1, x_2, \ldots, x_k = v$ sẽ thuộc nhánh gốc $r$ của cây $\texttt{DFS}$. Bởi chọn $v$ là đỉnh bất kỳ trong $C$ nên ta có điều phải chứng minh.

	Đỉnh $r$ trong chứng minh định lý - đỉnh thăm trước tất cả các đỉnh khác trong $C$ - gọi là chốt của thành phần $C$. Mỗi thành phần liên thông mạnh có duy nhất một chốt. Xét về vị trí trong cây tìm kiếm $\texttt{DFS}$, chốt của một thành phân liên thông là đỉnh nằm cao nhất so với các đỉnh khác thuộc thành phần đó, hay nói cách khác: là tiền bối của tất cả các đỉnh thuộc thành phần đó.

- **Định lý 3:** Luôn tìm được đỉnh chốt $a$ thỏa mãn: Quá trình tìm kiếm theo chiều sâu bắt đầu từ $a$ không thăm được bất kỳ một chốt nào khác. (Tức là nhánh $\texttt{DFS}$ gốc $a$ không chứa một chốt nào ngoài $a$) chẳng hạn ta chọn $a$ là chốt được thăm sau cùng trong một dây chuyền đệ quy hoặc chọn $a$ là chốt thăm sau tất cả các chốt khác. Với chốt $a$ như vậy thì các đỉnh thuộc nhánh $\texttt{DFS}$ gốc $a$ chính là thành phần liên thông mạnh chứa $a$.
**Chứng minh**: Với mọi đỉnh $v$ nằm trong nhánh $\texttt{DFS}$ gốc $a$, xét $b$ là chốt của thành phần liên thông mạnh chứa $v$. Ta sẽ chứng minh $a = b$. Thật vậy, theo định lý $2$, $v$ phải nằm trong nhánh $\texttt{DFS}$ gốc $b$. Vậy $v$ nằm trong cả nhánh $\texttt{DFS}$ gốc $a$ và nhánh $\texttt{DFS}$ gốc $b$. Giả sử phản chứng rằng $a$ khác $b$ thì sẽ có hai trường hợp xảy ra:
    - **Trường hợp 1:** Nhánh $\texttt{DFS}$ gốc $a$ chứa nhánh $\texttt{DFS}$ gốc $b$, có nghĩa là thủ tục $\texttt{DFS}(b)$ sẽ do thủ tục $\texttt{DFS}(a)$ gọi tới, điều này mâu thuẫn với giả thiết rằng $a$ là chốt mà quá trình tìm kiếm theo chiều sâu bắt đầu từ $a$ không thăm một chốt nào khác.
    - **Trường hợp 2:** Nhánh $\texttt{DFS}$ gốc $a$ nằm trong nhánh $\texttt{DFS}$ gốc $b$, có nghĩa là $a$ nằm trên một đường đi từ $b$ tới $v$. Do $b$ và $v$ thuộc cùng một thành phần liên thông mạnh nên theo định lý $1$, $a$ cũng phải thuộc thành phần liên thông mạnh đó. Vậy thì thành phần liên thông mạnh này có hai chốt $a$ và $b$. Điều này vô lý.

    Theo định lý $2$, ta đã có thành phân liên thông mạnh chứa $a$ nằm trong nhánh $\texttt{DFS}$ gốc $a$, theo chứng minh trên ta lại có: Mọi đỉnh trong nhánh $\texttt{DFS}$ gốc $a$ nằm trong thành phân liên thông mạnh chứa $a$. Kết hợp lại được: Nhánh $\texttt{DFS}$ gốc $a$ chính là thành phần liên thông mạnh chứa $a$.

## Bài toán 4

[TJALG - Tìm TPLT mạnh](https://oj.vnoi.info/problem/tjalg)

### **Đề bài**
Cho đồ thị $G(V, E)$ có hướng $N$ $(1 \le N \le 10^{4})$ đỉnh, $M$ $(1 \le M \le 10^{5})$ cung. Hãy đếm số thành phần liên thông mạnh của $G$.

**Input**
- Dòng đầu tiên là $N, M$.
- $M$ dòng tiếp theo mô tả một cung của $G$.

**Output**
- Gồm một dòng duy nhất là số TPLT mạnh.

**Examples**

**Input**
```text
3 2
1 2
2 3
```

**Output**
```text
3
```

**Input**
```text
3 3
1 2
2 3
3 1
```

**Output**
```text
1
```

### **Thuật toán Tarjan**

![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_img15.png)

**Thuật toán Tarjan được xây dựng dựa trên các dữ kiện sau:**
- Tìm kiếm $\texttt{DFS}$ tạo ra cây/ rừng $\texttt{DFS}$
- Các thành phần liên thông mạnh tạo thành các cây con của cây $\texttt{DFS}$.
- Nếu ta có thể tìm được đỉnh gốc của các cây con như vậy, ta có thể in/ lưu trữ tất cả các nút trong cây con đó (bao gồm cả đỉnh gốc) và đó sẽ là một thành phần liên thông mạnh $(\texttt{Strongly}$ $\texttt{Connected}$ $\texttt{Components}$ - $\texttt{SCC}).$
- Không có cung ngược từ $\texttt{SCC}$ này sang $\texttt{SCC}$ khác (Có thể có các cung chéo, nhưng các cung chéo sẽ không được sử dụng trong khi xử lý đồ thị).

#### **Mô tả thuật toán**

![](/uploads/algo/graph-theory/Depth-First-Search-Tree/Depth-First-Search-Tree_gif2.gif)

#### **Ý tưởng**
- **Nhận xét:** Xét cây con gốc $u$ trong cây $\texttt{DFS}$. Gọi tập hợp các đỉnh thuộc cây con gốc $u$ là $A$, tập hợp các đỉnh không thuộc cây con gốc $u$ là $B$. Nếu tồn tại $1$ đỉnh $x$ thuộc $A$ tới được $1$ đỉnh $y$ thuộc $B$ thì $y$ phải có thứ tự thăm sớm hơn $u$. Vì nếu $y$ được thăm sau $u$ ta có thể duyệt từ $u$ qua $x$ tới $y$ khi đó $y$ sẽ trở thành con của $u$.
- Đầu tiên ta thực hiện $\texttt{DFS}$ kết hợp tính mảng $\texttt{low}[], \texttt{num}[]$ như đã trình bày ở trên. Song song với việc này, khi duyệt tới đỉnh $u$ ta sẽ thực hiện đẩy $u$ vào $\texttt{stack}$.
- Khi đã duyệt xong đỉnh $u$ (sau khi duyệt hết toàn bộ các đỉnh nằm trong cây con $\texttt{DFS}$ gốc $u$), nếu $\texttt{num}[u] = \texttt{low}[u]$ thì đây chính là đỉnh có thứ tự thăm sớm nhất của một thành phần liên thông mạnh.
- Khi đó ta sẽ loại bỏ tất cả các đỉnh trong thành phần liên thông mạnh này ra khỏi đồ thị và các đỉnh này là các đỉnh đang nằm trên $u$ trong $\texttt{stack}$ hiện tại vì các đỉnh này chính là các đỉnh nằm trên cây con gốc $u$ trong cây $\texttt{DFS}$ do các nút được đẩy vào $\texttt{stack}$ theo thứ tự thăm.
- Mặt khác, giả sử ta có đỉnh $x$ thuộc cây con gốc $u$ và $x$ thuộc một thành phần liên thông mạnh không chứa $u$ có đỉnh có thứ tự thăm sớm nhất là $y$, dễ thấy $y$ phải là con của $u$ nên thời điểm duyệt xong của $y$ sớm hơn $u$ chứng tỏ $y$ và thành phần liên thông mạnh chứa nó sẽ bị loại bỏ trước đó không còn trong $\texttt{stack}$ nữa (nếu $y$ không phải con $u$ thì vô lí vì ta đang xét mọi đỉnh trong cây con gốc $u$ chưa được xác định nằm trong thành phần liên thông mạnh nào hiện tại không tới được các đỉnh không nằm trong cây con gốc $u$).
- Ta sẽ đánh dấu tất cả các đỉnh thuộc thành phần liên thông mạnh này bằng $1$ mảng để sau này không xét lại đỉnh đấy nữa. Đồng thời, ta loại bỏ cách đỉnh này ra khỏi $\texttt{stack}$ để không làm ảnh hưởng tới các đỉnh khác vẫn còn nằm trong đồ thị.

### **Cài đặt**

**Cấu trúc dữ liệu:**
- Hằng số `maxN = 100010`
- Biến `timeDfs` - Thứ tự $\texttt{DFS}$
- Biến `scc` - Số lượng thành phần liên thông mạnh
- Mảng `low[], num[]`
- Mảng `deleted[]` - Đánh dấu các đỉnh đã bị xóa
- Vector `g[]` - Danh sách cạnh kề của mỗi đỉnh
- Ngăn xếp `st` - Lưu lại các đỉnh trong thành phần liên thông mạnh

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 100010;

int n, m;
int timeDfs = 0, scc = 0;
int low[maxN], num[maxN];
bool deleted[maxN];
vector<int> g[maxN];
stack<int> st;

void dfs(int u) {
    num[u] = low[u] = ++timeDfs;
    st.push(u);
    for (int v : g[u]) {
        if (deleted[v])
            continue;
        if (!num[v]) {
            dfs(v);
            low[u] = min(low[u], low[v]);
        } else
            low[u] = min(low[u], num[v]);
    }
    if (low[u] == num[u]) {
        scc++;
        int v;
        do {
            v = st.top();
            st.pop();
            deleted[v] = true;
        } while (v != u);
    }
}

int main() {
    cin >> n >> m;
    for (int i = 1; i <= m; i++) {
        int u, v;
        cin >> u >> v;
        g[u].push_back(v);
    }
    for (int i = 1; i <= n; i++)
        if (!num[i])
            dfs(i);

    cout << scc;
}
```

### **Đánh giá**
- Độ phức tạp của thuật toán $\texttt{Tarjan}$ là $\mathcal{O}(N + M)$

## Bài toán 5

[KCOLLECT - Thu hoạch](https://oj.vnoi.info/problem/kcollect)

### **Đề bài**
Khu vườn của Pirate có hình chữ nhật, và được chia thành $M \cdot N$ ô vuông bằng nhau. Trong mỗi ô vuông có một cây thuộc một loại quả khác nhau, đánh số từ $0$ đến $9$. Những con số này thể hiện giá trị kinh tế của các loại cây.
Tuy nhiên, nhìn mặt con Robot trái cây này có vẻ ngu ngu nên trong lần đầu tiên thử việc, Pirate muốn test AI của nó. Cụ thể là Robot phải tuân theo các quy định sau:
1. Tại mỗi ô, Robot chỉ có thể đi sang hướng đông hoặc hướng nam sang ô kề cạnh.
2. Có một số ô đặc biệt mà tại đó Robot có thể đi được thêm hướng tây hoặc hướng bắc sang ô kề cạnh (chỉ một trong hai).
3. Robot không được đi vào những ô có cây dừa.
4. Robot được đi qua một ô nhiều lần. Khi đi qua một ô, Robot phải hái hết quả ở cây trong ô đó. Lợi nhuận thu được sẽ bằng chỉ số của loại cây vừa được thu hái. Và sau này, không thể đạt thêm lợi nhuận gì từ ô đó nữa.

Xuất phát từ ô ở góc tây bắc của khu vườn, hãy giúp Robot trái cây xác định hành trình để đạt được lợi nhuận tối đa.

**Input**

- Dòng thứ nhất: ghi hai số nguyên $M$ và $N$ - kích thước của khu vườn.
- $M$ dòng tiếp theo: mỗi dòng ghi $N$ kí tự liên tiếp nhau mô tả khu vườn:
 	+ ''0'' - ''9'': các loại trái cây;
 	+ ''#'': cây dừa;
 	+ ''W'': được quyền đi theo hướng tây;
 	+ ''N'': được quyền đi theo hướng bắc.

**Output**

- Ghi một số nguyên duy nhất là lợi nhuận tối đa đạt được.

**Example**

**Input**
```text
2 3
264
3WW
```

**Output**
```text
15
```

**Note**
- Robot sẽ đi theo hành trình như sau $(1, 1) \rightarrow (1, 2) \rightarrow (1, 3) \rightarrow (2, 3) \rightarrow (2, 2) \rightarrow (2, 1)$
(ô $(i, j)$ là ô ở dòng $i$ và cột $j$). Tổng lợi nhuận sẽ là $2 + 6 + 4 + 3 = 15$.

### **Phân tích**
- **Tại sao ta không thể Quy hoạch động ngay được?**
    Theo đề bài, ở tại mỗi ô Robot có thể đi sang hướng đông (đi sang phải) hoặc hướng nam (đi xuống dưới) sang ô kề cạnh. Tuy nhiên ở những ô đặc biệt thì Robot có thể đi thêm hướng tây (đi sang trái) hoặc hướng bắc (đi lên trên). Và một ô có thể được Robot đi qua nhiều lần. Chính vì lí do này thế nên cách đi của Robot sẽ tạo thành chu trình. Khi đường đi tạo thành chu trình thì khi ta QHĐ sẽ bị vô hạn.
- **Làm sao để đường đi không tạo thành chu trình?**
    Một đồ thị có hướng là **liên thông mạnh** nếu như có đường từ bất kì đỉnh này tới bất kì đỉnh nào khác. **Một thành phần liên thông mạnh** của một đồ thị có hướng là một đồ thị con tối đại liên thông mạnh. Nếu mỗi **thành phần liên thông mạnh** được **co lại** thành một đỉnh, thì đồ thị sẽ trở thành một **đồ thị có hướng không có chu trình**. Khi dựng đồ thị mới ta sẽ có cung $(u,v)$ nếu tồn tại một đỉnh $x$ bất kì nằm trong thành phần liên thông mạnh mang nhãn $u$ có cung tới một đỉnh $y$ bất kì nằm trong thành phần liên thông mạnh mang nhãn $v$.
- **Mấu chốt của bài toán này là:** Tìm ra được các thành phần liên thông mạnh, co từng thành phần liên thông mạnh thành $1$ đỉnh. Lúc này đồ thị mới sẽ là **đồ thị DAG (Directed Acyclic Graph)**. Đây là đồ thị **"một đi không trở lại"**, vậy nên ta dễ dàng **QHĐ trên đồ thị DAG**.
- **Công thức QHĐ trên đồ thị DAG:** $f[u] = \max(f[v]) + C[u]$ với mọi $u$ có cung trực tiếp đi tới $v$; trong đó $C[u]$ là tổng giá trị kinh tế của đỉnh $u$ , $f[u]$ là tổng giá trị kinh tế lớn nhất khi ta xuất phát tại $u$ và kết thúc tại $1$ đỉnh bất kì vì ta có thể đi từ $u$ sang $v$ rồi đi theo đường đi tối ưu xuất phát tại $v$ ($u,v$ ở đây là các đỉnh trên đồ thị $\texttt{DAG}$ được tạo ra).

### **Cài đặt**

**Cấu trúc dữ liệu:**
- Để có thể dễ dàng cài đặt thì ta sẽ sử dụng kĩ thuật **"Biến mảng 2 chiều thành mảng 1 chiều"** nhằm mục đích lưu giá trị ô $(i, j)$ vào ô $(i - 1) \cdot N + j$.
- Hằng số `maxN = 100010`
- Hằng số `INF = 1000000007`
- Biến `timeDfs` - Thứ tự $\texttt{DFS}$
- Biến `scc` - Số lượng thành phần liên thông mạnh
- Mảng `a[]` - Lưu các dữ liệu vào.
- Mảng `val[]` - Lưu giá trị kinh tế của loại cây.
- Mảng `totalScc[]` - Lưu tổng giá trị kinh tế của từng thành phần liên thông mạnh.
- Mảng `root[]` - Lưu ô $(i, j)$ thuộc thành phần liên thông nào? Ta sẽ lấy thứ tự của thành phần liên thông làm đỉnh ảo trong đồ thị $\texttt{DAG}$.
- Mảng `low[], num[]`
- Mảng `deleted[]` - Đánh dấu các đỉnh đã bị xóa
- Mảng `f[]` - Mảng quy hoạch động
- Vector `g[]` - Lưu đồ thị ban đầu.
- Vector `h[]` - Lưu đồ thị mới (**đồ thị *DAG***).

```cpp
#include <bits/stdc++.h>

using namespace std;

const int maxN = 100010;
const int INF = 1e9 + 7;

int dx[] = {0, -1, 0, 1, 0};
int dy[] = {0, 0, 1, 0, -1};

int m, n;
char a[maxN];
int val[maxN], totalScc[maxN];

/* Lưu đồ thị ban đầu*/
vector<int> g[maxN];

/* Lưu đồ thị mới*/
vector<int> h[maxN];

/* Kỹ thuật "Biến mảng 2 chiều thành mảng 1 chiều" */
int getId(int i, int j) {
    return (i - 1) * n + j;
}

/* Kiểm tra ô (i, j) có được đi vào không? */
bool check(int i, int j) {
    if (a[getId(i, j)] == ''#'')
        return false;
    return (i >= 1 && j >= 1 && i <= m && j <= n);
}

/* Tìm thành phần liên thông mạnh*/
int root[maxN];
int low[maxN], num[maxN];
bool deleted[maxN];
int timeDfs = 0, scc = 0;
stack<int> st;

void dfs(int u) {
    low[u] = num[u] = ++timeDfs;
    st.push(u);
    for (int v : g[u]) {
        if (deleted[v])
            continue;
        if (!num[v]) {
            dfs(v);
            low[u] = min(low[u], low[v]);
        } else
            low[u] = min(low[u], num[v]);
    }

    if (num[u] == low[u]) {
        scc++;
        int v;
        do {
            v = st.top();
            st.pop();
            deleted[v] = true;

            /* Tính tổng giá trị kinh tế của thành phần liên thông */
            totalScc[scc] += val[v];

            /*Đỉnh scc sẽ là đỉnh ảo đại diện cho v trong đồ thị DAG*/
            root[v] = scc;
        } while (v != u);
    }
}

/* Quy hoạch động trên đồ thị DAG */
int f[maxN];

int solve(int u) {
    if (h[u].empty())
        return totalScc[u];
    if (f[u] != -1)
        return f[u];
    int cur = -INF;
    for (int v : h[u])
        cur = max(cur, solve(v) + totalScc[u]);
    return f[u] = cur;
}

int main() {
    /* Xử lý dữ liệu đầu vào */
    cin >> m >> n;
    for (int i = 1; i <= m; ++i)
        for (int j = 1; j <= n; ++j) {
            int u = getId(i, j);
            cin >> a[u];
            val[u] = (a[u] >= ''0'' && a[u] <= ''9'') ? a[u] - ''0'' : 0;
        }

    /* Xây dựng đồ thị ban đầu */
    for (int i = 1; i <= m; ++i) {
        for (int j = 1; j <= n; ++j) {
            int u = getId(i, j);
            if (a[u] == ''#'')
                continue;
            if (check(i, j + 1))
                g[u].push_back(getId(i, j + 1));
            if (check(i + 1, j))
                g[u].push_back(getId(i + 1, j));

            if (a[u] == ''W'' && check(i, j - 1))
                g[u].push_back(getId(i, j - 1));

            if (a[u] == ''N'' && check(i - 1, j))
                g[u].push_back(getId(i - 1, j));
        }
    }

    /* Tìm thành phần liên thông mạnh*/
    for (int i = 1; i <= m; ++i)
        for (int j = 1; j <= n; ++j) {
            int u = getId(i, j);
            if (!num[u] && check(i, j))
                dfs(u);
        }

    /* Xây dựng đồ thị mới */
    for (int i = 1; i <= m; ++i) {
        for (int j = 1; j <= n; ++j) {
            if (!check(i, j))
                continue;
            int u = getId(i, j);
            int ru = root[u];
            for (int v : g[u]) {
                int rv = root[v];
                if (ru != rv) {
                    /* Có cung đi từ ru đến rv trên đồ thị mới do đỉnh
                u trong TPLTM ru đi được tới đỉnh v trong TPLTM rv*/
                    h[ru].push_back(rv);
                }
            }
        }
    }
    fill(f, f + m * n + 1, -1);
    cout << solve(root[getId(1, 1)]);
}
```

### **Đánh giá**
- Độ phức tạp của bài toán là $\mathcal{O}(N \cdot M)$

# Bài tập vận dụng

### Khớp cầu

[WEATHER - Điều kiện thời tiết](https://oj.vnoi.info/problem/weather)

[CRITICAL - Thành phố trọng yếu](https://oj.vnoi.info/problem/critical/)

[BCACM11E - Phương án bắn pháo](https://www.spoj.com/PTIT/problems/BCACM11E/)

[SAFENET2 - Mạng máy tính an toàn ](https://oj.vnoi.info/problem/safenet2)

[REFORM - VOI 2015 Day 1 - Kế hoạch cải tổ](https://oj.vnoi.info/problem/reform)

### Thành phần liên thông mạnh

[Ralph and Mushrooms](https://codeforces.com/contest/894/problem/E)

[Checkposts](https://codeforces.com/contest/427/problem/C)

[MESSAGE - Truyền tin](https://oj.vnoi.info/problem/message)

[TREAT - Cho kẹo hay bị phá nào](https://oj.vnoi.info/problem/treat)
', 'int timeDfs = 0; // Thứ tự duyệt DFS

void dfs(int u, int pre) {
    num[u] = low[u] = ++timeDfs;
    for (int v : g[u]) {
        if (v == pre)
            continue;
        if (!num[v]) {
            dfs(v, u);
            low[u] = min(low[u], low[v]);
        } else
            low[u] = min(low[u], num[v]);
    }
    tail[u] = timeDfs;
}', '2026-10-06T10:32:19.936944');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_interview_google', 'Kinh nghiệm phỏng vấn Google', 'interview', 'VNOI Community', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/interview/Kinh-nghiem-phong-van-Google.md', '["phỏng vấn google", "kinh nghiệm google", "faang interview", "phỏng vấn big tech"]', 'Trong bài viết này mình muốn chia sẻ kinh nghiệm phỏng vấn Google của mình. Mình tên là RR, hiện đang làm Software Engineer ở Google. Trong thời gian làm ở Google, mình đã refer (giới thiệu) hơn 100 bạn vào Google. Mình cũng đã từng phỏng vấn khoảng 60 ứng cử viên. Đứng ở cả 2 phía của quá trình phỏng vấn đã giúp cho mình có cái nhìn rõ ràng hơn về quy trình tuyển dụng của các công ty.', '# Kinh nghiệm phỏng vấn Google

**Người viết**: RR

Trong bài viết này mình muốn chia sẻ kinh nghiệm phỏng vấn Google của mình. Mình tên là RR, hiện đang làm Software Engineer ở Google. Trong thời gian làm ở Google, mình đã refer (giới thiệu) hơn 100 bạn vào Google. Mình cũng đã từng phỏng vấn khoảng 60 ứng cử viên. Đứng ở cả 2 phía của quá trình phỏng vấn đã giúp cho mình có cái nhìn rõ ràng hơn về quy trình tuyển dụng của các công ty.

Bài viết này thể hiện quan điểm cá nhân của mình, có thể không đúng với quan điểm tuyển dụng của Google.

# 0. Quy trình phỏng vấn Google

1. **Gửi resume cho Google**: hồ sơ của các bạn sẽ được kiểm duyệt và đánh giá, sau đó những resume nào tốt sẽ được chọn vào vòng phỏng vấn. Vòng này có tỉ lệ đậu khá thấp, hầu hết hồ sơ của các bạn sẽ bị rớt từ vòng này. 2 cách gửi resume:
    - Vào trang [Google Careers](https://careers.google.com/), tìm vị trí phù hợp rồi gửi resume, hoặc
    - Tìm người refer là nhân viên Google và gửi resume trực tiếp cho người đó.

2. **Phỏng vấn**:
    - Với intern, các bạn sẽ có 2 vòng phỏng vấn online 45 phút với các lập trình viên Google. Nếu Google chưa đánh giá được trình độ các bạn sau 2 vòng thì sẽ tiến hành phỏng vấn thêm 1 vòng nữa. Kết quả phỏng vấn sẽ được báo sau vài tuần.
    - Với phỏng vấn full time, bạn sẽ phải trải qua nhiều vòng hơn (thường là 1 vòng qua điện thoại và 5 vòng trực tiếp).
    - Thời gian phỏng vấn các bạn có thể thỏa thuận với Google.

3. **Nhận kết quả phỏng vấn**: Nếu vượt qua vòng phỏng vấn, bạn sẽ nhận được thư chúc mừng từ recruiter. Các bạn đọc lưu ý bên dưới rằng ở bước này có thể các bạn sẽ chưa được nhận Offer Letter ngay, do vẫn còn bước 4 để các bạn có thể chắc chắn được đi thực tập tại Google.

4. **Host Matching**: Sau khi đậu phỏng vấn, hồ sơ của các bạn sẽ vào một danh sách để các lập trình viên tại Google hiện có dự án cho thực tập sinh xét chọn. Họ sẽ chủ động liên hệ các bạn để giới thiệu về dự án cũng như đánh giá các bạn có phù hợp với công việc không. Bạn cũng có quyền đồng ý hoặc từ chối để lựa chọn dự án phù hợp với mình. Sau khi đã chọn xong dự án thì coi như mọi thứ đã xong, các bạn sẽ được liên hệ để hoàn thành các giấy tờ và chuẩn bị cho chuyến đi thực tập vào hè. Thời gian thực tập là từ 12 đến 14 tuần và có thể bắt đầu vào thời gian bất kì trong hè tùy vào điều kiện của các bạn.

# 1. Chuẩn bị

Phỏng vấn Google chủ yếu hỏi về thuật toán. Bạn cũng có thể bị hỏi thêm 1 vài câu design (thiết kế hệ thống) hoặc những kiến thức khác. Do vậy, phần này mình sẽ chia làm 3 mục nhỏ: thuật toán, kĩ năng trình bày bằng tiếng Anh và các kiến thức khác.

## 1.1. Thuật toán

Với dân ACM ICPC hoặc OI, các câu hỏi phỏng vấn sẽ không quá khó. Để thêm tự tin, các bạn có thể luyện tập cài đặt một số bài đơn giản, chú ý vào xét trường hợp đặc biệt và cài đặt dễ hiểu. Trong vòng 1 năm trước khi phỏng vấn Google, mình đang chuẩn bị cho ICPC World final 2016, hầu như ngày nào cũng làm contest 5h, nên lúc đi phỏng vấn mình không cần chuẩn bị gì cả. Tuy nhiên, các bạn vẫn cần chú ý một số điểm sau:

- Không dùng những kiến thức phức tạp và không phổ biến như Splay Tree, Suffix Array, Max Flow...
- Chú ý 1 số thuật toán có tên gọi khác với tên gọi phổ biến ở Việt Nam, ví dụ như Interval Tree = Segment Tree.
- Tìm thuật toán thật đơn giản. Các bài phỏng vấn được làm trong thời gian ngắn, vì vậy hãy chọn cách tiếp cận đơn giản nhất. Nếu người phỏng vấn chưa hài lòng họ sẽ hỏi cách tốt hơn.
- Nắm rõ những thuật toán cơ bản dùng bộ nhớ động và con trỏ như Linked list, Tree. Các bạn cũng có thể luyện thêm trên [leetcode](https://www.leetcode.com), [CareerCup](https://www.careercup.com/), [TechieDelight](http://www.techiedelight.com/list-of-problems/).

Với các bạn không thi ACM ICPC hoặc OI, hoặc bạn đã bỏ thi sau nhiều năm, các bạn có thể lên mạng làm thử 1 số bài gần với những bài được dùng trong phỏng vấn, ví dụ trang [leetcode](https://www.leetcode.com). Với mỗi bài, có thể luyện tập như sau:

- Tập trình bày thuật toán một cách rõ ràng.
- Phân tích thuật toán, cả tốc độ và thời gian chạy. Có thể tham khảo thêm [bài viết về độ phức tạp tính toán trên VNOI wiki](/translate/topcoder/Computational-Complexity-Section-1).
- Suy nghĩ xem có những corner cases nào (trường hợp đặc biệt).
- Trong trường hợp nào thì thuật toán có độ phức tạp xấu nhất.
- Phần nào của code có thể được thay đổi để:
    - Giảm độ phức tạp tính toán.
    - Giảm bộ nhớ.
    - Cài đặt đơn giản hơn.

Để kết thúc phần này, mình sẽ lấy ví dụ về một câu phỏng vấn:

> Một xâu được gọi là xâu đối xứng nếu nó đọc từ trái qua phải cũng giống như từ phải qua trái. Ví dụ: "abcba", "a", "abba" là các xâu đối xứng. "abc" không phải là xâu đối xứng. Cho xâu S. Tìm xâu con gồm các ký tự liên tiếp của S, có độ dài lớn nhất và là xâu đối xứng.

Lời giải bài này các bạn có thể tìm thấy trên [VNOI wiki](/algo/dp/palindrome-problems). Với các bạn dân ACM khi gặp bài này, nên tránh những thuật toán như [Hash](/algo/string/hash), vì có thể người phỏng vấn sẽ thắc mắc những vấn đề như đánh giá độ chính xác. Bạn cũng nên tránh thuật toán không phổ biến như Manacher.

## 1.2. Tiếng Anh

Quá trình phỏng vấn của Google rất coi trọng khả năng trình bày ý tưởng. Điều này đơn giản là vì nếu không có khả năng giao tiếp tốt, bạn không thể trở thành Software Engineer giỏi. Khi phỏng vấn, mình được phỏng vấn bởi các Software Engineer ở các khu vực khác nhau: Trung Quốc, Ấn độ, Singapore, châu Âu.. Tiếng Anh của bạn cần khá tốt để có thể nghe hiểu được các accent tiếng Anh khác nhau.

Việc trình bày thuật toán một cách dễ hiểu cũng rất quan trọng. Trước khi bắt đầu code, bạn cần giải thích thuật toán của mình rõ ràng mạch lạc, để người phỏng vấn có thể hiểu được. Sau đó, nếu cảm thấy thuật toán của bạn chưa đủ tốt, người phỏng vấn sẽ tiếp tục thảo luận thêm với bạn hoặc đưa ra gợi ý cho bạn làm tốt hơn.

Khi chuẩn bị phỏng vấn, hãy:

- Tập trình bày thuật toán của mình mạch lạc dễ hiểu.
- Tìm một người khác cùng luyện tập với mình, để 2 người trao đổi thuật toán với nhau. Có thể sử dụng những trang web như [Pramp](https://www.pramp.com/) để luyện tập.

Bạn không cần giỏi tiếng Anh nhưng cần nắm rõ từ chuyên môn (ví dụ tên tiếng Anh tất cả các thuật toán), diễn đạt hợp lý và có sự tự tin.

## 1.3. Các kiến thức khác

- Để trả lời tốt các câu design, các bạn nên Google để tìm đọc thêm nhiều. Bạn cần có nhiều kinh nghiệm thực tế để trả lời những câu này, do đó mình sẽ không đi sâu vào phần này.
- Bạn cũng có thể bị hỏi 1 số câu cơ bản, ví dụ như pointer, memory allocation. Nếu bạn dùng Java cũng có thể bị hỏi những câu về JVM, garbage collection.

# 2. Nộp Resume

## 2.1. Soạn Resume

Resume là một phần rất quan trọng trong quá trình phỏng vấn. Một resume không chỉ cần thể hiện rõ trình độ và kinh nghiệm của bạn mà còn cần được trình bày kĩ lưỡng và cẩn thận. Có rất nhiều lý do:

- Người duyệt resume của bạn không có nhiều thời gian. Thông thường họ sẽ chỉ nhìn qua Resume của thí sinh trong 1 vài phút. Do đó resume cần trình bày khoa học, nhấn mạnh những chỗ cần thiết và không dài dòng.
- Khi nhìn resume kém, người phỏng vấn có thể sẽ hỏi những câu hỏi dễ hơn mức thông thường, và bạn sẽ khó có thể chứng tỏ khả năng của mình hơn.

Dưới đây là một vài resume "chuẩn" của các bạn đã được nhận bởi Google:

- [Trương Minh Bảo](https://drive.google.com/file/d/0BwcTB8a10LBwdXdxOWoyRjdVNWc/view?usp=sharing&resourcekey=0-ZTkE-0Semg1HOCfECTWxug)
- [Hồ Vĩnh Thịnh](https://drive.google.com/file/d/0BwcTB8a10LBwVTZESTd5UHZVaFk/view?usp=sharing&resourcekey=0-0hvRokQYBn6hpC2BOiESXA)

Các đặt điểm cần chú ý của các resume này:

- **Trình bày** đơn giản, rõ ràng, có sự thống nhất, ví dụ:
    - Các gạch đầu dòng cùng 1 kiểu.
    - Tiêu đề cùng 1 kiểu.
    - Không có nhiều font chữ. Những chỗ cần nhấn mạnh được bôi đen.
- Về **ngữ pháp**:
    - Cấu trúc câu đơn giản. Các câu không cần có chủ ngữ.
    - Những sự việc nào ở quá khứ thì chia đúng thời quá khứ.
    - Các câu nên bắt đầu bằng những động từ mạnh như Implement, Lead, Design, Teach..
- Phần giải thưởng chỉ liệt kê có chọn lọc khoảng 3 4 giải thưởng có giá trị nhất.
- Có giải thích rõ ràng cho tất cả các phần:
    - Giải thưởng thì phải nói rõ quy mô (bao nhiêu đội tham gia), thi về cái gì, đạt giải ra sao.
    - Kinh nghiệm làm việc cần có mô tả sơ qua về công việc, nêu rõ những gì đã học được như ngôn ngữ lập trình, framework, tools..


## 2.2. Kiếm người refer

Ở vòng đầu tiên, resume của bạn sẽ được duyệt bởi recruiter. Những người này không phải là Software Engineer nên có lúc sẽ không đánh giá đúng được trình độ của bạn, do đó quá trình duyệt Resume sẽ có rủi ro nhất định. Trong những bạn mình refer, có hai bạn rất khá nhưng trượt vòng resume (đã nhận được email từ chối của Google). Tuy nhiên sau đó mình đã liên hệ trực tiếp với recruiter, viết 2 email rất dài để chứng minh 2 bạn đó rất giỏi. Kết quả cả 2 bạn đều được đi tiếp đến vòng phỏng vấn và 1 bạn sẽ đi thực tập ở Google vào hè tới. Ví dụ này cũng cho thấy quá trình duyệt resume cũng có rủi ro, và tài năng thật sự có thể bị bỏ qua.

Tuy nhiên bạn chỉ nên nhờ những người có quen biết trực tiếp với bạn refer. Bởi khi refer, sẽ cần phải trả lời những câu hỏi như:

- Bạn quen ứng viên này ra sao?
- Ứng viên này theo bạn đánh giá có giỏi không?
- Ứng viên này có thông minh không?

Với một người chỉ biết bạn sơ sơ, tất nhiên họ sẽ không có cách nào trả lời những câu hỏi trên. Do đó sẽ không thể giúp bạn nhiều.

Vậy tìm người refer ở đâu? Cách tốt nhất là hãy tìm hiểu xem trường của bạn hoặc những trường xung quanh có ai đã đi thực tập ở Google. Nếu bạn là dân ACM thực thụ, cũng có thể [liên hệ mình](https://fb.com/Nguyen.RR).

# 3. Phỏng vấn

Với phỏng vấn intern, sẽ gồm khoảng 2 vòng phỏng vấn qua điện thoại. (sẽ có thể có thêm phụ thuộc vào kết quả của 2 vòng đó).

Với phỏng vấn full time, sẽ gồm 1 vòng phỏng vấn qua điện thoại + khoảng 5 vòng phỏng vấn trực tiếp. Mình có kết quả thi Google Code Jam khá tốt, nên được miễn 1 vòng phỏng vấn qua điện thoại và được recruiter liên hệ trực tiếp luôn. Đây cũng là 1 lý do các bạn nên cố gắng hết sức để thi những kỳ thi như Google Code Jam ;).

Mỗi vòng phỏng vấn thường kéo dài khoảng 45''. Bạn sẽ cần trả lời 2-3 câu đơn giản hoặc 1 câu khó.

Bạn sẽ phải code trên Google Docs, và theo mình biết kết quả phỏng vấn của bạn sẽ được quyết định bởi những người phỏng vấn và hiring committee (tạm dịch là hội đồng chấm thi). Hiring committee sẽ có bản Google Docs của các bạn, vì vậy các bạn cũng nên viết sơ qua thuật toán, độ phức tạp vào trong Google Docs trong lúc giải thích cho người phỏng vấn.

Một số chú ý trong quá trình phỏng vấn:

- Đề bài được người phỏng vấn đưa ra có thể thiếu nhiều chi tiết. Trước khi cài đặt bạn cần hỏi rõ những điểm chưa được nói rõ. Ví dụ nếu xử lý xâu thì có thể có những ký tự nào, có thể dùng ASCII thông thường không..
- Suy nghĩ cẩn thận về các corner case trước khi bắt đầu cài đặt, và giải thích với người phỏng vấn. Điều này không phải lúc nào cũng đơn giản. Nếu khi đang code bạn mới nghĩ ra corner case thì nên nói ngay với người phỏng vấn.
- Khi code, bạn nên chọn thuật toán nào bạn có thể tự tin code được. Đơn giản bởi bạn code một chương trình hoàn chỉnh mà không tối ưu sẽ tốt hơn hẳn việc bạn không code xong.
- Với những bài sử dụng cấu trúc dữ liệu, bạn có thể giả sử bạn đã có một thư viện với cấu trúc dữ liệu đó, ví dụ bạn có thể giả sử đã có 1 class BalancedBinarySearchTree với các hàm insert, delete, update.. Dĩ nhiên bạn cũng phải nói rõ với người phỏng vấn.
- Bạn có thể trình bày một thuật toán tối ưu, và khi code xin phép code cách đơn giản hơn. Nói rõ với người phỏng vấn là bạn không tự tin code được thuật toán tối ưu.
- Khi code, sử dụng tên biến rõ ràng, dễ hiểu. Hạn chế đặt tên biến gồm 1 ký tự.

Mình sẽ lấy ví dụ về mặt cài đặt bằng bài toán tìm xâu con đối xứng dài nhất với độ phức tạp $\mathcal{O}(N^{2})$ ở phần 1:

```cpp
#include <string>
using namespace std;

int expand(const string &s, int left, int right) {
    // given a palindrome substring: s[left..right], we expand [left, right] to
    // find the maximum palindrome substring with center [left..right].
    // returns: length of maximum palindrome substring with center [left..right].

    while (left > 0 && right + 1 < s.length() && s[left - 1] == s[right + 1]) {
        left--;
        right++;
    }
    return right - left + 1;
}

int max_palindrome_substring(string s) {
    // Given string s, find its longest palindrome substring.
    // Returns: length of longest palindrome substring.
    int result = 0; // our result

    for (int center = 0; center < s.length(); center++) {
        // odd-length substrings
        result = max(result, expand(s, center, center));

        // even-length substrings
        if (center + 1 < s.length() && s[center] == s[center + 1]) {
            result = max(result, expand(s, center, center + 1));
        }
    }
    return result;
}
```

Một vài chú ý trong code trên:

- Mình vẫn có biến tên có 1 ký tự (s) nhưng rất hạn chế.
- Tránh lặp lại code. Ví dụ phần xét xâu đối xứng độ dài chẵn và lẻ có code giống nhau thì tách thành hàm riêng.
- Khi phỏng vấn, mình cũng vừa code vừa comment như vậy. Trong quá trình code mình hầu như không nói chuyện với interviewer mà chỉ viết comment. Nếu có nói thì mình cũng chỉ đọc lại comment.

# 4. Host matching

Như đã trình bày ở phần đầu bài viết, vòng cuối cùng bạn phải vượt qua là "Host matching". Mục đích của phần này là để các team tìm người phù hợp. Do đó bạn sẽ được phỏng vấn với người thuộc team đó, và bị hỏi gì cũng phụ thuộc chủ yếu vào team. Có team sẽ hỏi thuật toán, code, có team sẽ chỉ hỏi chung chung về sở thích của bạn hoặc có team sẽ chỉ giới thiệu về những cái họ làm rồi nhận luôn chứ không cần hỏi gì thêm.

Vòng này có tính rủi ro khá cao. Bạn có thể tăng khả năng đỗ của mình nếu có quen biết với nhân viên Google và xin trực tiếp vào những team đó. Ngoài ra nếu bạn nộp resume sớm sẽ có lợi thế hơn ở vòng này. Ví dụ các bạn muốn đi thực tập vào hè 2017, thì nên nộp resume từ tháng 9 năm 2016.
', '#include <string>
using namespace std;

int expand(const string &s, int left, int right) {
    // given a palindrome substring: s[left..right], we expand [left, right] to
    // find the maximum palindrome substring with center [left..right].
    // returns: length of maximum palindrome substring with center [left..right].

    while (left > 0 && right + 1 < s.length() && s[left - 1] == s[right + 1]) {
        left--;
        right++;
    }
    return right - left + 1;
}

int max_palindrome_substring(string s) {
    // Given string s, find its longest palindrome substring.
    // Returns: length of longest palindrome substring.
    int result = 0; // our result

    for (int center = 0; center < s.length(); center++) {
        // odd-length substrings
        result = max(result, expand(s, center, center));

        // even-length substrings
        if (center + 1 < s.length() && s[center] == s[center + 1]) {
            result = max(result, expand(s, center, center + 1));
        }
    }
    return result;
}', '2026-10-06T10:32:20.383115');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_interview_practical', 'Những lần phỏng vấn và những bài học rút ra', 'interview', 'Lê Trương Quốc Thắng', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/interview/Nhung-lan-phong-van-trong-thuc-te-va-bai-hoc-rut-ra.md', '["kinh nghiệm phỏng vấn", "phỏng vấn xin việc", "bài học phỏng vấn", "live coding"]', 'Sau phần giới thiệu bản thân, câu hỏi đầu tiên như sau:', '# Những lần phỏng vấn và những bài học rút ra

**Tác giả**: Lê Trương Quốc Thắng

**Thông thường trong các vòng phỏng vấn sẽ có một vòng về chuyên ngành các bạn đam mê. Mình chuyên về Android nên các vòng bên dưới là về Android**

## SkedGo Internship

Sau phần giới thiệu bản thân, câu hỏi đầu tiên như sau:

- Có 25 con ngựa và 5 đường đua.
- Các đường đua chỉ có thể xác định thứ tự về đích mà không biết chính xác thời gian về đích của mỗi con ngựa.
- Hỏi cần ít nhất bao nhiêu vòng đua để chọn ra 3 con ngựa nhanh nhất?

Đây là một câu hỏi rất hay trong phỏng vấn vì rất khó để đưa ra câu trả lời chính xác ngay, từ đó dễ dàng kiểm tra khả năng giao tiếp, cách ứng viên phát hiện dần dần và giải quyết vấn đề. Điều người phỏng vấn mong muốn thấy khi hỏi câu này không phải là một câu trả lời đúng ngay lập tức (nếu được thì quá tốt) mà là kỹ năng giao tiếp, giải quyết vấn đề, cải tiến cách giải quyết.... để đạt được mục tiêu cuối cùng.

## VNG Fresher

VNG là một trong những công ty khởi nghiệp thành công vang dội trong ngành CNTT ở Việt Nam.

### Quy trình phỏng vấn

-  Vòng 1: Tư duy logic và lập trình cơ bản. Một bộ đề bí mật được cập nhật thường xuyên, bao gồm các câu hỏi để đánh giá khả năng suy luận và kiến thức cơ bản về tin học của ứng viên. Ở vòng này không đòi hỏi bất cứ kiến thức chuyên ngành hay kinh nghiệm làm việc gì.

    Một vài câu hỏi thú vị:

    - Có 2 vòi nước, 1 vòi nếu chảy vào bể nước thì mất 2 phút đầy 1 vòi mất 3 phút thì đầy, bể nước có 1 lỗ xả và nếu để bể nước đầy thì mất 6 phút để xả hết. Vậy nếu cho 2 vòi nước chảy cùng lúc vào bể và mở lỗ xả nước thì mất bao lâu để bể đầy?
    - Điền số tiếp theo vào dãy số 9, 15, 32, 57, ..

- Vòng 2: Kiến thức về lập trình hướng đối tượng (Object Oriented Programming), Java và Android.

- Vòng 3: Các câu hỏi cơ bản về tin học, mức độ sâu sẽ tăng dần theo từng câu hỏi. Một vài câu hỏi ví dụ:

    - Sự khác biệt giữa GET & POST (hai phương thức trao đổi dữ liệu phổ biến trong mạng máy tính)? Từ những khác biệt đó sẽ mang lại hệ quả gì? 
    - Cho ví dụ khi nào dùng giao thức TCP, khi nào dùng giao thức UDP? Để trả lời được câu hỏi này cần hiểu sâu 2 giao thức này.

Ngoài ra còn gặp gỡ, trao đổi với phó giám đốc bộ phận tuyển dụng. Mục đích là để xem xét sự phù hợp với văn hoá và con người công ty.

**Không nhận được lời mời làm việc (offer) không có nghĩa là bạn không giỏi mà nó nghĩa là bạn và công ty không phù hợp. Ví dụ như công ty khởi nghiệp (start-up) đòi hỏi nhân viên phải học hỏi thật nhanh, làm ra sản phẩm thật nhanh nhưng bạn thì chú trọng nhiều vào chất lượng của mã (code), rõ ràng bạn không phù hợp. Nhưng bạn lại phù hợp với công ty chú trọng hơn vào chất lượng, ví dụ Google, Facebook,... chẳng hạn. Phỏng vấn là đôi bên tìm hiểu lẫn nhau, xem có phù hợp với nhau không chứ không phải chỉ là công ty tìm người làm việc.**

**Còn tiếp...**', '', '2026-10-06T10:32:20.887604');
INSERT OR REPLACE INTO vnoi_real_knowledge (id, title, category, author, source_url, keywords, summary, content, code_sample, updated_at) VALUES ('vnoi_interview_perspectives', 'Kinh nghiệm phỏng vấn - Góc nhìn từ người phỏng vấn', 'interview', 'Nguyễn *RR* Thành Trung', 'https://github.com/VNOI-Admin/vnoi_wiki/blob/master/interview/experience-from-interviewer.md', '["góc nhìn người phỏng vấn", "lời khuyên nhà tuyển dụng", "tiêu chí đánh giá"]', 'Bạn đã bao giờ bước vào một cuộc phỏng vấn mà không biết phải chuẩn bị gì? Bạn đã bao giờ phỏng vấn xong, nghĩ mình trả lời cũng ổn, nhưng vẫn bị đánh trượt? Trong bài viết này, mình muốn chia sẻ về việc phỏng vấn từ góc nhìn của người *phía bên kia chiến tuyến*.', '# Kinh nghiệm phỏng vấn - Góc nhìn từ người phỏng vấn

**Tác giả**: Nguyễn *RR* Thành Trung

# Mở đầu

Bạn đã bao giờ bước vào một cuộc phỏng vấn mà không biết phải chuẩn bị gì? Bạn đã bao giờ phỏng vấn xong, nghĩ mình trả lời cũng ổn, nhưng vẫn bị đánh trượt? Trong bài viết này, mình muốn chia sẻ về việc phỏng vấn từ góc nhìn của người *phía bên kia chiến tuyến*.

Ở Garena Singapore, mình được làm nhiệm vụ phỏng vấn các ứng viên nộp đơn vào vị trí Software Engineer.

Quy trình phỏng vấn của Garena có thể nói là khá đơn giản, sau khi hồ sơ qua được vòng duyệt hồ sơ, thí sinh phải trải qua:

- 2 vòng phỏng vấn kiến thức cơ bản trong khoa học máy tính như thuật toán, kĩ năng code, hệ điều hành, mạng máy tính, database, ...
  - Trong thời gian mình làm ở Garena, công ty có phỏng vấn rất nhiều người từ Việt Nam qua. Mình thường sẽ phỏng vấn những thí sinh này qua Skype bằng tiếng Việt. Vòng còn lại sẽ phỏng vấn bằng tiếng Anh. Quan điểm của công ty mình là kiến thức và kĩ năng quan trọng hơn ngôn ngữ, nên tiếng Anh của bạn kém 1 chút cũng không sao (miễn có thể hiểu nhau là được). Điều này hoàn toàn khác với một số công ty như Google.
  - Vì phỏng vấn qua Skype, thí sinh ngồi phỏng vấn qua máy tính, và code luôn trực tiếp qua online editor.
- Nếu vị trí có tính chất đặc biệt như lập trình Android / iOS, frontend, thì thí sinh sẽ phải trải qua thêm 1 vòng phỏng vấn nữa, hỏi chuyên sâu về kiến thức cần biết của vị trí đó.

Chú ý rằng trong bài viết này, mình chỉ chia sẻ quan điểm của cá nhân mình về việc phỏng vấn. Nó không phản ánh quan điểm của Garena và có thể không đúng nếu bạn phỏng vấn Garena với một người phỏng vấn khác.


# Mục đích phỏng vấn

Theo quan điểm của mình, một cuộc phỏng vấn là một cuộc tìm hiểu lẫn nhau của ứng viên và công ty:

- Trong suốt quá trình phỏng vấn, người phỏng vấn sẽ cố gắng tìm hiểu kiến thức, kĩ năng cũng như tính cách của bạn, để xem có phù hợp với công ty hay không. Dù bạn có giỏi nhưng tính cách không phù hợp thì cũng chắc chắn không được nhận.
- Ngược lại, là ứng viên, bạn cũng cần tìm hiểu công ty. Mình thường đánh giá rất thấp những ứng viên chỉ biết trả lời những gì được hỏi, và không có chút gì muốn tìm hiểu về công ty.


# Nội dung phỏng vấn

Như đã nói ở trên, nội dung phỏng vấn gồm rất nhiều phần:

- Thuật toán
- Kĩ năng code
- Hệ điều hành
- Mạng máy tính
- Database

Tùy theo người phỏng vấn, họ sẽ hỏi các phần ở các độ sâu khác nhau, tuy nhiên thuật toán và kĩ năng code thường là phần quan trọng nhất. Cá nhân mình thì chỉ giỏi về thuật toán và code, nên mình thường chỉ hỏi tập trung vào 2 phần đó, và các phần khác mình thường hỏi khá đơn giản.

## Thuật toán và Kĩ năng code

Thông thường, với câu hỏi về thuật toán, mình sẽ nhìn vào Resume của ứng viên để chọn câu hỏi. Thường sau khi nhìn hồ sơ mình chia thành 3 nhóm:

1. Nhóm chưa từng tham gia Competitive Programming
2. Nhóm đã từng tham gia Competitive Programming: đã từng thi những giải như HSG cấp tỉnh, quốc gia hoặc Tin học trẻ
3. Nhóm có rất nhiều kinh nghiệm Competitive Programming: thường là mình đã từng nghe tên hoặc đã biết.

Với 3 nhóm, độ khó câu hỏi cũng như yêu cầu của mình sẽ khác nhau.

### Ai + Aj = S

Với nhóm 1 và 2 (và thỉnh thoảng là nhóm 3), mình hỏi cùng 1 câu hỏi như sau:

> Cho mảng A gồm N phần tử và một số nguyên S. Đếm số cặp chỉ số (i, j) mà A(i) + A(j) = S
> Ví dụ:
> A = [1, 5, 2, 4, 3]
> S = 6
> --> code của bạn cần trả lại 2

Sau khi nghe xong câu hỏi thì thường bạn sẽ phải nói cho mình cách làm, sau khi mình thấy hợp lý thì bạn có thể bắt đầu code. Mình chọn câu hỏi này vì nó có nhiều cách làm:


**1. Cách $\mathcal{O}(N^{2})$**

Cách hiển nhiên nhất $\mathcal{O}(N^{2})$: Dùng 2 vòng `for` để đếm. Đây là cách cơ bản nhất và ứng viên buộc phải trả lời được. Cài đặt cũng rất đơn giản như sau:

```cpp
int result = 0;
for (int i = 0; i < n; i++)
    for (int j = i + 1; j < n; j++)
        if (A[i] + A[j] == S)
            result += 1;
```

Chú ý vòng `for` bên trong chạy từ `i+1` để tránh đếm trùng. Điều này tưởng như rất đơn giản nhưng nhiều thí sinh thuộc nhóm 1 không làm được (các bạn thường `for` từ 0 và không xử lý được khi thấy đếm bị trùng).


**2. Cách $\mathcal{O}(N \times \log{N})$**

Một cách cài đặt "trâu bò" hơn là $\mathcal{O}(N \times \log{N})$:

Sắp xếp lại rồi với mỗi $A_i$, chặt nhị phân để đếm số lượng giá trị $j$. Cách này có nhược điểm là dễ bị đếm trùng. Để khắc phục thì có 2 cách:

- Chặt nhị phân 2 lần, lần đầu tìm vị trí đầu tiên của $j$, lần 2 tìm vị trí cuối cùng của $j$.
- Rời rạc hóa.

Mình nhận thấy 1 số bạn trong nhóm 2 đi theo hướng này, nhưng mình không đánh giá cao vì nó phức tạp hơn cách 3 ở dưới. Nhưng tất nhiên nếu bạn cài đặt tốt và đơn giản thì không sao cả.

Khi ứng viên trả lời theo hướng này, thường (tùy theo cảm hứng của mình lúc phỏng vấn), mình có thể hỏi thêm:

- Bạn biết những thuật toán `sort` nào?
- Ngôn ngữ lập trình bạn đang dùng cài đặt thuật toán `sort` nào?
- Bạn có thể tự cài đặt 1 thuật toán `sort` với độ phức tạp $\mathcal{O}(N \times \log{N})$ không?

**3. Cách $\mathcal{O}(N)$**

Cách "chuẩn" $\mathcal{O}(N)$ là sử dụng [hash table](/algo/data-structures/hash-table) hoặc `map` trong C++ để lưu lại các phần tử của dãy, vừa lưu vừa đếm:

```cpp
map<int, int> count;
int result = 0;
for (int i = 0; i < n; i++) {
    result += count[S - A[i]];
    count[A[i]] += 1;
}
```

Thường nếu các bạn chỉ nghĩ ra cách 1, sau khi bạn cài đặt xong, nếu thấy còn đủ thời gian mình sẽ gợi ý để làm được cách này.

Nếu ứng viên trả lời theo hướng này, mình cũng có thể hỏi thêm:

- Bạn có biết hash table được cài đặt thế nào không?
- Bạn có thể tự cài đặt hash table không?


## Đánh giá

Khi ứng viên trả lời, mình đánh giá theo nhiều tiêu chí:

- Giải thích thuật toán: Bạn có diễn đạt cho mình hiểu được không?
- Cẩn thận: Bạn có tránh được các trường hợp lỗi không (chẳng hạn nếu làm theo cách 2 thì dễ bị đếm lặp và bạn có nhận ra không?).
- Cài đặt: Cách cài đặt của bạn có dễ hiểu không? Có xét đủ hết các trường hợp hay không?
- Debug: Sau khi code xong bạn có thể chạy thử code của mình. Nếu code sai, mình sẽ quan sát xem bạn debug như nào? Kĩ năng debug có tốt không?


Mình dùng đi dùng lại 1 câu hỏi vì như vậy mình sẽ nắm được rất rõ các cách trả lời khác nhau và các lỗi bạn đã gặp phải. Tuy nhiên tùy ngẫu hứng mình sẽ có thể hỏi thêm các chi tiết khác nhau, ví dụ:

- Nếu bạn dùng C++: Nếu dùng hàm `sort`, bạn có biết `sort` của C++ dùng thuật toán gì không? Nếu dùng `vector`, bạn có biết độ phức tạp mỗi thao tác là bao nhiêu không?
- Nếu bạn dùng Python: Bạn có biết trong Python 2 có hàm `range` và `xrange` không? Bạn có biết nó khác gì nhau không?

Thường những câu hỏi này mình hỏi khá ngẫu hứng và trong trường hợp không trả lời được, bạn cũng không cần lo lắng.

### Count Palindrome

Với nhóm 3, thường mình sẽ hỏi câu như sau:

> Cho 1 xâu S. Đếm số substring của S là Palindrome

Bài này cũng có 2 cách làm chính với độ phức tạp $\mathcal{O}(N^{2})$:

1. Quy hoạch động
2. Xét tâm của Palindrome và duyệt sang 2 bên.

Thỉnh thoảng, với nhóm 1 hoặc 2, nếu bạn trả lời câu trước quá kém và mình thấy còn thời gian, mình sẽ cho "gỡ gạc" bằng câu này, tuy nhiên mình chỉ yêu cầu làm cách duyệt toàn bộ với độ phức tạp $\mathcal{O}(N^{3})$ là đủ.

Đánh giá của mình cũng dựa trên những tiêu chí như phần trên.

## Hệ điều hành

Phần này mình thường không hỏi nhiều. Mình thường sẽ bắt đầu bằng câu hỏi:

> Thread và Process giống và khác nhau thế nào?

Sau đó, tùy theo cách bạn trả lời hoặc tâm trạng của mình lúc đó, mình có thể hỏi thêm 1 số phần khác như:

- Thread Communication và Process Communication
- Lock, Semaphore
- Context Switch

Mình không giỏi về hệ điều hành nên thường yêu cầu không cao. Bạn trả lời được những ý cơ bản là đạt yêu cầu của mình.

## Mạng máy tính

Phần này mình cũng thường không hỏi nhiều. Mình thường bắt đầu bằng câu hỏi:

> UDP và TCP khác nhau thế nào?

Sau đó, mình có thể hỏi thêm 1 số phần khác như:

- TCP handshake
- Congestion control

Mình không giỏi về phần nên thường yêu cầu không cao. Bạn trả lời được những ý cơ bản là đạt yêu cầu của mình.


# Những lỗi cần tránh

Ở Garena mình được đánh giá là một trong những người phỏng vấn khó tính nhất. Với những người khó tính như mình, có một số lỗi mà bạn cần tránh trong suốt quá trình phỏng vấn:

- Dùng Google mà không nói với mình: Mình đã từng gặp trường hợp sau khi mình vừa nói câu hỏi, thí sinh xin phép suy nghĩ nhưng sau đó mình lại nghe thấy nhiều tiếng gõ phím và click chuột (chú ý mình phỏng vấn qua Skype nên mới có trường hợp như vậy). Mình đoán bạn đó đang Google để tìm lời giải, và trường hợp như vậy gần như chắc chắn sẽ bị đánh trượt.
- Đến muộn lúc phỏng vấn: Nếu bạn vào muộn không quá 5 phút thì thường mình cũng không có vấn đề gì, tuy nhiên nếu bạn đến quá muộn mà không có lý do phù hợp thì mình sẽ đánh giá là bạn không có sự chuẩn bị cẩn thận cho cuộc phỏng vấn.
- Chém gió quá nhiều trong Resume: Nếu bạn viết bất kỳ cái gì vào Resume, mình có thể sẽ hỏi. Nếu bạn không trả lời được những kiến thức cơ bản, mình sẽ đánh giá rất thấp. Ví dụ bạn viết vào Resume là biết dùng git, nhưng không thể giải thích được `git commit` là gì.
- Xin đổi câu hỏi với câu thuật toán / code: Đã có trường hợp sau khi mình nói đề, thí sinh không suy nghĩ nhiều mà xin đổi câu hỏi luôn. Vì thuật toán và kỹ năng code là câu hỏi quan trọng, nên thông thường mình sẽ đổi câu hỏi khó hơn.
- Thể hiện không có tinh thần học hỏi. Ví dụ ứng viên không muốn học ngôn ngữ lập trình mới. Đối với Software Engineer mình thấy đây là điều tối kị, vì công nghệ thay đổi liên tục mỗi ngày và bạn phải không ngừng học hỏi. Ngược lại, cũng đã có trường hợp mình đánh đỗ ứng viên vì mình thấy bạn đó có tinh thần học hỏi rất tốt mặc dù kiến thức không tốt lắm.


# Feedback

Thông thường, các công ty sẽ hạn chế đưa ra Feedback đối với thí sinh. Thông thường nếu bạn hỏi sẽ chỉ nhận được những câu trả lời chung chung và hầu hết công ty sẽ không đưa ra lý do chính xác khiến bạn bị đánh trượt. Lý do là để bảo vệ công ty:

- Nếu không cẩn thận trong việc đưa ra lý do, công ty có thể bị ném đá nếu bạn chia sẻ bừa bãi lý do và lý do đó không được số đông đồng tình.
- Lý do bạn bị trượt là do người phỏng vấn và có thể là thêm người review lại feedback của người phỏng vấn. Lý do đó có thể không áp dụng cho toàn bộ các cuộc phỏng vấn của công ty và do đó không thể phản ánh đúng về công ty.
', 'int result = 0;
for (int i = 0; i < n; i++)
    for (int j = i + 1; j < n; j++)
        if (A[i] + A[j] == S)
            result += 1;', '2026-10-06T10:32:21.360909');
