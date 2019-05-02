/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jdani
 */
@Entity
@Table(name = "comentario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comentario.findAll", query = "SELECT c FROM Comentario c")
    , @NamedQuery(name = "Comentario.findByFecha", query = "SELECT c FROM Comentario c WHERE c.fecha = :fecha")
    , @NamedQuery(name = "Comentario.findByPostId", query = "SELECT c FROM Comentario c WHERE c.comentarioPK.postId = :postId")
    , @NamedQuery(name = "Comentario.findByUsuarioId", query = "SELECT c FROM Comentario c WHERE c.comentarioPK.usuarioId = :usuarioId")})
public class Comentario implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ComentarioPK comentarioPK;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "texto")
    private String texto;
    @Column(name = "fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @JoinColumn(name = "post_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Post post;
    @JoinColumn(name = "usuario_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Usuario usuario;

    public Comentario() {
    }

    public Comentario(ComentarioPK comentarioPK) {
        this.comentarioPK = comentarioPK;
    }

    public Comentario(int postId, int usuarioId) {
        this.comentarioPK = new ComentarioPK(postId, usuarioId);
    }

    public ComentarioPK getComentarioPK() {
        return comentarioPK;
    }

    public void setComentarioPK(ComentarioPK comentarioPK) {
        this.comentarioPK = comentarioPK;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (comentarioPK != null ? comentarioPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comentario)) {
            return false;
        }
        Comentario other = (Comentario) object;
        if ((this.comentarioPK == null && other.comentarioPK != null) || (this.comentarioPK != null && !this.comentarioPK.equals(other.comentarioPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Comentario[ comentarioPK=" + comentarioPK + " ]";
    }
    
}
